<?php

class ShopController extends BaseController{

    //我的店铺
    public function getIndex(){
        $sort = Input::get('sort') ? Input::get('sort'):'created_at';
        Log::info($sort);
        $shop = Shop::with(array('logoImage','coverImage','products.image','products'=>function($query) use ($sort){
            $query->orderBy($sort,'desc');
        }))->merchant()->first();

        return View::make('merchants.shop.index')
                     ->with('shop',$shop)
                     ->with('sort',$sort);
    }

    //店铺个人预览
    public function getPreview(){
        $sort = Input::get('sort') ? Input::get('sort'):'created_at';
        $shop = Shop::with(array('logoImage','coverImage','products.image','products'=>function($query) use ($sort){
            $query->orderBy($sort,'desc');
        }))->merchant()->first();
        return View::make('merchants.shop.preview')
                     ->with('shop',$shop)
                     ->with('sort',$sort)
                     ->with('url',URL::route('merchants.shop.preview'))
                     ->with('public',false);
    }

    //店铺公开预览
    public function getShowShop($shop_id){
        $sort = Input::get('sort') ? Input::get('sort'):'created_at';
        $shop = Shop::with('logoImage','coverImage','products.image')->where('id',$shop_id)->first();
        if($shop){
            return View::make('merchants.shop.preview')
                ->with('shop',$shop)
                ->with('sort',$sort)
                ->with('url',URL::route('shop',['id'=>$shop_id]))
                ->with('public',true);
        }else{
            App::abort(404);
        }


    }

    //店铺资料编辑
    public function getEdit($shop_id){
        $shop = Shop::with('logoImage','coverImage','products.image')->where('id',$shop_id)->merchant()->first();
        if($shop){
            return View::make('merchants.shop.edit')
                ->with('shop',$shop);
        }else{
            App::abort(404);
        }
    }

    //上传店铺Logo图
    public function postUploadLogoImage(){
        $shop_id = Input::get('shop_id');
        Log::info($shop_id);
        $image_file = Input::file('logo_image');
        $shop = Shop::where('id',$shop_id)->merchant()->first();
        if($shop){
            $configure = array(
                 'attr'=>'logo_image_id',
                'folder'=>'Shops',
                'relation_image_name'=>'logoImage',
                'width'=>120,
                'height'=>120
            );
            try{
                $image = $this->uploadImage($image_file,$configure,true,false,$shop);
                return $this->setJsonMsg(1,$image->url);
            }catch (Exception $e){
                $this->setJsonMsg(0,'系统错误!');
            }

        }else{
            return $this->setJsonMsg(0,'店铺不存在!');
        }

    }


    //上传店铺封面图
    public function postUploadCoverImage(){
        $shop_id = Input::get('shop_id');
        $image_file = Input::file('cover_image');
        $shop = Shop::where('id',$shop_id)->merchant()->first();
        if($shop){
            $configure = array(
                 'attr'=>'cover_image_id',
                'folder'=>'Shops',
                'relation_image_name'=>'coverImage',
                'width'=>640,
                'height'=>320
            );
            try{
                $image = $this->uploadImage($image_file,$configure,true,false,$shop);
                return $this->setJsonMsg(1,$image->url);
            }catch (Exception $e){
                $this->setJsonMsg(0,'系统错误!');
            }

        }else{
            return $this->setJsonMsg(0,'店铺不存在!');
        }

    }


    //更新店铺资料
    public function postUpdate(){
        $data = array(
            'id' => Input::get('id'),
            'name' => Input::get('name'),
            'weixin' => Input::get('weixin'),
            'intro' => Input::get('intro'),
        );
        $rules = array(
            'name' =>'required',
            'weixin' => 'required'
        );
        $messages = array(
            'name.required' => '请填写手机号',
            'weixin.required' => '请填写微信号'
        );
        $v = Validator::make($data, $rules, $messages);
        if ($v->fails()) {
            return Redirect::back()->withErrors(array('errors'=>$v->messages()->first()))->withInput();
        }else{
            $shop = Shop::where('id',$data['id'])->merchant()->first();
            if($shop){
                $shop->name = $data['name'];
                $shop->weixin = $data['weixin'];
                $shop->intro = $data['intro'];
                if($shop->save()){
                    return Redirect::route('merchants.shop.preview');
                }
            }
            return Redirect::back()->withErrors(array('errors'=>'系统错误!'))->withInput();

        }
    }

