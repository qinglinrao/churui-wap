<?php

class ProductCategory extends Baum\Node {

  protected $table = 'product_categories';

  public function scopeSite($query,$site_id){
    return $query->where('site_id',$site_id);
  }

  public function scopeDomain($query){

    /**
     * todo return true site_id
     */
    if(SUB_DOMAIN == 'hardy'){
      $site_id = 1;
    }else{
      $site_id = 1;
    }

    return $query->where('site_id',$site_id);
  }

  public function products(){
    return $this->hasMany('Product','category_id');
  }

  public function image(){
      return $this->belongsTo('Image','image_id','id');
  }

}