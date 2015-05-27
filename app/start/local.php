<?php

function locations($loc_id = 0) {

    $loc = Region::remember(10)->find($loc_id);

    $princes_result = Region::provinces()->get();
    $provinces[0] = '--请选择--';

    foreach ($princes_result as $province) {
        $provinces[$province->id] = $province->name;
    };

    $cities[0] = '--请选择--';

    $districts[0] = '--请选择--';

    if ($loc) {
        $cities_result = Region::cities($loc->province_id)->get();

        foreach ($cities_result as $city) {
            $cities[$city->id] = $city->name;
        };

        $districts_result = Region::districts($loc->city_id)->get();
        foreach ($districts_result as $district) {
            $districts[$district->id] = $district->name;
        };
        /*
          $locs_result = Location::residents($loc->district_id)->get();
          foreach ($locs_result as $loc) {
          $locs[$loc->id] = $loc->name;
          };
         *
         */
    }
    $locations = array(
        'provinces' => $provinces,
        'cities' => $cities,
        'districts' => $districts,
        //'residents' => $locs,
        'default_p' => $loc ? $loc->province_id : '',
        'default_c' => $loc ? ($loc->city_id > 0 ? $loc->city_id : $loc->id) : '',
        'default_d' => $loc ? ($loc->city_id > 0 ? $loc->id : '') : '',
        //'default_r' => $loc ? $loc->id : '',
    );
    return $locations;
}

/**
 * 获取完整地址 省+市+县
 * @param $district_id
 * @return string
 */
function getFullRegionPath($district_id){
    $path = '';
    $district = Region::where('id',$district_id)->first();
    $path = $district->name.''.$path;
    if($district->City){
        $city = $district->City;
        $path = $city->name.' '.$path;
        if($city->Province){
            $province = $city->Province;
            $path = $province->name.' '.$path;
        }
    }else if($district->Province){
        $province = $district->Province;
        $path = $province->name.' '.$path;
    }
    return $path;
}

/**
 * 订单状态定义数组 （客户看到的订单状态）
 * @return array
 */
function get_order_status(){
    return array(
        1 => '待支付',
        2 => '待发货',
        3 => '已发货',
        4 => '待评论',
        5 => '已评论',
        6 => '退款/售后',
        7 => '商家已退款',
        8 => '退款成功',
        9 => '退款关闭',
        10 => '已拒绝',
        11 => '已取消',
        12 => '交易完成'
    );
}

/**
 * 根据status_id获取订单当前可采取的操作(查看订单列表时)
 * @param $order
 * @return string
 */
function get_order_deal_operate($order){
    switch($order->status_id){
        case 1:
            return   '<a id="cancel" href="'.route('order.status.update',array('id'=>$order->id,'status'=>11)).'"
            class="order-action" onclick="return confirm(\'您确定要取消订单吗？\')"><span>取消订单</span></a>'. '<a id="pay"
            href="'.route('orders.pay',array('id'=>$order->id)).'" class="order-action"><span>付款</span></a>';
            break;
//        case 1:
//            return   '<a id="cancel" href="'.route('order.status.update',array('id'=>$order->id,'status'=>11)).'"
//            class="order-action" onclick="return confirm(\'您确定要取消订单吗？\')"><span>取消订单</span></a>'. '<a id="pay"
//            href="'.route('order.status.update',array('id'=>$order->id,'status'=>2)).'" class="order-action"><span>付款</span></a>';
//            break;
        case 2:
            if(!$order->is_profited) {
                return  '<a id="cancel" href="'.route('order.status.update',array('id'=>$order->id,'status'=>6)).'" class="order-action" onclick="return confirm(\'您确定要退款？\')"><span>退款/售后</span></a>'. '<a id="pay" href="#" class="order-action" ><span>联系客服</span></a>';
            }else{
                return  '<a id="pay" href="#" class="order-action" ><span>联系客服</span></a>';
            }

            break;
        case 3:
//            return  '<a id="cancel" href="#" class="order-action"><span>查看物流</span></a>'. '<a id="pay" href="'.route('order.status.update',array('id'=>$order->id,'status'=>4)).'" class="order-action" onclick="return confirm(\'您确定已经收到货物？\')"><span>确认收货</span></a>';
            return  '<a id="pay" href="'.route('order.status.update',array('id'=>$order->id,'status'=>4)).'" class="order-action" onclick="return confirm(\'您确定已经收到货物？\')"><span>确认收货</span></a>';
            break;
        case 4:
            return  '<a id="pay" href="'.route("orders.comment", array('id' => $order->id)).'" class="order-action"><span>评价</span></a>';
            break;
        case 6:
//            return  '<a id="pay" href="#" class="order-action"><span>查看进度</span></a>';
            break;
        case 7:
//            return   '<a id="pay" href="#" class="order-action"><span>查看进度</span></a>'.'<a id="pay" href="'.route('order.status.update',array('id'=>$order->id,'status'=>8)).'" class="order-action" onclick="return confirm(\'您确定已收到款项？\')" ><span>确认收款</span></a>';
            return  '<a id="pay" href="'.route('order.status.update',array('id'=>$order->id,'status'=>8)).'" class="order-action" onclick="return confirm(\'您确定已收到款项？\')" ><span>确认收款</span></a>';
            break;


    }
}


