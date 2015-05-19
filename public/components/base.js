/**
 * Created by gibson on 14-10-28.
 */
define(['backbone.marionette', 'mustache', 'msgbus','collections', 'iCheck','fancybox'], function(Marionette, Mustache, msgBus, collections) {
    'use strict';
    console.log('Load Component Base');

    var Component = {};

    Component.defaults = {

    };

    Component.ConfigView = Marionette.ItemView.extend({
        initialize: function() {
            this.ui = _.extend(this.configUi,this.ui);
            this.events = _.extend(this.configEvent,this.events);
        },

        tagName: 'div',

        className: 'component-config-wrapper',

        configUi: {
            input_change: 'input.with-role',
            img_change: 'div.select-wrapper',
            select_change: 'select',
            upload_image: '.image-upload'
        },

        configEvent: {
            'change @ui.input_change': 'updateModelByInputChange',
            'click @ui.img_change': 'updateModelByClick',
            'change @ui.select_change' : 'updateModelBySelectChange',
            'click @ui.upload_image' : 'uploadImage'
        },

        onRender: function() {
            // int some plugin
            var self = this
            this.$el.find('.spin-button').spinner({
                min: 1,
                stop: function(event, ui) {
                    var val = self.$el.find('.spin-button').spinner("value");
                    self.model.set('dataLimit',val)
                }
            })

            // int iCheck plugin
            this.$el.find('input').iCheck({
                checkboxClass: 'icheckbox'
            }).on("ifChecked", function() {
                self.model.set($(this).data('role'), $(this).val())
            });

            //int fancybox
            this.$el.find(".fancybox").fancybox({
                fitToView: false,
                width: '100%',
                height: '100%',
                autoSize: false,
                closeClick: false
            });

            //run sub component render functions
            if(typeof this._onRender =='function')
                this._onRender()
        },

        updateModelByInputChange: function(change) {
            var $target = $(change.currentTarget);
            this.model.set($target.data('role'), $target.val());
        },

        updateModelByClick:function(click){
            var $target = $(click.currentTarget);
            if ($target.hasClass('active'))
                    return;
            var role = $target.data('role');
            var val = $target.data('val')
            $('[data-role="' + role + '"]').removeClass('active')
            $target.addClass('active')
            this.model.set(role, val)
        },

        updateModelBySelectChange: function(change){
            var $target = $(change.currentTarget)
            if (!$target.data('role'))
                return
            this.model.set($target.data('role'), $target.val())
        },

        uploadImage:function(click){
            var $target = $(click.currentTarget)
            this.$el.find('.image-upload').removeClass('selected')
            $target.addClass('selected')
            $.fancybox.open({
                href: '../upload.php',
                type: 'iframe',
                fitToView: false,
                width: 640,
                autoSize: false,
                closeClick: false
            })
        }
    });

    Component.PreviewView = Marionette.ItemView.extend({
        initialize: function() {
            this.componentInstance = this.getOption('componentInstance');
            this.ui = _.extend(this.previewUi, this.ui);
            this.events = _.extend(this.previewEvent, this.events);
        },

        tagName: 'div',

        className: 'component-wrapper clearfix',

        modelEvents: {
            'change': 'render'
        },

        previewUi: {
            config: '.grid-drag-handle .edit',
            delete: '.grid-drag-handle .delete',
            copy: '.grid-drag-handle .copy'
        },

        previewEvent: {
            'click @ui.config': 'showConfig',
            'click @ui.delete': 'deleteComponent',
            'click @ui.copy': 'copyComponent'
        },

        onRender: function() {
            console.log('The Model Data Of PreviewView', this.model)
            //run sub component render functions
            if(typeof this._onRender =='function')
                this._onRender()
        },

        onDestroy: function(lala){
            collections.pageElementList.remove(this.model)
            this.$el.parent().remove()
        },

        showConfig: function() {
            console.log('Show Component Configuration');
            console.log('component.cid', this.componentInstance.cid, 'model.cid', this.model.cid,'view',this.componentInstance.getConfigView());
            msgBus.events.trigger('component:config:show', this.componentInstance.getConfigView());
        },

        copyComponent: function(){
            var newModel = this.$el.parent().clone()
            this.$el.parent().after(newModel)
            msgBus.reqres.request('component:instance', this.model.get('componentType'), newModel, this.model.clone());
        },

        deleteComponent: function(){
            var self = this
            this.$el.slideUp(300,function(){
                self.destroy()
            })
        }
    });

    Component.Controller = Marionette.Controller.extend({
        initialize: function(options) {
            this.cid = _.uniqueId('component');
            this.model = options.model;
            this.configViewOptions = options.configViewOptions;
            this.previewViewOptions = options.previewViewOptions;
        },

        getConfigView: function() {
            var configView = this.configView;

            if (!configView) {
                throw new Marionette.Error({
                    name: 'NoConfigViewError',
                    message: 'A "configView" must be specified'
                });
            }

            return new configView(_.extend({
                model: this.model
            }, this.configViewOptions));
        },

        getPreviewView: function() {
            var previewView = this.previewView;

            if (!previewView) {
                throw new Marionette.Error({
                    name: 'NoPreviewViewError',
                    message: 'A "previewView" must be specified'
                });
            }

            return new previewView(_.extend({
                model: this.model,
                componentInstance: this
            }, this.previewViewOptions));
        }
    });

    return Component;
});