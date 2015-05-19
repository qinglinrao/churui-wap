<div class="component-product clearfix {{$element->themeId}} {{$element->templateId}} {{$element->hasMarginTop
== 'yes' ? "margin-top" : ""}}
{{$element->hasBorder == 'yes' ? "has-border" : ''}}">
  @if($element->hasTitle == 'yes')
    <div class="component-title {{$element->titleTheme}}"><span>{{$element->componentName}}</span></div>
  @endif
  <div class="component-data clearfix ">
    @include('components.products.'.$element->templateId)
  </div>
</div>

