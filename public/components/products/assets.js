/**
 * Created by gibson on 14-11-5.
 */
define(function(require){
    'use strict';

    require('css!components/products/style.css');

    return {
        templates: {
            config: require('text!components/products/templates/config.html'),
            preview: require('text!components/products/templates/preview.html'),
            tpl_1: require('text!components/products/templates/tpl_1.html'),
            tpl_2: require('text!components/products/templates/tpl_2.html')
        }
    };
});