/**
 * Created by gibson on 14-11-5.
 */
define(function(require){
    'use strict';

    require('css!components/slideshow/style.css');

    return {
        templates: {
            config: require('text!components/slideshow/templates/config.html'),
            preview: require('text!components/slideshow/templates/preview.html'),
            tpl_1: require('text!components/slideshow/templates/tpl_1.html')
        }
    };
});