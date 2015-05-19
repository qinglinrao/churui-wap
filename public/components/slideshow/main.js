/**
 * Created by gibson on 14-10-28.
 */
define(['components/base', 'components/slideshow/assets','owl_carousel'], function(ComponentBase, assets) {
    'use strict';
    console.log('Load Slideshow Component');

    var SlideshowApp = {};
    var templates = assets.templates;

    SlideshowApp.defaults = McMore.componentDefault.slideshow
    
    SlideshowApp.tpls = {
        tpl_1:templates.tpl_1
    };
    
    SlideshowApp.PreviewView = ComponentBase.PreviewView.extend({
        template: function(serializeModel) {
            var $component = $(_.template(templates.preview,serializeModel));
            var datas = []
            _(serializeModel.data).each(function(data, i) {
                if (i >= serializeModel.dataLimit)
                    return;
                datas.push(_.template(SlideshowApp.tpls[serializeModel.templateId],data))           
            })
            $component.find('.component-data').html(datas.join(''))
            return $component;
        },
        _onRender: function() {
            if (this.$el.find("#slideshow .slide").length < 2)
                return;
            this.$el.find("#slideshow").owlCarousel({
                items: 1,
                loop: true,
                autoplay: true,
                rtl: this.model.get('rtl') == 0 ? false : true,
                autoplayTimeout: this.model.get('autoplayTimeout')
            });
        }
    });

    SlideshowApp.ConfigView = ComponentBase.ConfigView.extend({
        template: function(serializeModel) {
            var $config = $(_.template(templates.config,serializeModel));
            return $config
        },
        
        ui: {
            delect_item: '.delete-item',
            add_item: '.add-slide',
            data_change: '#slides-list li input'
        },
        
        events: {
            'click @ui.delect_item': 'deleteItem',
            'click @ui.add_item': 'addItem',
            'change @ui.data_change': 'updateSlideData'
        },
        
        _onRender: function() {
            var self = this
            //int sortable
            this.$el.find('#slides-list ul').sortable({
                axis: 'y',
                placeholder: "ui-state-highlight",
                forcePlaceholderSize: true,
                update: function() {
                    self.updateSlideData()
                }
            })
            window.uploadImageCallback = function(){
                $('.image-upload.selected img').attr('src', 'images/image.png')
                self.updateSlideData()
            }

        },
        updateSlideData: function() {
            var slides = []
            this.$el.find('#slides-list ul li').each(function() {
                var slide = {
                    name: $(this).find('.slide-name input').val(),
                    src: $(this).find('.slide-img img').attr('src'),
                    link: $(this).find('.slide-link input').val()
                }
                slides.push(slide)
            })
            this.model.set('data', slides)
        },
        deleteItem:function(click){
            var $target = $(click.currentTarget)
            var self = this
            $target.closest('li').slideUp(300,function(){
                $(this).remove()
                self.updateSlideData()
            })
        },
        addItem:function(){
            $('<li class="slide clearfix"><div class="delete-item"><img src="../images/delete_item.png"/></div><div class="slide-img image-upload"><img src="images/slideshow.png"/></div><div class="slide-name"><input type="text" name="slide_name" value=""/></div><div class="slide-link"><input type="text" name="slide_link" value=""/></div></li>').appendTo($('#slides-list ul'))
            this.updateSlideData()
        }
        
    });

    SlideshowApp.Controller = ComponentBase.Controller.extend({
        configView: SlideshowApp.ConfigView,
        previewView: SlideshowApp.PreviewView
    });

    return SlideshowApp;
});
