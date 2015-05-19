<?php

class HomeController extends BaseController{

    //商城首页
    public function getIndex(){
        $banners = Banner::ofType(1)->get();
        $ad = Banner::ofType(2)->first();
        $categories = ProductCategory::with('image')->where('parent_id',null)->get();
        return View::make('index',compact('categories','banners','ad'));
    }

    //产品分类页
    public function getSearchProduct(){
        $query = trim(Input::get('query'));
        $products = Product::with('image')->displayType(0)->visible()->where('name','like','%'.$query.'%')->get();
        return View::make('search',compact('products'));
    }
}