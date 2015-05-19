<div class="product-list addproduct orderlist">
  <div class="list-top">
      <div class="lf-img"><img src="{{$order->buyer->detail->image ? AppHelper::imgSrc($order->buyer->detail->image->url):''}}"></div>
       <div class="lr-word">
         <div class="name-time">
           <div class="name">{{$order->buyer->detail->username}}</div>
           <div class="time">{{$order->created_at->format('y-m-d H:i')}}</div>
         </div>
       </div>
  </div><!-- 头部 -->
   <ul class="pl-ul">
       @foreach($order->products as $product)
       <li>
          <div class="limg"><img src="{{$product->product&&$product->product->image?AppHelper::imgSrc($product->product->image->url):''}}"></div>
          <div class="liword">
              <div class="title">{{mb_substr( $product->name, 0, 22, 'utf-8')}}</div>
              <div class="market-price">￥{{$product->price}}</div>
              <div class="repertory split">可分润:<span>￥{{get_product_profit($product->product,Auth::merchant()->user(),true)}}</span></div>
              <div class="count">x {{$product->quantity}}</div>
          </div>
       </li>
       @endforeach
   </ul><!-- 产品 -->
   <div class="statistics-price">
      <div class="product-num">{{get_order_product_num($order)}}件商品</div>
      <div class="actual-pay">实付:<span>￥{{get_order_total_price($order)}}</span></div>
      <div class="splitting-money">分润:<span>￥{{get_total_profit($order,Auth::merchant()->user())}}</span></div>
   </div><!-- 统计价格 -->
   <div class="pay-state">
       {{get_merchant_orders_status($order)}}
   </div><!-- 支付状态 -->
</div><!-- 订单一 -->