/**
 * 根据status_id获取订单当前可采取的操作(查看订单详情时)
 * @param $order
 * @return string
 */
function get_order_detail_operate($order){
    switch($order->status_id){
        case 1:
            return  '<a id="cancel" href="'.route('order.status.update',array('id'=>$order->id,'status'=>11)).'"
            class="order-action" onclick="return confirm(\'您确定要取消订单吗？\')"><span>取消订单</span></a>'. '<a id="pay"
            href="'.route('orders.pay',array('id'=>$order->id)).'" class="order-action"><span>付款</span></a>';
            break;
        case 2:
            if(!$order->is_profited){
                return  '<a id="cancel" href="'.route('order.status.update',array('id'=>$order->id,'status'=>6)).'" class="order-action" onclick="return confirm(\'您确定要退款？\')"><span>退款/售后</span></a>'. '<a id="pay" href="#" class="order-action" ><span>联系客服</span></a>';
            }else{
                return  '<a id="pay" href="#" class="order-action" ><span>联系客服</span></a>';
            }

            break;
        case 3:
//            return  '<a id="cancel" href="#" class="order-action"><span>查看物流</span></a>'. '<a id="pay" href="'.route('order.status.update',array('id'=>$order->id,'status'=>4)).'" class="order-action" onclick="return confirm(\'您确定已经收到货物？\')"><span>确认收货</span></a>';
            return  '<a id="pay" href="'.route('order.status.update',array('id'=>$order->id,'status'=>4)).'" class="order-action" onclick="return confirm(\'您确定已经收到货物？\')"><span>确认收货</span></a>';
            break;
        case 4:
            return  '<a id="pay" href="'.route("orders.comment", array('id' => $order->id)).'" class="order-action"><span>评价</span></a>';
            break;
        case 6:
//            return  '<a id="pay" href="#" class="order-action"><span>查看进度</span></a>';
            break;
        case 7:
//            return   '<a id="pay" href="#" class="order-action"><span>查看进度</span></a>'.'<a id="pay" href="'.route('order.status.update',array('id'=>$order->id,'status'=>8)).'" class="order-action" onclick="return confirm(\'您确定已收到款项？\')" ><span>确认收款</span></a>';
            return   '<a id="pay" href="'.route('order.status.update',array('id'=>$order->id,'status'=>8)).'" class="order-action" onclick="return confirm(\'您确定已收到款项？\')" ><span>确认收款</span></a>';
            break;

    }
}

/**
 * 根据订单组别编号来获取相应的订单状态数组
 * @param $id
 * @return array
 */
function get_order_status_group($id){
    $status_group = array(
        1 => array(1), //待支付
        2 => array(2), //待发货
        3 => array(3), //待收货
        4 => array(4), //待评论
        5 => array(5), //已评论
        6 => array(6), //售后/退款
        7 => array(6,7,8,9), //售后/退款(包括退款成功,退款关闭)
        8 => array(10,11),
        9 => array(12), //已分润
        10 => array(1,2,12)

    );
    if($id <= 10){
        return $status_group[$id];
    }else{
        return array($id);
    }


}

/**
 * 将 "'1'"格式的字符串 转为 1 ()
 * @param $str
 * @return int
 */
function strToInt($str){
    $str = str_replace('"','',$str);
    return intval($str);
}

/** 改变订单状态操作合法性
 * @param $order_status 订单当前状态
 * @param $action_status 要置换的状态
 * @return bool
 */
