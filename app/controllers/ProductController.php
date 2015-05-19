<?php

class ProductController extends BaseController {

    //产品分类页
	public function getIndex(){

		$catId = Input::get('catId');
		return $this->searchByCategory($catId);

	}

    //根据分类获取产品列表
	private function searchByCategory($catId){

		$products = Product::with('image')->where('visible',1)->displayType(0); //初始化商品列表

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

		if(Input::has('orderBy')){
			$products = $products->orderBy(Input::get('orderBy'),Input::get('sort'));
		}

		$products = $products->paginate(10); // 加上分页

		// 加载更多
		if(Request::ajax()) {
			$result['data'] = View::make('products._product',compact('products'))->render();
			return Response::json($result);
		}

		$categories = ProductCategory::roots()->get();

		if($category && $category->isRoot()){
			$activeId = $category->id;
		}else{
			$activeId = $category->parent_id;
		}


		return View::make('products.index',compact('category','categories','products','activeId'));

	}

    //根据品牌获取产品列表
	private function searchByBrand($brandId){
		$products = Product::with('image')->whereBrandId($brandId)->where('visible',1)->displayType(0); //初始化商品列表

		$products = $products->paginate(10); // 加上分页

		// 加载更多
		if(Request::ajax()) {
			$result['data'] = View::make('products._product',compact('products'))->render();
			return Response::json($result);
		}

		$categories = ProductCategory::roots()->get();

		$brand = Brand::find($brandId);

		$activeId = 0;

		return View::make('products.index_brand',compact('brand','categories','products','activeId'));

	}


    //产品搜索
	public function getSearch(){
		$keyword = Input::get('keyword');

		$products = Product::with('image')->where('visible',1)->displayType(0)->select('products.*')
						->join('product_categories','product_categories.id','=','products.category_id')
						->join('product_categories as parent','parent.id','=','product_categories.parent_id');


		if($keyword != ''){
			$products->where(function($query) use ($keyword){
				$query->where('products.name','like',"%{$keyword}%")
						->orWhere('product_categories.name','like',"%{$keyword}%")
						->orWhere('parent.name','like',"%{$keyword}%");
			});
		}

		if(Input::has('orderBy')){
			$products->orderBy('products.'.Input::get('orderBy'),Input::get('sort'));
		}

		$products = $products->distinct()->paginate(10);

		// 加载更多
		if(Request::ajax()) {
			$result['data'] = View::make('products._product',compact('products'))->render();
			return Response::json($result);
		}

		return View::make('products.search',compact('products','keyword'));

	}

    //查看产品详情
	public function getDetail($id){

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


            return View::make('products.detail',compact('product','voIds','stock','priceStr','optionNames','collected',
                'commentsCount','avgStar','deleted','shop_id'));

        }else{
            App::abort(404);
        }

	}

    //产品产品更多信息（产品介绍）
	public function getMore($id){

		$product = Product::with('options.values','entities','images','attributeValues.attribute')
            ->where('visible',1)->displayType(0)->find($id);

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

        $shop_product = ShopProduct::where('id',base64_decode(Input::get('SPID')))->first();
        $shop_id = $shop_product ? $shop_product->shop_id : 0;

		return View::make('products.detail_more',compact('product','voIds','stock','priceStr','optionNames','shop_id'));
	}


    //产品评论列表
	public function getComments($id){
		$comments = Comment::with('product','user.detail.image')->where('product_id',$id)->paginate(10);

		$avgStar = (int) Comment::where('product_id',$id)->avg('star');

		return View::make('products.comments.index',compact('comments','avgStar'));
	}

    //产品分类列表产品
	public function getCategories($id = 0){

		$categories = ProductCategory::roots()->get();

		if($id){
			$parent = ProductCategory::find($id);
		}else{
			$parent = ProductCategory::roots()->first();
		}

		$subCategories = $parent->children()->with('products.brand')->get();

        $products = $parent->products;

		return View::make('products.categories',compact('categories','id','subCategories','products'));
	}


}
