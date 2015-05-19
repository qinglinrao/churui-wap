<?php

/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-5
 * Time: 上午10:08
 */

class FavoriteController extends  BaseController{

    //收藏列表页
    public function getIndex(){

        $collections = Collection::customer()->with('product.thumb')->get();

        return View::make('customers.favorites.index')
                     ->with('collections',$collections);
    }

    //删此收藏操作
    public function getDel($id){
        $collection = Collection::where('id',$id)->customer()->first();
        if($collection){
            if($collection->delete()){
                return Redirect::route('favorites');
            }else{
                return Redirect::route('favorites')->withErrors(array('error'=>'系统错误'));
            }
        }
        else{
            return Redirect::route('favorites')->withErrors(array('error'=>'此收藏不存在'));
        }
    }

    //收藏产品与取消收藏 toggle
    public function postToggleCollect($pid){
        $collection = Collection::customer()->productId($pid)->first();

        if($collection){
            $state = $collection->delete();
        }else{
            $product = Product::find($pid);
            $collection = new Collection();
            $collection->product_name = $product->name;
            $collection->product_id = $pid;
            $collection->customer_id = Auth::customer()->user()->id;
            $state = $collection->save();
        }
        if($state){
            $result['state'] = 1;
        }else{
            $result['state'] = 0;
            $result['msg'] = '系统出错';
        }

        return Response::json($result);
    }

} 
