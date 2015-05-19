<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午2:00
 */

class Region  extends Eloquent{

    protected $table = 'regions';

    public function scopeProvinces($query) {

        return $query->where('province_id', '=', 0)->remember(600);
    }

    public function scopeAllCities($query) {

        return $query->where('province_id', '!=', 0)->where('city_id','=',0)->remember(600);
    }
    public function scopeCities($query,$pid) {

        return $query->where('province_id', '=', $pid)->where('city_id','=',0)->remember(600);
    }

    public function scopeAllDistricts($query) {

        return $query->where('province_id', '!=', 0)->where('city_id', '!=', 0)->where('district_id','=',0)->remember(600);
    }
    public function scopeDistricts($query,$cid) {

        return $query->where('city_id', '=', $cid)->where('district_id','=',0)->remember(600);
    }

    public function scopeAllResidents($query, $district_id=0) {

        return $query->where('district_id', '=', $district_id)->remember(5);
    }


    public function Country(){

        return $this->belongsTo('Region','country_id')->remember(5);

    }

    public function Province(){

        return $this->belongsTo('Region','province_id')->remember(5);

    }

    public function City(){

        return $this->belongsTo('Region','city_id')->remember(5);

    }

    public function District(){

        return $this->belongsTo('Region','district_id')->remember(5);

    }



} 