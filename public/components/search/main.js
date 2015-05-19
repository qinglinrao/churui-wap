/**
 * Created by gibson on 14-10-28.
 */
define(['components/base', 'components/search/assets'], function(ComponentBase, assets) {
    'use strict';
    console.log('Load Search Component');

    var SearchApp = {};
    var templates = assets.templates;

    SearchApp.defaults = {
        componentId: '',
         componentType : 'search',
        componentName: '搜索条',
        placeholder: '请输入商品名称',
        titleTheme: 'title-theme-1',
        hasMarginTop: 'no',
        templateId: 'tpl_1',
        themeId: 'theme-1',
        logo: '/marionette/js/components/search/images/logo.png'
    };
    
    SearchApp.tpls = {
        tpl_1: templates.tpl_1,
        tpl_2: templates.tpl_2,
        tpl_3: templates.tpl_3,
        tpl_4: templates.tpl_4,
        tpl_5: templates.tpl_5
    };
    
    SearchApp.PreviewView = ComponentBase.PreviewView.extend({
        template: function(serializeModel) {
            var $component = $(_.template(templates.preview,serializeModel));
            $component.find('.component-data').html(_.template(SearchApp.tpls[serializeModel.templateId],serializeModel))
            return $component;
        }
    });

    SearchApp.ConfigView = ComponentBase.ConfigView.extend({
        template: function(serializeModel) {
            var $config = $(_.template(templates.config,serializeModel));
            return $config
        },
        
        ui: {
          
        },
        
        events: {
           
        },
        
        _onRender: function () {
            var self = this
            window.uploadImageCallback = function(){
                $('.image-upload.selected img').attr('src', 'images/image.png')
                self.model.set('logo','images/image.png')
            }
        }
        
    });

    SearchApp.Controller = ComponentBase.Controller.extend({
        configView: SearchApp.ConfigView,
        previewView: SearchApp.PreviewView
    });

    return SearchApp;
});
