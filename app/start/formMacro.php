<?php

Form::macro('location', function($name, $locatioins, $delta = 1) {

    $field = '<ul class="clearfix locations">';
    $field .= '<li>'.Form::select($name . '_province', $locatioins['provinces'], $locatioins['default_p'], array('class' => 'province ' . $delta, 'data-role' => 'none')).'</li>';
    $field .= '<li>'.Form::select($name . '_city', $locatioins['cities'], $locatioins['default_c'], array('class' => 'city ' . $delta, 'data-role' => 'none')).'</li>';
    $field .= '<li>'.Form::select($name . '_district', $locatioins['districts'], $locatioins['default_d'], array('class' => 'district ' . $delta, 'data-role' => 'none')).'</li>';
    //$field .= Form::select($name.'_resident', $locatioins['residents'], $locatioins['default_r'], array('class' => 'resident '.$delta));
    $field .= '</ul>';
    return $field;
});
