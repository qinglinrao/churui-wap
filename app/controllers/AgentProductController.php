<?php

class AgentProductController extends BaseController {

    public $customer;

    function __construct(){
        $this->customer = Auth::customer()->check()?Auth::customer()->user():null;
    }

    public function AgentProductDetail($id){
        $product = Product::with('latestComment','options.values','entities','images')->find($id);
        if($product)
        {
            $stock = 0;
            $voIds = [];//$voIds: Visible options ids


            foreach($product->entities as $e){
                $stock += $e->stock;
                $voIds = array_merge($voIds,explode('|',$e->option_set));
            }
            $voIds = array_unique($voIds);



            $prices = $product->entities->lists('sale_price');

            $minPrice = count($prices) ? min($prices) : 0;
            $maxPrice = count($prices) ? max($prices) : 0;
            if($minPrice != $maxPrice){
                $priceStr = AppHelper::price($minPrice) .' ~ '. AppHelper::price($maxPrice);
            }else{
                $priceStr = AppHelper::price($minPrice);
            }

            $optionNames = implode('/',$product->options->lists('name'));

            $collected = Collection::productId($product->id)->count() > 0;

            $commentsCount = Comment::where('product_id',$id)->count();

            $avgStar = Comment::where('product_id',$id)->avg('star');

            $deleted = false;

            if(Auth::merchant()->check() &&Input::has('SPID') && Input::has('MID')){
                if(ShopProduct::where('id',base64_decode(Input::get('SPID')))->merchant()->shop()->count()){
                    $deleted = true;
                }
            }

            $shop_product = ShopProduct::where('id',base64_decode(Input::get('SPID')))->first();
            $shop_id = $shop_product ? $shop_product->shop_id : 0;


            return View::make('customers.agent.product_detail',compact('product','voIds','stock','priceStr','optionNames','collected',
                'commentsCount','avgStar','deleted','shop_id'));

        }else{
            App::abort(404);
        }

    }


}
