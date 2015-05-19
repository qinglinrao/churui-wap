/**
 * Created by gibson on 14-10-28.
 */
define(['components/base', 'components/navigator/assets'], function(ComponentBase, assets) {
    'use strict';
    console.log('Load Navigator Component');

    var NavigatorApp = {};
    var templates = assets.templates;

    NavigatorApp.defaults = McMore.componentDefault.navigator;
    NavigatorApp.tpls = {
        tpl_1:templates.tpl_1,
        tpl_2:templates.tpl_2
    };

    NavigatorApp.PreviewView = ComponentBase.PreviewView.extend({
        template: function(serializeModel) {
            var $component = $(_.template(templates.preview,serializeModel));
            var datas = [];
            var visibleItem = [];
            _(serializeModel.data).each(function(data,i){
                if(data.visible == 1){
                    visibleItem.push(data)
                }
            })
            var width = 1 / (_.size(visibleItem))
            width = width.toFixed(2) * 100 + '%'
            _(visibleItem).each(function(data, i) {
                if (data.visible == 1){
                    data.width = width;
                    datas.push(_.template(NavigatorApp.tpls[serializeModel.templateId],data))
                }
            })
            $component.find('.component-data').html(datas.join(''))
            return $component;
        },
        _onRender: function() {
            if (this.$el.find("#slideshow .slide").length < 2)
                return
            this.$el.find("#slideshow").owlCarousel({
                items: 1,
                loop: true,
                autoplay: true,
                rtl: this.model.get('rtl') == 0 ? false : true,
                autoplayTimeout: this.model.get('autoplayTimeout')
            });
        }
    });

    NavigatorApp.ConfigView = ComponentBase.ConfigView.extend({
        template: function(serializeModel) {
            var $config = $(_.template(templates.config,serializeModel));
            return $config
        },
        
        ui: {
            toggle_visible: '.toggle-visible'
        },
        
        events: {
            'click @ui.toggle_visible': 'toggleVisible'
        },
        
        _onRender: function() {
            var self = this
            //int sortable
            this.$el.find('.sortable-field').sortable({
                axis: 'y',
                //containment: '#mobile-main-content',
                placeholder: "ui-state-highlight",
                forcePlaceholderSize: true,
                update: function() {
                    self.updateData()
                }
            })
        },
        
        updateData: function() {
            //var sort = $('#products-list ol').sortable("serialize")
            var fields = []
            this.$el.find('.sortable-field li').each(function() {
                var field = {
                    name: $(this).find('.name-field').val(),
                    visible: parseInt($(this).find('.visible-field').val()),
                    link: $(this).find('.link-field').val(),
                    code: $(this).find('.code-field').val()  
                }
                fields.push(field)
            })
            this.model.set('data', fields)
        },
        
        toggleVisible:function(click){
            var $target = $(click.currentTarget)
            var $parent = $target.closest('li')
            if ($target.hasClass('visible')) {
                $parent.find('.visible-field').val(0)
                $target.removeClass('visible').text('已隐藏')
            } else {
                $parent.find('.visible-field').val(1)
                $target.addClass('visible').text('显示中')
            }
            this.updateData()
        }
        
    });

    NavigatorApp.Controller = ComponentBase.Controller.extend({
        configView: NavigatorApp.ConfigView,
        previewView: NavigatorApp.PreviewView
    });

    return NavigatorApp;
});
