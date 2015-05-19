<?php

class AppHelper {

    const ENC_UTF8 = 'utf8';

    public static function getSiteId(){

        // TODO get site id
        return 1;

    }


    /**
     * Print a price number
     * @param $a_price Price number to be printed
     * @param $default Default to return
     * @return Price formatted string
     */
    public static function price(/* Decimal */ $a_price, /* Decimal */ $default = 0) {
        return $a_price !== null ? sprintf("%01.2f", $a_price) : $default;
    }

    public static function money(/* Decimal */ $a_price, /* Decimal */ $default = 0) {
        return $a_price !== null ? sprintf("%01.2f", $a_price) : $default;
    }

    /**
     * Calculate the difference between two time
     * @param $time1 Time instance 1 to be calculate
     * @param $time2 Time instance 2 to be calculate
     * @param $abs True to return absolute result, or real result other wise
     * @return  Timestamp difference between two time object($time1 - $time2)
     */
    public static function diffTime(/* DateTime or Integer */ $time1, /* DateTime or Integer */ $time2 = null, $abs = true) {
        $t1 = AppHelper::convertToTime($time1);
        $t2 = AppHelper::convertToTime($time2);
        return $abs ? abs($t1 - $t2) : ($t1 - $t2);
    }

    /**
     * Get count down time base on current timestamp
     * @param $time Time to be count down
     * @param $base Count down base on which time
     * @return Timestamp between $time - $base, no less than 0
     */
    public static function countDown(/* DateTime or Integer */ $time, $base = null) {
        return max(0, AppHelper::diffTime($time, $base === null ? time() : $base, false));
    }

    /**
     * Display a timestamp in a H:i:s format use hour as time unit!
     */
    public static function timeunit(/* Long */ $time) {
        if ($time == null)
            return '';
        $sec = (int) $time % 60;
        $min = (int) ($time / 60) % 60;
        $hours = (int) ($time / 3600);
        return "$hours:" . sprintf('%02d', $min) . ':' . sprintf('%02d', $sec);
    }

    /**
     * Generate an image tag
     * @param $thumb Image object
     * @param $alter_url If the path is not set
     * @param $options Other options
     * @return Return an image tag with the image displayed
     */
    public static function thumb(/* Image */ $thumb, $options = array()) {
        $alt = AppHelper::getOption($options, 'alt', isset($thumb->alt) ? $thumb->alt : null);
        $alter_url = AppHelper::getOption($options, 'alter_url');
        $url = isset($thumb->url) ? $thumb->url : $alter_url;
        return AppHelper::img($url, $alt, $options);
    }

    /**
     * Generate an image tag by a given URL
     * @param $url String Image URL
     * @param $options Other options
     * @return Return an image tag with the image displayed
     */
    public static function thumbByUrl(/* Image */ $url, $options = array()) {
        $alt = AppHelper::getOption($options, 'alt');
        return AppHelper::img($url, $alt, $options);
    }

    /**
     * Generate a date string for sql search
     * @param $date Date to be converted
     * @param $format Format to convert the $date into, default is 'Y-m-d'
     * @return Date string
     */
    public static function sqldate($date, $format = 'Y-m-d') {
        if (!isset($date))
            return null;
        $fmtdate = $date->format($format);
        return DB::raw("date('$fmtdate')");
    }

    /**
     * Common Image tag
     * @param $url Url of the image
     * @param $alt Alt attribute value
     * @param $options Other options
     * @return Return HTML to the image. Or null if nothing
     */
    public static function img(/* String */ $url, $alt = null, $options = array()) {
        $type = AppHelper::getOption($options, 'type') ? AppHelper::getOption($options, 'type') : 'c';
        $width = AppHelper::getOption($options, 'width');
        $height = AppHelper:: getOption($options, 'height');
        $alter_url = AppHelper::getOption($options, 'alter_url');
        $combined_url = isset($url) ? $url : $alter_url;
        if ($width && $height && is_numeric($width) && is_numeric($height)) {
            $size_url = "/$type/{$width}x{$height}";
        } else {
            $size_url = '';
        }

        $fixed_url =  $size_url . $combined_url;
        if(strstr($size_url . $combined_url,"http")){

            $fixed_url =  $size_url . $combined_url;
            Log::info($fixed_url);
        }else{
            $fixed_url = URL::asset(Config::get('app.image_domain') . $size_url . $combined_url);
        }


        return HTML::image($fixed_url, $alt, $options);
    }

