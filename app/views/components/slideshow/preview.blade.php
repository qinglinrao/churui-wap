<div class="component-slideshow clearfix {{$element->themeId}} {{$element->templateId}} {{$element->hasMarginTop ==
'yes'? 'margin-top' : ''}}">
    <div id="slideshow" data-rtl="{{$element->rtl}}" data-time="{{$element->autoplayTimeout}}" class="component-data
     clearfix
    {{$element->hasBorder == 'yes' ?
    'has-border' :
    ''}}">
        @include('components.slideshow.'.$element->templateId)
    </div>
</div>