    //店铺添加产品 产品列表
    public function getProductList(){

        $sort = Input::get('sort') ? Input::get('sort') : 'created_at';
        $query = Input::get('query')?Input::get('query') : '';

        $products = Product::displayType(0)->whereDoesntHave('shopProducts',function($query){
            $query->merchant();
        })->visible()->orderBy($sort,'desc')->where('name','like','%'.$query.'%')->get();
        $route = 'merchants.shop.product_list';
        $catId = null;

        return View::make('merchants.shop.add_product',compact('products','sort','route','catId'));

    }

    //将商品添加到店铺中
    public function getAddProductToShop($product_id){
        Log::info($product_id);
        $shop_product = ShopProduct::where('product_id',$product_id)->merchant()->shop()->first();
        $product = Product::where('id',$product_id)->visible()->first();
        if($shop_product){
            Log::info($shop_product);
            return Redirect::back()->withErrors(array('error'=>'您已添加过此产品!'));
        }else{
            if($product){
                $merchant = Auth::merchant()->user();
                $shop_product = new ShopProduct();
                $shop_product->shop_id = $merchant->ownShop->id;
                $shop_product->merchant_id = $merchant->id;
                $shop_product->product_id = $product_id;
                if($shop_product->save()){
                    return Redirect::route('merchants.shop.product_list')->withErrors(array('error'=>'产品已添加至您的商店!'));;
                }else{
                    return Redirect::route('merchants.shop.product_list')->withErrors(array('error'=>'系统错误!'));
                }
            }else{
                return Redirect::back()->withErrors(array('error'=>'此产品不存在!'));
            }

        }

    }

    //将商品从店铺中删除
    public function getDeleteProductFromShop(){
        $shop_product_id = Input::get('SPID');
        $shop_product = ShopProduct::where('id',base64_decode($shop_product_id))->merchant()->shop()->first();
        if($shop_product){
            if($shop_product->delete()){
                return Redirect::back()->withErrors(array('error'=>'成功将此商品移除您的店铺!'));
            }else{
                return Redirect::back()->withErrors(array('error'=>'系统错误!'));
            }
        }else{
            return Redirect::back()->withErrors(array('error'=>'您的店铺中没有此商品!'));
        }
    }

    //按照分类筛选产品列表
    public function getSearchProductByCategory(){
        $products = Product::with('image')->visible()->displayType(0)->whereDoesntHave('shopProducts',function($query){
            $query->merchant();
        }); //初始化商品列表

        $catId = Input::get('catId');
        if($catId){
            $category = ProductCategory::find($catId);
            $catIds = [$category->id];
            if($category && $category->isRoot()){
                $catIds = array_merge($catIds,$category->children()->lists('id'));
            }else{
                $catIds = [$category->id];
            }
            $products = $products->categories($catIds); //加上分类过滤条件
        }else{
            $category = ProductCategory::roots()->first();
        }
        $sort = Input::get('sort')?Input::get('sort'):'created_at';
        $products = $products->orderBy($sort,'desc')->get();
        $route = 'merchants.shop.category_product';

        return View::make('merchants.shop.add_product',compact('sort','products','route','catId'));
    }

    //获取产品分类列表
    public function getProductCategory($id = 0){
        $categories = ProductCategory::roots()->get();

        if($id){
            $parent = ProductCategory::find($id);
        }else{
            $parent = ProductCategory::roots()->first();
        }

        $subCategories = $parent->children()->with('products.brand')->get();

        return View::make('merchants.shop.categories',compact('categories','id','subCategories','products'));
    }


    //隐藏店铺分享提示
    function postHideShareTip(){
        $cookie = Cookie::forever('share_tip',true);
        return Response::json(['result'=>1])->withCookie($cookie);
    }

}