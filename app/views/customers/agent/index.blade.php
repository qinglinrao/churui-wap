@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">代理提成</li>
            <li class="forward"><a href="{{ URL::route('cash.index') }}" >提现记录</a></li>
        </ul>
    </div>


    <div  class="content">
        <div  class="sum-money">
            <p class="sq-wenzi">我的佣金（元）</p>
            <p class="shuzi">{{ $customer->money }}</p>
        </div>
        <div  class="fenrun-lists">
            <div  class="fenrun">
                <div  class="fr-title">
                    <p>我的分润（元）</p>
                </div>
                <div  class="item">
                    <div>
                        <p class="fr-shuzi">{{ $customer->total_profit }}</p>
                        <p class="fr-wenzi">销售额</p>
                    </div>
                    <div>
                        <p class="fr-shuzi"><a href="{{ URL::route('agent.products')  }}">{{ count($orders) }}</a></p>
                        <p class="fr-wenzi">订单</p>
                    </div>
                    <div>
                        <p class="fr-shuzi">{{ count($two_agents) }}</p>
                        <p class="fr-wenzi">会员</p>
                    </div>
                    <div>
                        <p class="fr-shuzi">{{ $customer->money }}</p>
                        <p class="fr-wenzi">佣金</p>
                    </div>
                </div>
            </div>
            <div  class="fenrun">
                <div  class="fr-title">
                    <p>会员分润（元）</p>
                </div>
                <div  class="item">
                    <div>
                        <p class="fr-shuzi">{{ $two_money[0] }}</p>
                        <p class="fr-wenzi">销售额</p>
                    </div>
                    <div>
                        <p class="fr-shuzi">{{ $two_order }}</p>
                        <p class="fr-wenzi">订单</p>
                    </div>
                    <div>
                        <p class="fr-shuzi">{{ count($three_agents) }}</p>
                        <p class="fr-wenzi">会员</p>
                    </div>
                    <div>
                        <p class="fr-shuzi">{{ $two_money[1] }}</p>
                        <p class="fr-wenzi">佣金</p>
                    </div>
                </div>
            </div>
            <div  class="fenrun">
                <div  class="fr-title">
                    <p>会员下级分润（元）</p>
                </div>
                <div  class="item">
                    <div>
                        <p class="fr-shuzi">{{ $three_money[0] }}</p>
                        <p class="fr-wenzi">销售额</p>
                    </div>
                    <div>
                        <p class="fr-shuzi">{{ $three_order }}</p>
                        <p class="fr-wenzi">订单</p>
                    </div>
                    <div>
                        <p class="fr-shuzi">{{ count($four_agents) }}</p>
                        <p class="fr-wenzi">会员</p>
                    </div>
                    <div>
                        <p class="fr-shuzi">{{ $three_money[1] }}</p>
                        <p class="fr-wenzi">佣金</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop