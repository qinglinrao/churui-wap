/**
 * Created by gibson on 14-10-28.
 */
define(['components/base', 'components/ads/assets'], function(ComponentBase, assets) {

    'use strict';

    console.log('Load Ads Component');

    var AdsApp = {};
    var templates = assets.templates;

    AdsApp.defaults = McMore.componentDefault.ads;
    
    AdsApp.tpls = {
        tpl_1: templates.tpl_1
    };
    
    AdsApp.PreviewView = ComponentBase.PreviewView.extend({
        template: function(serializeModel) {
            var $component = $(_.template(templates.preview,serializeModel));
            $component.find('.component-data').html(_.template(AdsApp.tpls[serializeModel.templateId],serializeModel.data))
            return $component;
        }
    });

    AdsApp.ConfigView = ComponentBase.ConfigView.extend({
        template: function(serializeModel) {
            var $config = $(_.template(templates.config,serializeModel));
            return $config
        },
        
        ui: {
            data_change: '#banner-list li input'
        },
        
        events: {
           'change @ui.data_change': 'updateBannerData'
        },
        
        _onRender: function() {
            var self = this;
            window.uploadImageCallback = function(){
                $('.image-upload.selected img').attr('src', 'images/image.png')
                self.updateBannerData()
            }
        },
        updateBannerData: function() {
            var banner = {
                name: $('#banner-list .slide-name input').val(),
                src: $('#banner-list .banner-img img').attr('src'),
                link: $('#banner-list .slide-link input').val()
            };
            this.model.set('data', banner)
        }
        
    });

    AdsApp.Controller = ComponentBase.Controller.extend({
        configView: AdsApp.ConfigView,
        previewView: AdsApp.PreviewView
    });

    return AdsApp;
});