    public static function imgSrc(/* String */ $url, $options = array()) {
        $type = AppHelper::getOption($options, 'type') ? AppHelper::getOption($options, 'type') : 'c';
        $width = AppHelper::getOption($options, 'width');
        $height = AppHelper:: getOption($options, 'height');
        $alter_url = AppHelper::getOption($options, 'alter_url');
        $combined_url = $url ? $url : $alter_url;
        if ($width && $height) {
            $size_url = "/$type/{$width}x{$height}";
        } else {
            $size_url = '';
        }
        $fixed_url =  $size_url . $combined_url;
        if(strstr($size_url . $combined_url,"http")){
            $fixed_url =  $size_url . $combined_url;
        }else
            $fixed_url = URL::asset(Config::get('app.image_domain') . $size_url . $combined_url);

        return $fixed_url;
    }

    /**
     * Get option value from options
     * @param $options Option values
     * @param $key Option key
     * @param $default If option has not cotain key, this value will be returned instead
     * @return $options[$key] or $default if previous is null
     */
    public static function getOption($options, $key, $default = null) {
        return key_exists($key, $options) ? array_pull($options, $key) : $default;
    }

    /**
     * Try to convert an object to timestamp. Only works on DateTime or integer type
     * @param $time A DateTime object or integer
     * @param $default Default value to return if the given $time could not convert
     * return Timestamp in integer format, or 0 if could not convert
     */
    public static function convertToTime(/* Object */ $time, /* Integer */ $default = 0) {
        $t = $default;
        #It's an integer, just consider it would be a timestamp
        if (gettype($time) === 'integer')
            $t = $time;
        #It's a string! We'll try to parse it to timestamp with Carbon
        elseif (gettype($time) === 'string')
            $t = Carbon::parse($time)->timestamp;
        #It's a DateTime object, use getTimestamp 
        elseif (method_exists($time, 'getTimestamp'))
            $t = $time->getTimestamp();
        #Carbon format
        elseif (isset($time->timestamp))
            $t = $time->timestamp;
        return $t;
    }

    /**
     * Make the string with ellipse character if it exceeds the demanded length
     * @param $str String to be operated on
     * @param $len Demand length
     * @param $ellipse_char Ellipse characer
     * @return If the string's length is larger than the $len, it'll be first trim to strlen($str) - $strlen($ellipse_char), and then join the $ellipse_char
     *      , or the original string returns
     */
    public static function ellipse(/* String */ $str, $len = 12, $ellipse_char = '...') {
        $ellipse_char_len = mb_strlen($ellipse_char, self::ENC_UTF8);
        $trim_to_len = $len - $ellipse_char_len;
        return mb_strlen($str, self::ENC_UTF8) > $len ? mb_substr($str, 0, $trim_to_len, self::ENC_UTF8) . $ellipse_char : $str;
    }

    /**
     * Make filter url (multi select)
     * @param $filter Array
     * @param $name String Url name
     * @param $catecode Category Code
     * @return return a filter url
     */
    public static function filterUrl($filter = array(), $name = '', $catcode) {
        $query = Request::query();
        $filters = array();

        if (Input::has('filters')) {
            $filters = explode('|', Input::get('filters'));
            $f1 = array_merge($filters, $filter);
            $f2 = array_intersect($filters, $filter);
            $filters = array_diff($f1, $f2);
            sort($filters);
        } else {
            $filters = $filter;
        }

        if (empty($filters)) {
            unset($query['filters']);
        } else {
            $query['filters'] = implode('|', $filters);
        }


        $querystring = $query ? '?' : '';
        foreach ($query as $key => $q) {
            $querystring .= "$key=$q&";
        }

        $url = URL::to($catcode) . rtrim($querystring, '&');

        $active = empty($f2) ? '' : 'active';

        return "<a class='filter $active' href='$url'>$name</a>";
    }

