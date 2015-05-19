<div class="component-navigator clearfix {{$element->themeId}} {{$element->templateId}} {{$element->hasMarginTop ==
'yes'? 'margin-top' : ''}}">
    <div class="component-data clearfix">
        @include('components.navigator.'.$element->templateId)
    </div>
</div>
