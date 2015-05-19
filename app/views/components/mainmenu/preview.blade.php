<div class="component-mainmenu clearfix {{$element->themeId}} {{$element->templateId}} {{$element->hasMarginTop ==
'yes'? 'margin-top' : ''}}">
    @if($element->hasTitle == 'yes')
        <div class="component-title {{$element->titleTheme}}"><span>{{$element->componentName}}</span></div>
    @endif
    <div class="component-data clearfix">
        @include('components.mainmenu.'.$element->templateId)
    </div>
</div>

