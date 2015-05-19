/**
 * Created by gibson on 14-11-5.
 */
define(function(require){
    'use strict';

    require('css!components/navigator/style.css');

    return {
        templates: {
            config: require('text!components/navigator/templates/config.html'),
            preview: require('text!components/navigator/templates/preview.html'),
            tpl_1: require('text!components/navigator/templates/tpl_1.html'),
            tpl_2: require('text!components/navigator/templates/tpl_2.html')
        }
    };
});