function confirm_order_action($order_status,$action_status){
    $actions = array(
        1 => array(11,2), //下单之后 -> (11) 取消订单 (2) 支付订单
        2 => array(6), //支付之后 ->  (6) 退款/售后
        3 => array(4), //发货后  -> (4) 收货
        4 => array(5), //收货后 -> (5) 评论
        5 => array(), //评论完 -> 无
        6 => array(), //退款售后 -> 无
        7 => array(8), //商家已退款 -> (8) 确认收款
        8 => array(), //收款之后 -> 无
        9 => array(), //退款关闭
        10 => array() //用户取消订单后

    );
    if($actions[$order_status]){
        return in_array($action_status,$actions[$order_status]);
    }else{
        return false;
    }

}


/**
 * 订单产品实体选项集值
 * @param $option_set
 * @return string
 */
function order_product_option_sets($option_set){
    $html = '';
    if($option_set){
        $arr = json_decode($option_set);
        if(count($arr)){
            foreach($arr as $option){
                $html = $html.$option->name.':'.$option->val." ";
            }
        }
    }
    return $html;

}

/**
 * 订单状态定义数组 （商家看到的订单状态）
 * @return array
 */
function get_status_name(){
    return array(
        1 => '买家已下单',
        2 => '买家已付款',
        3 => '商家已发货',
        4 => '物流签收',
        5 => '买家已评论',
        6 => '买家已申请退款',
        7 => '商家已退款',
        8 => '已确认到帐',
        9 => '商家拒绝退款',
        10 => '商家关闭订单',
        11 => '买家取消订单',
        12 => '已分润'
    );
}

/**
 * 计算订单中产品总数
 * @param $order
 * @return int
 */
function get_order_product_num($order){
    $total = 0;
    $order_products = $order->products;
    foreach($order_products as $order_product){
        $total += $order_product->quantity;
    }
    return $total;
}

/**
 * 计算订单中实际产品总价
 * @param $order
 * @return int
 */
function get_order_total_price($order){
    $total = 0;
    $order_products = $order->products;
    foreach($order_products as $order_product){
        $total += $order_product->quantity*$order_product->price;
    }
    return $total;
}

/**
 * 从连接中获取邀请码
 */
function get_merchant_id_from_url()
{
    if (Input::has('MID')) {
        Session::put('MID', Input::get('MID'));
    } else if (!Session::has('MID')) {
        Session::put('MID', 0);
    }

    if (Input::has('JC')) {
        Session::put('JC', Input::get('JC'));
    } else if (!Session::has('JC')) {
        Session::put('JC', 0);
    }
}
/**
 * 判断邀请码MID是否正确
* @param $mid
 * @return int|mixed
 */
function judge_right_MID($mid){
    $mid = base64_decode($mid);
    $merchant = Merchant::where('id',$mid)->first();
    if($merchant){
        return $merchant->id;
    }else{
        return 0;
    }
}

//提现申请处理状态
function account_log_status(){
    return array(
        '0' => '已拒绝',
        '1' => '处理中',
        '2' => '已提现'
    );
}

/**  提现账户日志记录类型 数组
 * @return array
 */
function account_log_type(){
    return array(
        '1' => '提现',
        '2' => '佣金'
    );
}

/** 获取商家等级表示的字符串如“代理商”=>“agent”.“门店”=>“store”.“BA”=>“ba”
 * @param $merchant 商家
 * @return string 商家等级字符串
 */
function get_merchant_grade($merchant){
    if($merchant->merchant_grade ==  1){
        return'agent';
    }else if($merchant->merchant_grade == 2){
        return 'store';
    }else if($merchant->merchant_grade ==  3){
        return 'ba';
    }
}



/**
 * 计算产品分润 （如果商品由该商家卖出,总利润=商家本等级利润+下线等级利润;
 *              否则,总利润=商家本等级利润）
 * @param $product
 * @param $merchant 要分润的商家
 * @param $flag 是否由该商家卖出产品
 * @return float|int
 */
function get_product_profit_churui($product,$merchant,$flag,$x){

    if($flag){
        return $product['three_profit']/100.0*$product->profit;
    }else{

        switch($x){
            case 1:
                return $product['three_profit']/100.0*$product->profit;
                break;
            case 2:
                return $product['two_profit']/100.0*$product->profit;
                break;
            case 3:
                return $product['first_profit']/100.0*$product->profit;
                break;
        }
    }
}

