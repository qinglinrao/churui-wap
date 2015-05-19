/**
 * Created by gibson on 14-11-5.
 */
define(function(require){
    'use strict';

    require('css!components/mainmenu/style.css');

    return {
        templates: {
            config: require('text!components/mainmenu/templates/config.html'),
            preview: require('text!components/mainmenu/templates/preview.html'),
            tpl_1: require('text!components/mainmenu/templates/tpl_1.html')
        }
    };
});