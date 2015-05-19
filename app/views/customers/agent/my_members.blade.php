@extends('public.html')

@section('wrapper')
    <div class="top">
        <ul>
            <li class="back-arrow"><a href="javascript:history.go(-1)"><img src="/assets/images/churui/back-arrow.png" width="60%" height="60%" ></a></li>
            <li class="title">我的会员</li>
            <li class="forward"><a href="#" ></a></li>
        </ul>
    </div>


    <div  class="content">
        <div  class="hy-list">
            <div  class="head-photo">
                <img src="/assets/images/churui/member1.jpg" width="100%" height="100%" border="0" alt="会员头像">
            </div>
            <p class="hy-name">林志炫</p>
            <p class="hy-tel">13141234567</p>
            <p class="hy-num">他的会员：<span class="num">100</span></p>
        </div>

        <div  class="hy-list">
            <div  class="head-photo">
                <img src="/assets/images/churui/member2.jpg" width="100%" height="100%" border="0" alt="会员头像">
            </div>
            <p class="hy-name">大头娃娃</p>
            <p class="hy-tel">15865465895</p>
            <p class="hy-num">他的会员：<span class="num">88</span></p>
        </div>

        <div  class="hy-list">
            <div  class="head-photo">
                <img src="/assets/images/churui/member3.jpg" width="100%" height="100%" border="0" alt="会员头像">
            </div>
            <p class="hy-name">恺爷</p>
            <p class="hy-tel">1896545587</p>
            <p class="hy-num">他的会员：<span class="num">85</span></p>
        </div>

        <div  class="hy-list">
            <div  class="head-photo">
                <img src="/assets/images/churui/member4.jpg" width="100%" height="100%" border="0" alt="会员头像">
            </div>
            <p class="hy-name">隔壁王老五</p>
            <p class="hy-tel">13146899325</p>
            <p class="hy-num">他的会员：<span class="num">68</span></p>
        </div>

        <div  class="hy-list">
            <div  class="head-photo">
                <img src="/assets/images/churui/member5.jpg" width="100%" height="100%" border="0" alt="会员头像">
            </div>
            <p class="hy-name">亲昵不亲近</p>
            <p class="hy-tel">15965987588</p>
            <p class="hy-num">他的会员：<span class="num">53</span></p>
        </div>

    </div>
@stop