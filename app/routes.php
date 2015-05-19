<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

Route::group(['before'=>'get_mid'],function(){

    Route::get('/',['as'=>'home','uses'=>'HomeController@getIndex']);
    Route::get('search_product',['as'=>'search_product','uses'=>'HomeController@getSearchProduct']);
    Route::get('pages/{id}/preview',['as'=>'pages.priview','uses'=>'HomeController@getPreview']);

//获取注册验证码
    Route::post('authcode', ['as'=>'authcode','uses'=>'BaseController@postAuthCode']);
    Route::group(['prefix'=>'merchant'],function(){

        Route::get('login',['as'=>'merchants_login','uses'=>'MerchantController@getLogin']);
        Route::post('login',['as'=>'merchants_login','uses'=>'MerchantController@postLogin']);
        Route::get('register',['as'=>'merchants_register','uses'=>'MerchantController@getRegister']);
        Route::post('register',['as'=>'merchants_register','uses'=>'MerchantController@postRegister']);
        Route::get('forget_password',['as'=>'merchants_forget_password','uses'=>'MerchantController@getForgetPassword']);
        Route::post('forget_password',['as'=>'merchants_forget_password','uses'=>'MerchantController@postForgetPassword']);
        Route::post('register_check',['as'=>'merchants.register_check','uses'=>'MerchantController@postRegisterCheck']);

        Route::get('apply_join',['as'=>'merchants.apply_join','uses'=>'MerchantController@getApplyJion']);
        Route::post('deal_apply',['as'=>'merchants.deal_apply_join','uses'=>'MerchantController@postDealApply']);

        Route::get('agent_apply_join',['as'=>'merchants.agent_apply_join','uses'=>'MerchantController@getAgentApplyJoin']);
        Route::post('deal_agent_apply',['as'=>'merchants.deal_agent_apply','uses'=>'MerchantController@postDealAgentApply']);

        Route::get('store_apply_join',['as'=>'merchants.store_apply_join','uses'=>'MerchantController@getStoreApplyJoin']);
        Route::post('deal_store_apply',['as'=>'merchants.deal_store_apply','uses'=>'MerchantController@postDealStoreApply']);


        //商家操作权限组
        Route::group(['before'=>'auth_merchant'],function(){

            Route::group(['prefix'=>'home'],function(){
                Route::get('/',['as'=>'merchants.home','uses'=>'MerchantController@getIndex']);
            });
            Route::group(['prefix'=>'shop'],function(){
                Route::get('/',['as'=>'merchants.shop','uses'=>'ShopController@getIndex']);
                Route::get('preview',['as'=>'merchants.shop.preview','uses'=>'ShopController@getPreview']);
                Route::get('{id}/edit',['as'=>'merchants.shop.edit','uses'=>'ShopController@getEdit'])->where('id','\d+');
                Route::post('update',['as'=>'merchants.shop.update','uses'=>'ShopController@postUpdate']);
                Route::post('upload_logo_image',['as'=>'merchants.shop.upload_logo_image','uses'=>'ShopController@postUploadLogoImage']);
                Route::post('upload_cover_image',['as'=>'merchants.shop.upload_cover_image','uses'=>'ShopController@postUploadCoverImage']);
                Route::get('product_list',['as'=>'merchants.shop.product_list','uses'=>'ShopController@getProductList']);
                Route::get('{id}/add_product',['as'=>'merchants.shop.add_product','uses'=>'ShopController@getAddProductToShop'])->where('id','\d+');
                Route::get('delete_product',['as'=>'merchants.shop.delete_product','uses'=>'ShopController@getDeleteProductFromShop']);
                Route::get('product_category/{id?}',['as'=>'merchants.shop.product_category','uses'=>'ShopController@getProductCategory'])->where('id','\d+');
                Route::get('category_product',['as'=>'merchants.shop.category_product','uses'=>'ShopController@getSearchProductByCategory']);
            });
            Route::group(['prefix'=>'account'],function(){
                Route::get('/',['as'=>'merchants.account','uses'=>'MerchantAccountController@getIndex']);
                Route::get('list',['as'=>'merchants.account.list','uses'=>'MerchantAccountController@getList']);
                Route::get('apply',['as'=>'merchants.account.apply','uses'=>'MerchantAccountController@getApply']);
                Route::post('apply',['as'=>'merchants.account.apply','uses'=>'MerchantAccountController@postApply']);
                Route::get('show',['as'=>'merchants.account.show','uses'=>'MerchantAccountController@getShow']);
                Route::post('update',['as'=>'merchants.account.update','uses'=>'MerchantAccountController@postUpdate']);
                Route::post('upload_up_image',['as'=>'merchants.shop.upload_up_image','uses'=>'MerchantAccountController@postUploadUpImage']);
                Route::post('upload_down_image',['as'=>'merchants.shop.upload_down_image','uses'=>'MerchantAccountController@postUploadDownImage']);
//        Route::get('preview',['as'=>'merchants.shop.preview','uses'=>'ShopController@getPreview']);
            });
            Route::group(['prefix'=>'customer'],function(){
                Route::get('/',['as'=>'merchants.customers','uses'=>'MerchantController@getCustomers']);

            });

            Route::group(['prefix'=>'order'],function(){
                Route::get('/',['as'=>'merchants.orders','uses'=>'MerchantController@getOrderList']);

            });

            Route::group(['prefix'=>'follower'],function(){
                Route::get('manage',['as'=>'merchants.follower.manage','uses'=>'MerchantController@getFollowerManger']);
                Route::get('apply_list',['as'=>'merchants.follower.apply_list','uses'=>'MerchantController@getApplyList']);
                Route::get('apply_deal',['as'=>'merchants.follower.apply_deal','uses'=>'MerchantController@getChangeApplyStatus']);
                Route::get('list',['as'=>'merchants.follower.list','uses'=>'MerchantController@getFollowerList']);
                Route::get('{id}/detail',['as'=>'merchants.follower.detail','uses'=>'MerchantController@getFollowerDetail'])->where('id','\d+');
                Route::get('change_status',['as'=>'merchants.follower.change_status','uses'=>'MerchantController@getChangeMerchantStatus'])->where('status','\d+');
                Route::get('{id}/delete',['as'=>'merchants.follower.delete','uses'=>'MerchantController@getSoftDelete']);

            });

            Route::group(['prefix'=>'info'],function(){
                Route::get('/',['as'=>'merchants.info','uses'=>'MerchantController@getPersonalInfo']);
                Route::get('logout',['as'=>'merchants.logout','uses'=>'MerchantController@getLogout']);
                Route::get('edit',['as'=>'merchants.info.edit','uses'=>'MerchantController@getEditPersonalInfo']);
                Route::post('update',['as'=>'merchants.info.update','uses'=>'MerchantController@postUpdatePersonalInfo']);
                Route::post('upload_image',['as'=>'merchants.info.upload_image','uses'=>'MerchantController@postUploadImage']);
                Route::get('edit_password',['as'=>'merchants.info.edit_password','uses'=>'MerchantController@getEditPassword']);
                Route::post('update_password',['as'=>'merchants.info.update_password','uses'=>'MerchantController@postUpdatePassword']);
                Route::get('edit_mobile',['as'=>'merchants.info.edit_mobile','uses'=>'MerchantController@getEditMobile']);
                Route::post('update_mobile',['as'=>'merchants.info.update_mobile','uses'=>'MerchantController@postUpdateMobile']);

            });




        });

        Route::group(['prefix'=>'region'],function(){
            Route::post('citys',['as'=>'merchants.region.citys','uses'=>'RegionController@postGetCitys']);
            Route::post('districts',['as'=>'merchants.region.districts','uses'=>'RegionController@postGetDistricts']);
            Route::post('provinces',['as'=>'merchants.region.provinces','uses'=>'RegionController@postGetProvinces']);
        });



    });
//,'before' => 'auth_merchant'


    Route::group(['prefix'=>'customer'],function(){

        Route::get('login',['as'=>'customers.login','uses'=>'CustomerController@getLogin']);
        Route::post('login',['as'=>'customers.login','uses'=>'CustomerController@postLogin']);

        Route::get('register',['as'=>'customers.register','uses'=>'CustomerController@getRegister']);
        Route::post('register',['as'=>'customers.register','uses'=>'CustomerController@postRegister']);
        Route::post('register_check',['as'=>'customers.register_check','uses'=>'CustomerController@postRegisterCheck']);

        Route::get('logout',['as'=>'customers.logout','uses'=>'CustomerController@getLogOut']);

        Route::group(['before'=>'auth_customer'],function() {

            Route::get('about',['as'=>'about','uses'=>'CustomerController@getAboutUs']);
            Route::get('service',['as'=>'sale_service','uses'=>'CustomerController@getProductService']);

            Route::get('cart', ['as' => 'cart', 'uses' => 'ShoppingController@getCart']);
            Route::post('cart/add', ['as' => 'cart.add', 'uses' => 'ShoppingController@postCartAdd']);
            Route::post('cart/update', ['as' => 'cart.update', 'uses' => 'ShoppingController@postCartUpdate']);
            Route::post('cart/delete', ['as' => 'cart.delete', 'uses' => 'ShoppingController@postCartDelete']);

            Route::get('orders', ['as' => 'orders', 'uses' => 'OrderController@getIndex']);
            Route::post('orders', ['as' => 'orders', 'uses' => 'OrderController@postCreate']);
            Route::get('orders/{id}/detail', ['as' => 'orders.detail', 'uses' => 'OrderController@getDetail'])->where('id','\d+');
            Route::get('orders/pay',['as'=>'orders.pay','uses'=>'PaymentController@getPay'])->where('id','\d+');
            Route::get('orders/{id}/comment', ['as' => 'orders.comment', 'uses' => 'OrderController@getComment'])->where('id','\d+');
            Route::post('orders/{id}/comment', ['as' => 'orders.comment.add', 'uses' => 'OrderController@postComment'])->where('id','\d+');
            Route::get('orders/{id}/status/{status}', ['as' => 'order.status.update', 'uses' => 'OrderController@getChangeStatus'])->where('id','\d+');;

            Route::get('addresses', ['as' => 'addresses', 'uses' => 'AddressController@getIndex']);
            Route::get('address/add', ['as' => 'address.add', 'uses' => 'AddressController@getAdd']);
            Route::post('address/create', ['as' => 'address.create', 'uses' => 'AddressController@postAdd']);
            Route::get('address/{id}/del', ['as' => 'address.del', 'uses' => 'AddressController@getDel']);
            Route::get('address/{id}/edit', ['as' => 'address.edit', 'uses' => 'AddressController@getEdit']);
            Route::post('address/update', ['as' => 'address.update', 'uses' => 'AddressController@postEdit']);
            Route::post('address/{id}/default', ['as' => 'address.default', 'uses' => 'AddressController@postSetDefault']);

            Route::get('profile', ['as' => 'customers.profile', 'uses' => 'CustomerProfileController@getIndex']);
            Route::get('profile/detail', ['as' => 'customers.profile.detail', 'uses' => 'CustomerProfileController@getDetail']);
            Route::get('profile/level', ['as' => 'customers.profile.level', 'uses' => 'CustomerProfileController@getLevel']);
            Route::get('profile/phone', ['as' => 'customers.profile.phone', 'uses' => 'CustomerProfileController@getPhone']);
            Route::post('profile/phone/update', ['as' => 'customers.profile.phone.update', 'uses' => 'CustomerProfileController@postPhone']);
            Route::get('profile/password', ['as' => 'customers.profile.password', 'uses' => 'CustomerProfileController@getPassword']);
            Route::post('profile/password/update', ['as' => 'customers.profile.password.update', 'uses' => 'CustomerProfileController@postPassword']);
            Route::get('profile/username', ['as' => 'customers.profile.username', 'uses' => 'CustomerProfileController@getUserName']);
            Route::post('profile/username/update', ['as' => 'customers.profile.username.update', 'uses' => 'CustomerProfileController@postUserName']);
            Route::post('profile/image/upload', ['as' => 'customers.profile.image.upload', 'uses' => 'CustomerProfileController@postUserImage']);

            //代理
            Route::get('agent', ['as' => 'agent.index', 'uses' => 'AgentController@getIndex']);
            Route::get('agent/my_orders', ['as' => 'agent.my_orders', 'uses' => 'AgentController@getAgentMyOrders']);
            Route::get('agent/order_lists', ['as' => 'agent.order_lists', 'uses' => 'AgentController@getAgentOrderLists']);
            Route::get('agent/my_members', ['as' => 'agent.my_members', 'uses' => 'AgentController@getAgentMyMembers']);
            Route::get('agent/{id}/code', ['as' => 'agent.code', 'uses' => 'AgentController@getCode']);
            Route::get('agent/product/{id}/detail', ['as' => 'agent.products.detail', 'uses' => 'AgentController@ProductsDetail']);
            //提现
            Route::get('cash', ['as' => 'cash.index', 'uses' => 'CashController@getIndex']);
            Route::get('cash/apply', ['as' => 'cash.apply', 'uses' => 'CashController@getApply']);
            Route::post('cash/apply', ['as' => 'cash.apply', 'uses' => 'CashController@getApplyPost']);
            //账户信息
            Route::get('account', ['as' => 'account.index', 'uses' => 'AccountController@getIndex']);

            Route::get('favorites', ['as' => 'favorites', 'uses' => 'FavoriteController@getIndex']);
            Route::get('favorites/{id}/del', ['as' => 'favorite.del', 'uses' => 'FavoriteController@getDel']);
            Route::post('favorites/{pid}', ['as' => 'favorite.toggle', 'uses' => 'FavoriteController@postToggleCollect']);

            Route::get('comments', ['as' => 'comments', 'uses' => 'CommentController@getComments']);
        });

    });

    Route::get('shopping/cart/count',['as'=>'cart.count','uses'=>'ShoppingController@getCartCount']);
    Route::group(['prefix'=>'shopping','before'=>'auth_customer'],function(){

        Route::get('cart',['as'=>'cart','uses'=>'ShoppingController@getCart']);
        Route::post('cart/add',['as'=>'cart.add','uses'=>'ShoppingController@postCartAdd']);
        Route::post('cart/update',['as'=>'cart.update','uses'=>'ShoppingController@postCartUpdate']);
        Route::post('cart/delete',['as'=>'cart.delete','uses'=>'ShoppingController@postCartDelete']);
        Route::get('checkout',['as'=>'checkout','uses'=>'ShoppingController@getCheckout']);
        Route::any('checkout-direct',['as'=>'checkout.direct','uses'=>'ShoppingController@anyCheckoutDirect']);

    });

    Route::group(['prefix'=>'products'],function(){

        Route::get('/',['as'=>'products','uses'=>'ProductController@getIndex']);
        Route::get('search',['as'=>'products.search','uses'=>'ProductController@getSearch']);
        Route::get('categories/{id?}',['as'=>'products.categories','uses'=>'ProductController@getCategories'])->where('id','\d+');
        Route::get('{id}',['as'=>'products.detail','uses'=>'ProductController@getDetail'])->where('id','\d+');
        Route::get('{id}/more',['as'=>'products.more','uses'=>'ProductController@getMore']);
        Route::get('{id}/comments',['as'=>'products.comments','uses'=>'ProductController@getComments']);

    });

    Route::get('shop/{id}',['as'=>'shop','uses'=>'ShopController@getShowShop'])->where('id','\d+');
    Route::post('shop/hide_tip',['as'=>'shop.hide_tip','uses'=>'ShopController@postHideShareTip']);
});



//订单回调

//Route::post('orders/notify',['as'=>'orders.notify','uses'=>'OrderController@postNotify']);
Route::post('customer/orders/notify_alipay',['as'=>'orders.notify.alipay','uses'=>'PaymentController@postAlipayNotify']);
Route::post('customer/orders/notify_wxpay',['as'=>'orders.notify.wxpay','uses'=>'PaymentController@postWxpayNotify']);



