/**
 * Created by gibson on 14-11-5.
 */
define(function(require){
    'use strict';

    require('css!components/ads/style.css');

    return {
        templates: {
            config: require('text!components/ads/templates/config.html'),
            preview: require('text!components/ads/templates/preview.html'),
            tpl_1: require('text!components/ads/templates/tpl_1.html')
        }
    };
});