function get_product_profit($product,$merchant,$flag){
    if($flag){
        switch(get_merchant_grade($merchant)){
            case 'ba':
                return $product['ba_profit']/100.0*$product->profit;
                break;
            case 'store':
                return ($product['ba_profit']+$product['store_profit'])/100.0*$product->profit;
                break;
            case 'agent':
                return ($product['ba_profit']+$product['store_profit']+$product['agent_profit'])/100.0*$product->profit;
                break;
        }
    }else{
        return $product[get_merchant_grade($merchant).'_profit']/100.0*$product->profit;
    }
}

/**
 * 计算该订单的总利润
 * @param $order
 * @param $merchant
 * @return float|int
 */
function get_total_profit($order,$merchant){
    $total =  0;
    $order_products = $order->products;
    foreach($order_products as $order_product){
        $product = $order_product->product;
        $total += get_product_profit($product,$merchant,true)*$order_product->quantity;
    }
    return $total;
}

/**
 *  商家订单列表看到的订单状态
 * @param $order
 * @return string
 */
function get_merchant_orders_status($order){
    if($order->is_profited){
        return '<div class="paybutton03">已分润</div>';
    }else{
        if($order->status_id == 1){
            return '<div class="paybutton02">未支付</div>';
        }else if($order->status_id == 2){
            return '<div class="paybutton01">已支付</div>';
        }else{
            return '<div class="paybutton01">'.get_order_status()[$order->status_id].'</div>';
        }
    }
}

/** 获取店铺商品编号
 * @param $shop_id 店铺编号
 * @param $product_id 产品编号
 * @return int|mixed
 */
function get_shop_product_id($shop_id,$product_id){
    $shop_product = ShopProduct::where('shop_id',$shop_id)->where('product_id',$product_id)->first();

    if($shop_product) return $shop_product->id;
    else return 0;
}

/**
 * 获取产品详情页返回链接
 *  如果商品来源店铺则返回店铺首页链接，否则返回商城首页链接
 * @return string|void
 */
function get_home_link(){

    $mid = judge_right_MID(Session::get('MID'));
    if($mid){
        $merchant = Merchant::with('ownShop')->where('id',$mid)->first();
        return URL::route('shop',array('id'=>$merchant->ownShop->id));
    }else{
        return '/';
    }
}

/**
 * 判断文件夹是否存在，如不存在则创建并给予777权限
 * @param $path
 */
function mkFolder($path)
{
    if(file_exists($path)){
        if(is_dir($path)){
            chmod($path, 0777);
        }else{
            mkdir($path,0777,true);
            chmod($path, 0777);
        }
    }else{
        mkdir($path,0777,true);
        chmod($path, 0777);
    }
}

/**
 *  获取商家及客户中文显示名称
 * @param $type
 * @param bool $sc
 * @return string
 */
function get_follow_link_name($type,$sc=false){
    if($sc){
        return '顾客';
    }
    /*switch($type){
        case 1:
            return '代理商';
            break;
        case 2:
            return '门店';
            break;
        case 3:
            return 'BA';
            break;
        case 4:
            return '客户';
            break;
    }*/

    switch($type){
        case 1:
            return '代理商';
            break;
        case 2:
            return '代理商';
            break;
        case 3:
            return '代理商';
            break;
        case 4:
            return '客户';
            break;
    }
}

function get_account_log_status($status){
    switch($status){
        case 1:
            return '处理中'; break;
        case 2:
            return '已完成'; break;
        case 0:
            return '已拒绝'; break;
    }
}

/**
 *  判断已登录商家帐号与要显示的商家信息是否一致
 * @param $leader
 * @return string
 */
function get_owner_merchant_name($leader){
   if($leader){
       return $leader->id == Auth::merchant()->user()->id ? '我': $leader->username;
   }
    return '未知';
}

/**
 * 获取地区省列表
 * @param int $country_id
 * @return mixed
 */
function get_all_provinces($country_id = 1){

    return Region::where('country_id',$country_id)->provinces()->lists('name','id');
}

/**
 * 获取分类下的产品列表
 * @param $category
 * @return mixed
 */
function get_category_products($category)
{
    $catIds = array_merge([$category->id], $category->children()->lists('id'));
    return Product::with('image')->visible()->displayType(0)->whereIn('category_id', $catIds)->orderBy('created_at', 'desc')->take(4)->get();
}