    /**
     * Make filter url (single select)
     * @param $filter Array
     * @param $name String Url name
     * @param $catecode Category Code
     * @param $param_values Array Current param values
     * @param $params Category Params
     * @return return a filter url
     */
    public static function filterUrlSingle($filter = array(), $name = '', $catcode, $param_values, $params) {


        $filters = $t0 = $filters_sort = array();
        $queryparams = Request::segment(2);

        if ($queryparams) {

            $filters = AppHelper::getFilters();

            $t0 = array_intersect($filters, $filter);

            $f1 = array_intersect($filters, $param_values);
            $f2 = array_diff($filters, $f1);

            $filters = array_merge($f2, $filter);
            $filters = array_diff($filters, $t0);

            foreach ($params as $param) {
                $filters_sort = array_merge($filters_sort, array_intersect($param->values()->lists('id'), $filters));
                //var_dump($param->values()->lists('id'));
            }

            //dd($filters_sort);
            sort($filters_sort);
            $filters = $filters_sort;
        } else {
            $filters = $filter;
        }

        if (empty($filters)) {
            $filter_segment = '';
        } else {
            $filter_segment = implode('_', $filters);
            $filter_segment .= '/';
        }

        $url = URL::to($catcode) . "/$filter_segment";

        $active = $t0 ? 'active' : '';

        return "<a class='filter $active' href='$url'>$name</a>";
    }

    public static function getFilters() {

        $query = Request::segment(2);

        if (preg_match("/page-[0-9]+$/", $query, $match)) {
            $query = Request::segment(3);
        };

        $filters = array();
        if ($query) {
            $filters = explode('_', $query);
        }
        return $filters;
    }

    /**
     * Products List pages filter form action
     * @return return an action url
     */
    public static function filterFormAction() {

        $query = Request::segments();


        foreach ($query as $k => $q) {
            if (preg_match("/page-[0-9]+$/", $q, $match)) {
                unset($query[$k]);
            };
        }
        $query = implode('/', $query);
        $url = Request::root() . "/$query/";

        return $url;
    }

    /**
     *  Search with keywords
     */
    public static function search($kw = null) {
        return AppHelper::qs_url('search', $kw == null ? null : array('keyword' => $kw));
    }

    /**
     * Generate a querystring url for the application.
     *
     * Assumes that you want a URL with a querystring rather than route params
     * (which is what the default url() helper does)
     *
     * @param  string  $path
     * @param  mixed   $qs
     * @param  bool    $secure
     * @return string
     */
    public static function qs_url($path = null, $qs = array(), $secure = null) {
        $url = app('url')->to($path, $secure) . '/';
        if (count($qs)) {

            foreach ($qs as $key => $value) {
                $qs[$key] = sprintf('%s=%s', $key, urlencode($value));
            }
            $url = sprintf('%s?%s', $url, implode('&', $qs));
        }
        return $url;
    }

    /**
     * Page title format
     * @param $title String  page title
     * @param $default String default title
     * @return return a new format
     */
    public static function pageTitle($title, $default = '') {

        $title = $title == null ? $default : $title;
        return $title . '-' . Config::get('app.sitename');
    }

    /**
     * Product Url
     * @param $product Object  Product object
     * @return an url of the product
     */
    public static function ProdUrl($product) {

        return AppHelper::UrlTo(false, $product->cat->code . '-goods-' . $product->id);
    }

    /**
     * Send a POST requst using cURL
     * @param string $url to request
     * @param array $post values to send
     * @param array $options for cURL
     * @return string
     */
    public static function CurlPost($url, array $post = array(), array $options = array()) {
        $defaults = array(
            CURLOPT_POST => 1,
            CURLOPT_HEADER => 0,
            CURLOPT_URL => $url,
            CURLOPT_FRESH_CONNECT => 1,
            CURLOPT_RETURNTRANSFER => 1,
            CURLOPT_FORBID_REUSE => 1,
            CURLOPT_FOLLOWLOCATION => 1,
            CURLOPT_TIMEOUT => 4,
            CURLOPT_POSTFIELDS => http_build_query($post)
        );

        $ch = curl_init();
        curl_setopt_array($ch, ($options + $defaults));
        if (!$result = curl_exec($ch)) {
            trigger_error(curl_error($ch));
        }

        curl_close($ch);
        // var_dump(curl_getinfo($ch)); exit;


        return $result;
    }

