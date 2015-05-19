/**
 * Created by gibson on 14-11-5.
 */
define(function(require){
    'use strict';

    require('css!components/search/style.css');

    return {
        templates: {
            config: require('text!components/search/templates/config.html'),
            preview: require('text!components/search/templates/preview.html'),
            tpl_1: require('text!components/search/templates/tpl_1.html'),
            tpl_2: require('text!components/search/templates/tpl_2.html'),
            tpl_3: require('text!components/search/templates/tpl_3.html'),
            tpl_4: require('text!components/search/templates/tpl_4.html'),
            tpl_5: require('text!components/search/templates/tpl_5.html')
        }
    };
});