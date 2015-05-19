<?php

class Option extends Base{

  protected $table = 'product_options';

  public function values(){
    return $this->hasMany('OptionValue','option_id');
  }
}