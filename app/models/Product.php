<?php

class Product extends Base{

  protected $table = 'products';

  public function latestComment(){
    return $this->hasMany('Comment','product_id')->latest()->take(1);
  }

  public function services(){
    return $this->belongsToMany('Service','product_services_products','product_id');
  }

  public function options(){
    return $this->belongsToMany('Option','product_options_products','product_id')->distinct();
  }

  public function entities(){
    return $this->hasMany('ProductEntity','product_id')->where('stock','>',0);
  }

  public function images(){
    return $this->belongsToMany('Image','product_images_products','product_id');
  }


  public function brand(){
    return $this->belongsTo('Brand','brand_id');
  }

  public function attributeValues(){
    return $this->belongsToMany('AttributeValue','category_attribute_values_products','product_id','value_id');
  }

  public function scopeCategories($query,$catIds){
      return $query->whereIn('category_id',$catIds);
  }

  public function productProfit(){
      return $this->belongsTo('ProductProfit','profit_id','id');
  }


  public function thumb(){
      return $this->belongsTo('Image','image_id','id');
  }

  public function scopeVisible($query){
      return $query->where('visible',1);
  }

  public function shopProducts(){
      return $this->hasMany('ShopProduct','product_id','id');
  }

  public function scopeDisplayType($query,$type=0){
      return $query->where('display_type',$type);
  }



}