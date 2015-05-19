<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-3-17
 * Time: 上午11:17
 */

class PaymentController extends BaseController{

    public function getPay(){
        $order_id = Input::get('id');

        $order = Order::customer()->where('id',$order_id)->first();

        if(!$order){
            App::abort(404);
        }

        if($order->status_id != 1){
            return Response::make('该订单不处于等待支付状态，不能支付!');
        }else{

            //根据支付方式调用相应支付方法

            switch($order->payment_method){

                case 'ALIPAY':
                    $alipay = $this->_getAlipay($order);
                    return Response::make($alipay);
                    break;

                case 'WXPAY':
                    $wxpay = $this->_getWxpay($order);
                    return Response::make($wxpay);
                    break;
            }
        }



    }

    //微信jsApi支付
    private function _getWxpay($order){

        $config = $this->_getWxpayConfig($order);

        $page = Wxpay::instance('jsApi')->setConfig($config)->pay();

        return $page;
    }

    private function _getWxpayConfig($order){

//        $site = Site::find(SITE_ID);

        $config = [
            'notify_url'	=> URL::route('orders.notify.wxpay'),
            'return_url'	=> URL::route('orders'),
            'appid'         => 'wxb7f13261ea23b141',
            'mchid'        => '10022080',
            'key'           => 'Sunnsoft2013Isunn2014Mcmore20150',
            'app_secret'    => '85145317b20343c68346b62fafffa925',
        ];


//        10001.mcshop.com.cn/weixintest/


//        $paymentConfig = json_decode($site->payment);

//        if($paymentConfig){
//            $config = array_merge($config, [
////                'appid'         => isset($paymentConfig->appid) ? $paymentConfig->appid : '',
////                'mch_id'        => isset($paymentConfig->mch_id) ? $paymentConfig->mch_id : '',
////                'key'           => isset($paymentConfig->key) ? $paymentConfig->key : '',
////                'app_secret'    => isset($paymentConfig->app_secret) ? $paymentConfig->app_secret : '',
//                'appid'         => 'wxb7f13261ea23b141',
//                'mch_id'        => '10022080',
//                'key'           => 'Sunnsoft2013Isunn2014Mcmore20150',
//                'app_secret'    => '85145317b20343c68346b62fafffa925',
//            ]);
//        }

        if($order){
            $config = array_merge($config,[
                "out_trade_no"	=> $order->order_sn,
                "body"	        => '1232',
//                "total_fee"	    => (int)($order->should_pay === null ? $order->total : $order->should_pay) * 100,
                "total_fee"	    =>  $order->total * 100,
                //支付单位为：分
            ]);
        }

        return $config;

    }



    //wap支付宝支付
    private function _getAlipay($order){


        $config = $this->_getAlipayConfig($order);

        $wap = Alipay::instance('wap');

        //$url = $wap->setConfig($config)->buildRequestUrl();
        //Return Redirect::to($url);

        $form = $wap->setConfig($config)->buildRequestForm();
        return $form;

    }

    private function _getAlipayConfig($order = false){

//        $site = Site::find(SITE_ID);
//
//        $config = [
//            "notify_url"	=> URL::route('orders.notify.alipay'),
//            "call_back_url"	=> URL::route('orders'),
//        ];
//
//        $paymentConfig = json_decode($site->payment);
//
//        if($paymentConfig){
//            $config = array_merge($config, [
//                'partner'       => isset($paymentConfig->partner) ? $paymentConfig->partner : '',
//                'seller_email'  => isset($paymentConfig->alipay_account) ? $paymentConfig->alipay_account : '',
//                'sign_type'     => isset($paymentConfig->sign_type) ? $paymentConfig->sign_type : '',
//                'key'           => isset($paymentConfig->key) ? $paymentConfig->key : '',
//            ]);
//        }
//
//        if($order){
//            $config = array_merge($config,[
//                "out_trade_no"	=> $order->order_sn,
//                "subject"	    => $order->order_title,
//                "total_fee"	    => $order->should_pay === null ? $order->total : $order->should_pay,
//            ]);
//        }


        $config = [
            "notify_url"	=> URL::route('orders.notify.alipay'),
            "call_back_url"	=> URL::route('orders'),
            'partner'       => '2088412354026973',
            'seller_email'  => '188811738@qq.com',
            'sign_type'     => 'MD5',
            'key'           =>  'yfbngluafy05qdlruvcn06l4aax19he1',
        ];

        if($order){
            $config = array_merge($config,[
                "out_trade_no"	=> $order->order_sn,
                "subject"	    => $order->order_title,
                "total_fee"	    => $order->total,
            ]);
        }

        return $config;

    }