    /**
     * Send a GET requst using cURL
     * @param string $url to request
     * @param array $get values to send
     * @param array $options for cURL
     * @return string
     */
    public static function CurlGet($url, array $get = NULL, array $options = array()) {
        $defaults = array(
            CURLOPT_URL => $url . (strpos($url, '?') === FALSE ? '?' : '') . http_build_query($get),
            CURLOPT_HEADER => 0,
            CURLOPT_RETURNTRANSFER => TRUE,
            CURLOPT_TIMEOUT => 4
        );

        $ch = curl_init();
        curl_setopt_array($ch, ($options + $defaults));
        if (!$result = curl_exec($ch)) {
            trigger_error(curl_error($ch));
        }
        curl_close($ch);
        return $result;
    }

    /**
     * Get Product's comment count
     * @param $pid Int Product ID
     * @return Comment count
     */
    public static function ProdCommCount($pid) {

        $count = Product::with('comments')->remember(10)->find($pid)->comments->count();

        return $count;
    }

    /**
     * Get Month sales count
     * @param $product object
     * @return count
     */
    public static function MonthSale($product) {

        $count = $product->buylogs()->where('created_at', '>=', Carbon::now()->subDays(30))->sum('amount');

        return $count ? $count : 0;
    }

    /**
     * Get Point
     * @param $pid Product ID
     * @param $num int product number
     * @return return points
     */
    public static function getPoint($pid, $num) {

        $product = Product::find($pid);
        $prod_point = $product->prices()->where('amount_from', '<=', $num)->orderBy('amount_from', 'DESC')->first();
        $point = 0;
        if ($prod_point) {
            $rate_point = floor($prod_point->sale_price * $prod_point->point_rate * $num);
            $point = $rate_point > $prod_point->point_amount ? $rate_point : $prod_point->point_amount;
        }


        return $point;
    }

    /**
     * Get Order Price
     * @param $pid Product ID
     * @param $num int product number
     * @return return points
     */
    public static function getOrderPrice($pid, $num) {

        $product = Product::find($pid);

        $prod_price = $product->prices()->where('amount_from', '<=', $num)->orderBy('amount_from', 'DESC')->first();
        $price = 0;
        if ($prod_price) {
            $rate_price = $prod_price->sale_price * $prod_price->order_rate * $num;
            $price = $rate_price > $prod_price->order_price ? $rate_price : $prod_price->order_price;
        }


        return $price;
    }

    /**
     * Generate a absolute URL to the given path with suffix.
     *
     * @param  bool  $is_dir Is a directry or not
     * @param  string  $path
     * @param  mixed  $extra
     * @param  bool  $secure

     * @return string
     */
    public static function UrlTo($is_dir = false, $path, $extra = array(), $secure = null) {
        $root = URL::to($path, $extra, $secure) . ($is_dir ? '/' : Config::get('app.url_suffix', ''));
        return AppHelper::removeIndex($root);
    }

    /**
     * Get the URL to a named route.
     *
     * @param  bool  $is_dir Is a directry or not
     * @param  string  $name
     * @param  mixed   $parameters
     * @param  bool  $absolute
     * @param  \Illuminate\Routing\Route  $route
     * @return string
     *
     * @throws \InvalidArgumentException
     */
    public static function UrlRoute($is_dir = false, $name, $parameters = array(), $absolute = true, $route = null) {
        $url = URL::route($name, $parameters, $absolute, $route);
//        if(strpos($url,'?')){
//            $root = strstr($url, '?',true).Config::get('app.url_suffix', '').strstr($url, '?',false);
//        }else{
//            $root = $url . ($is_dir ? '/' : Config::get('app.url_suffix', ''));
//        }
        return AppHelper::removeIndex($url);
    }

    /**
     * Get the URL to a controller action.
     *
     * @param  bool  $is_dir Is a directry or not
     * @param  string  $action
     * @param  mixed   $parameters
     * @param  bool    $absolute
     * @return string
     */
    public static function UrlAction($is_dir = false, $action, $parameters = array(), $absolute = true) {
        $root = URL::action($action, $parameters, $absolute) . ($is_dir ? '/' : Config::get('app.url_suffix', ''));
        return AppHelper::removeIndex($root);
    }

    /**
     * Remove the index.php file from a path.
     *
     * @param  string  $root
     * @return string
     */
    public static function removeIndex($root) {
        $i = 'index.php';

        return str_contains($root, $i) ? str_replace('/' . $i, '', $root) : $root;
    }

