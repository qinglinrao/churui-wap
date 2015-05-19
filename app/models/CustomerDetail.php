<?php

class CustomerDetail extends Eloquent {

    protected $table = 'customer_details';
    
    public $timestamps = false;


    public function scopeCategory($query, $cat_id = 0) {

        return $query->where('cat_id', '=', $cat_id);
    }

    public function scopePublished($query) {

        return $query->where('visible', '=', '1')->where('publish_at', '<', Carbon::now());
    }
    public function cat(){
        return $this->belongsTo('ArtCat','cat_id')->remember(5);
    }

    public function image() {

        return $this->hasOne('Image', 'id', 'image_id')->remember(5);
    }

    public function comments() {

        return $this->hasMany('ArtComment', 'art_id', 'id')->where('visible', '=', 1)->remember(5);
    }

    public function latestComment() {

        return $this->hasOne('ArtComment', 'art_id', 'id')->where('visible', '=', 1)->orderBy('created_at', 'DESC');
    }

    public function scopePrev($query, $id) {
        
        return $query->where('id', '<', $id)->orderBy('priority','DESC')->orderBy('id', 'DESC');
        
    }
    
    public function scopeNext($query, $id) {
        
        return $query->where('id', '>', $id)->orderBy('priority','DESC')->orderBy('id', 'ASC');
        
    }
    
    
    public function relateArticles(){
        
        return $this->belongsToMany('Article','art_relations','record_id','art_id')->where('record_type','=','Article')->remember(5);
        
    }
    
    public function arttags(){
        
        return $this->belongsToMany('ArtTag','bind_art_tags','art_id','tag_id')->remember(5);
        
    }
    
    
    public function scopeGetPaginate($query,$num = 5){
        
        return $query->paginate($num);
        
    }

}

