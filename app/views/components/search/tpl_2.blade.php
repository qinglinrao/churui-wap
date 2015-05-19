<div class="logo">
    <a href="{{URL::route('home')}}"><img src="{{$element->logo}}"/></a>
</div>
<div class="search-form">
    <form>
        <input type="text" class="search-keyword" name="keyword" placeholder="{{$element->placeholder}}"/>
        <input type="submit" class="search-submit"/>
    </form>
</div>