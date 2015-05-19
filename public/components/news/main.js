/**
 * Created by gibson on 14-10-28.
 */
define(['components/base', 'components/news/assets'], function(ComponentBase, assets) {
    'use strict';
    console.log('Load News Component');

    var NewsApp = {};
    var templates = assets.templates;

    NewsApp.defaults = {
        componentId: '',
        type: 'news',
        hasTitle: 'yes',
        componentName: '栏目标题',
        titleTheme: 'title-theme-1',
        hasBorder: 'no',
        hasMarginTop: 'no',
        dataLimit: '2',
        templateId: 'tpl_1',
        themeId: 'theme-1',
        data: [
            {name: '资讯标题1', desc: '内容摘要内容摘要内容摘要内容摘要内容摘要内容摘要',src: '/marionette/js/components/news/images/news_thumb.png'},
            {name: '资讯标题2', desc: '内容摘要内容摘要内容摘要内容摘要内容摘要内容摘要',src: '/marionette/js/components/news/images/news_thumb.png'},
            {name: '资讯标题3', desc: '内容摘要内容摘要内容摘要内容摘要内容摘要内容摘要',src: '/marionette/js/components/news/images/news_thumb.png'},
            {name: '资讯标题4', desc: '内容摘要内容摘要内容摘要内容摘要内容摘要内容摘要',src: '/marionette/js/components/news/images/news_thumb.png'}
        ]
    };

    NewsApp.tpls = {
        tpl_1:templates.tpl_1,
        tpl_2:templates.tpl_2
    };

    NewsApp.PreviewView = ComponentBase.PreviewView.extend({
        template: function(serializeModel) {
            var $component = $(_.template(templates.preview,serializeModel));
            var datas = []
            _(serializeModel.data).each(function(data, i) {
                if (i >= serializeModel.dataLimit)
                    return;
                datas.push(_.template(NewsApp.tpls[serializeModel.templateId],data))
            })
            $component.find('.component-data').html(datas.join(''))
            return $component;
        },


        _modelEvents: {

        },

        _ui: {

        },

        _events: {

        },

        _onRender: function() {

        }
    });

    NewsApp.ConfigView = ComponentBase.ConfigView.extend({
        template: function(serializeModel) {
            var $config = _.template(templates.config,serializeModel);
            return $config
        },

        _ui: {

        },

        _events: {

        },

        _onRender: function() {
            var self = this
            //int sortable
            this.$el.find('ul.sortable-list').sortable({
                axis: 'y',
                placeholder: "ui-state-highlight",
                forcePlaceholderSize: true,
                update: function() {
                    self.updateNewsData()
                }
            })
        },
        updateNewsData: function(){
            //var sort = $('#products-list ol').sortable("serialize")
            var news = []
            this.$el.find('ul.sortable-list li').each(function() {
                var n = {
                    name: $(this).find('.news-name').text(),
                    desc: $(this).find('.news-desc').text(),
                    src: $(this).find('.news-img img').attr('src')
                }
                news.push(n)
            })
            this.model.set('data',news)
        }
    });

    NewsApp.Controller = ComponentBase.Controller.extend({
        configView: NewsApp.ConfigView,
        previewView: NewsApp.PreviewView
    });

    return NewsApp;
});
