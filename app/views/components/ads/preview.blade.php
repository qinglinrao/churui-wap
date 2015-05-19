<div class="component-ads clearfix {{$element->themeId}} {{$element->templateId}} {{$element->hasMarginTop ==
'yes'? 'margin-top' : ''}}">
    <div id="banner" class="component-data clearfix">
        @include('components.ads.'.$element->templateId)
    </div>
</div>

