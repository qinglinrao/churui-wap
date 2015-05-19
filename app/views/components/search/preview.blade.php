<div class="component-search clearfix {{$element->themeId}} {{$element->templateId}} {{$element->hasMarginTop ==
'yes'? 'margin-top' : ''}}">
    <div id="search" class="component-data clearfix">
        @include('components.search.'.$element->templateId)
    </div>
</div>

