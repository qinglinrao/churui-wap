/**
 * Created by gibson on 14-11-5.
 */
define(function(require){
    'use strict';

    require('css!components/news/style.css');

    return {
        templates: {
            config: require('text!components/news/templates/config.html.erb'),
            preview: require('text!components/news/templates/preview.html.erb'),
            tpl_1: require('text!components/news/templates/tpl_1.html.erb'),
            tpl_2: require('text!components/news/templates/tpl_2.html.erb')
        }
    };
});