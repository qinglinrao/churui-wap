@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="{{URL::route('agent.code',$product->id)}}"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">代理</li>
            <li class="forward"><a href="#" ></a></li>
        </ul>
    </div>


    <div  class="cnotent">
        <div  class="shangping">
            <div  class="title">
                <p>商品信息</p>
            </div>
            <div  class="detailed">
                <p>{{ $product->name }}</p>
                <p class="xianjia">现价：￥{{ $product->par_price }}</p>
                <p class="fenxiao"><span class="fx">分销收益：</span><span class="fx-shuzi">￥58.00</span></p>
            </div>
        </div>
        <div  class="guizhe">
            <div  class="title">
                <p>代理赚钱规则</p>
            </div>
            <div  class="detailed">
                <p>代理商的产品组合越周密，越能加强渠道运营能力，丰富渠道资源、把握渠道掌控力，越能产生规模效力越能节省成本，创造利润。（至于如何组合，要看代理商在实际运营中适时、适地的操作。）</p>
                <p>市场的脉搏就是营销专家、高手也是无法把握的，即使美国的先进模式，也不一定适应中国的营销环境。所以代理商只要抓住市场的动向，根据自身的能力，根据当时的环境，根据当地的情况把工作做深一点，做细一点，做周密一点，还是有着很大的盈利生存空间的。</p>
            </div>
        </div>
        <div  class="DR-code">
            <div  class="title">
                <p>分享二维码</p>
            </div>
            {{--<div  class="img"></div>--}}
            <div style="text-align:center;" >
                <iframe scrolling="no" src="{{URL::route('agent.code',$product->id)}}"></iframe>
            </div>


        </div>


    </div>
@stop