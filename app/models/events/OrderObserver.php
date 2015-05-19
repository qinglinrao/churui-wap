<?php

class OrderObserver {



    public function created($model){
        try{
            DB::beginTransaction();
            self:: changeCustomerOrderNum($model,1);
//            self::updateShopOwnerInfo($model);
//            self::updateBuyerPayInfo($model);
            DB::commit();
        }catch (Exception $e){
            DB::rollBack();
            throw $e;
        }

    }
    public function updated($model)
    {

//        try{
//            DB::beginTransaction();
//
//            //支付后
//            if($model->status_id == 2){
//                self::afterPayed($model);
//            }
//            DB::commit();
//        }catch (Exception $e){
//            DB::rollBack();
//            throw $e;
//        }


    }

    public function deleted($model)
    {
        try{
            DB::beginTransaction();
            self:: changeCustomerOrderNum($model,-1);
            DB::commit();
        }catch (Exception $e){
            DB::rollBack();
            throw $e;
        }
    }

//   //订单状态改变
//    public function afterPayed($model){
//        $products = $model->products;
//        foreach($products as $product){
//            if($product->ownShop){
//                $merchant = $product->ownShop->owner;
//                if($merchant){
//                    $merchant->order_num += 1;
//                    $merchant->total_pay += $product->total;
//                    $merchant->save();
//                }
//            }
//
//        }
//
//        //改变客户总交易额
//        $customer = $model->buyer;
//        if($customer){
//            $customer->order_total_pay += $model->total;
//            $customer->order_total_num += 1;
//            $customer->save();
//        }
//
//
//    }

    public function changeCustomerOrderNum($model,$num){
        $customer = $model->buyer;
        if($customer){
            $customer->order_total_num += $num;
            $customer->save();
        }
    }

    //修改店铺商家的总销售额及订单总数
    public function updateShopOwnerInfo($model){
        $order_customers = array(0);
        $products = $model->products;
        Log::info('订单---'.$model->id);
        foreach($products as $product){
            Log::info($product->name);
            if($product->ownShop){
                Log::info('店铺'.$product->ownShop->name);
                $merchant = $product->ownShop->owner;
                if($merchant && !in_array($merchant->id,$order_customers)){
                    array_push($order_customers,$merchant->id);
                    $merchant->order_num += 1;
                    $merchant->total_pay += $model->total;
                    Log::info('给'.$merchant->username.'--------'.$model->total);
                    $merchant->save();
                }
            }

        }
        Log::info('订单---'.$model->id.'------finished');

    }

    //修改客户的总支付额及总订单数
    public function updateBuyerPayInfo($model){
        Log::info('updateBuyerPayInfo');
        $customer = $model->buyer;
        if($customer){
            $customer->order_total_pay += $model->total;
            $customer->save();
        }
    }


}