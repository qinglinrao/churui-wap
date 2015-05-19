<?php

class CustomerAccount extends Eloquent {

    public function front_image(){
        return $this->belongsTo('Image','image1','id');
    }

    public function back_image(){
        return $this->belongsTo('Image','image2','id');
    }
}

