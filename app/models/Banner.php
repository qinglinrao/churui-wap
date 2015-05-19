<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午2:00
 */

class Banner  extends Base{

    protected $table = 'banners';

    public function image(){
        return $this->belongsTo('Image');
    }

    public function scopeOfType($query,$type=1){
        return $query->where('type',$type);
    }





} 