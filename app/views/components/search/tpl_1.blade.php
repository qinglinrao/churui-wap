<div class="logo">
    <a href="{{URL::route('home')}}"><img src="{{$element->logo}}"/></a>
</div>
<div class="search-form">
    <form action = "#" method="get">
        <input type="text" class="search-keyword" name="keyword" placeholder="{{$element->placeholder}}"/>
        <input type="submit" class="search-submit"/>
    </form>
</div>
<div class="links">
    <ul class="list-unstyled">
        <li><a href=""><img src="/components/search/images/list_icon.png"/></a></li>
    </ul>
</div>

