<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午3:45
 */

class RegionController  extends BaseController{

    //根据省编号获取下级市
    public function postGetCitys(){
        $province_id = Input::get('province_id');
        $citys = Region::where('province_id',$province_id)->where('city_id',0)->get();
        return Response::json($citys);
    }

    public function postGetDistricts(){
        $city_id = Input::get('city_id');
        $districts = Region::where('city_id',$city_id)->where('district_id',0)->get();
        return Response::json($districts);
    }

    public function postGetProvinces(){
        $province = Region::where('province_id',0)->get();
        return Response::json($province);
    }

} 