    /**
     *===================支付回调=========================================================
     */

    //微信支付回调
    public function postWxpayNotify(){
        $config = $this->_getWxpayConfig(false);

        $wxpay = Wxpay::instance('jsApi')->setConfig($config);
       // $wxpay = Wxpay::instance('jsApi');

        if($wxpay->verifyNotify()){

            $notifyData = $wxpay->getData();
            $order = Order::orderSn($notifyData['out_trade_no'])->waitingPay()->first();

            if($order){
                //更新订单状态
                $order->status_id = 2;
                $order->status_name = '待发货';
                $order->pay_at = Carbon::now();
                $order->is_payed = 1;

                //将微信的一些信息保存至订单
                $order->trade_no = $notifyData['transaction_id'];
                $order->notify_data = json_encode($notifyData);

                if($order->save()){
                    $order_customers = array(0);
                    $products = $order->products;
                    foreach($products as $product){
                        if($product->ownShop){
                            $merchant = $product->ownShop->owner;
                            if($merchant && !in_array($merchant->id,$order_customers)){
                                array_push($order_customers,$merchant->id);
                                $merchant->order_num += 1;
                                $merchant->total_pay += $order->total;
                                $merchant->save();
                            }
                        }

                    }

                    $customer = $order->buyer;
                    if($customer){
                        $customer->order_total_pay += $order->total;
                        $customer->save();
                    }
                    return Response::make('success');
                }else{
                    Log::error('order: Order(id='.$order->id.') update error!!!');
                };

            }else{
                Log::error('order：'.$notifyData->out_trade_no.' not exit or not in waiting pay status!!!');
            }

            $wxpay->setReturnParameter("return_code","SUCCESS");//设置返回码
            $return = $wxpay->returnXml();

        }else{

            $wxpay->setReturnParameter("return_code","FAIL");//返回状态码
            $wxpay->setReturnParameter("return_msg","签名失败");//返回信息
            $return = $wxpay->returnXml();

        }

        return Response::make($return);
    }

    //支付宝支付回调
    public function postAlipayNotify(){
        $config = $this->_getAlipayConfig();

        $wap = Alipay::instance('wap');

        $notifyResult = $wap->setConfig($config)->verifyNotify();

        $notifyData = $wap->getNotifyData();
        if($notifyResult == true){

            $order = Order::orderSn($notifyData->out_trade_no)->first();

            if($order){
                //更新订单状态
                $order->status_id = 2;
                $order->status_name = '待发货';
                $order->pay_at = Carbon::now();
                $order->is_payed = 1;

                //将支付宝的一些信息保存至订单
                $order->trade_no = $notifyData->trade_no;
                $order->notify_data = json_encode($notifyData);

                if($order->save()){


                    $order_customers = array(0);
                    $products = $order->products;
                    foreach($products as $product){
                        if($product->ownShop){
                            $merchant = $product->ownShop->owner;
                            if($merchant && !in_array($merchant->id,$order_customers)){
                                array_push($order_customers,$merchant->id);
                                $merchant->order_num += 1;
                                $merchant->total_pay += $order->total;
                                $merchant->save();
                            }
                        }

                    }

                    $customer = $order->buyer;
                    if($customer){
                        $customer->order_total_pay += $order->total;
                        $customer->save();
                    }
                    die('success');
                }else{
                    Log::error('order: Order(id='.$order->id.') update error!!!');
                };

            }else{
                Log::error('order：'.$notifyData->out_trade_no.' not exit!!!');
            }

        }else{
            Log::error('order：'.$notifyData->out_trade_no.' notify result is false!!!');
        }

    }

}