    /**
     * Get all locationis.
     *
     * @return locatioins array
     */
    public static function Locations() {
        if (Cache::has('locations')) {
            return Cache::get('locations');
        }
        $locations['provices'] = Region::provinces()->get()->toJson();
        $locations['cities'] = Region::allcities()->get()->toJson();
        $locations['districts'] = Region::alldistricts()->get()->toJson();
        Cache::forever('locations', $locations);
        return $locations;
    }

    /**
     * Get content from cache
     * @return page content
     */
    public static function getCache() {

        if (Config::get('app.cache') != 0 && !Auth::check()) {  //
            $page = (Paginator::getCurrentPage() > 1 ? Paginator::getCurrentPage() : '');
            $key = 'route-' . Str::slug(Request::fullurl()) . $page;

            if (Cache::has($key)) {
                die(Cache::get($key));
            }
        }
    }

    public static function checkStock($attr_val_id, $sets) {

        foreach ($sets as $set) {
            if (str_contains($set['attrVals'], (string) "|$attr_val_id|") && $set['stock'] > 0)
                return True;
        }
        return False;
    }

    public static function getCustId() {
        $user = Session::get('loginUser', array());

        return isset($user['custId']) ? $user['custId'] : '';
    }

    public static function getPassportId() {
        $user = Session::get('loginUser', array());

        return isset($user['passportId']) ? $user['passportId'] : '';
    }

    public static function wapGetOrderAction($order, $withCancel = true) {
        $action = '';

        switch ($order['status']) {
            case 'approved':
                $action = HTML::link(URL::route('wap_payOrder', array('id' => $order['orderId'])), '支付', array('class' => 'order-action confirm-buy'));
                break;
            case 'received':

                foreach ($order['products'] as $product) {
                    if ($product['commented'] == 0) {
                        $action = HTML::link(URL::route('wap_addComment', array('id' => $order['orderId'])), '评价', array('class' => 'order-action confirm-buy'));
                        break;
                    }
                }

                break;

        }
        if (in_array($order['status'], array('requested', 'approved', 'reject_approval')) && $withCancel) {
            $action .= HTML::link(URL::route('wap_cancelOrder', array('id' => $order['orderId'])), '取消订单', array('class' => 'order-action cancel','onclick'=>'javascript:return confirm("确定要取消这个订单吗？")'));
        }
        return $action;
    }

    public static function cutStr($string)
    {
//        return $string;
//        return substr_replace($string,'****',-4,4);
//        mb_substr_count()
            return mb_substr($string,-4,4,'UTF-8');
    }


    public static function  getRandChar($length){
        $str = null;
        $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
        $max = strlen($strPol)-1;

        for($i=0;$i<$length;$i++){
            $str.=$strPol[rand(0,$max)];//rand($min,$max)生成介于min和max两个数之间的一个随机整数
        }

        return $str;
    }

    public static function  getWechatToken($appId,$appSecret){
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=' . $appId . '&secret=' . $appSecret;
        $data = self::postCURLRequest($url);
        if (array_key_exists('access_token', $data)) {
            return $data['access_token'];
        } else {
            dd($data);
            Log::error('错误代码:' . $data['errcode']);
            return $data;
        }
    }

    public static function getWechatTicket($access_token){
        $url = 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token='.$access_token.'&type=jsapi';
        $data = self::postCURLRequest($url);
        if(array_key_exists('ticket',$data)){
            return $data['ticket'];
        }else{
            dd($data);
            Log::error('错误代码:' . $data['errcode']);
            return null;
        }
    }

    public static  function postCURLRequest($url){
        //初始化curl
        $ch = curl_init();
        //设置超时
        curl_setopt($ch, CURLOPT_TIMEOUT, 60);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch,CURLOPT_SSL_VERIFYHOST,FALSE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        //运行curl，结果以jason形式返回
        $res = curl_exec($ch);
        curl_close($ch);
        $data = json_decode($res,true);
        return $data;
    }


    public static function getWechatSignature(){
        $appId = 'wx2c82806de7e9cc08';
        $appSecret = '781766aebafd617cc3fa5fdd16fd8aef';
        $access_token = self::getWechatToken($appId,$appSecret);
        Log::info($access_token);
        if($access_token){
            $ticket = self::getWechatTicket($access_token);
            Log::info($ticket);
            if($ticket){
                return $ticket;
            }
        }
        return null;
    }




}
