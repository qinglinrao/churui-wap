<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-4
 * Time: 下午3:45
 */

class AddressController  extends BaseController{

    //获取地址列表
    public function getIndex(){

        $addresses = Address::customer()->orderBy('id','desc')->get();
        return View::make('customers.addresses.index')
                     ->with('addresses',$addresses);
    }

    //添加地址页面
    public function getAdd(){
        $region = locations(Input::get('region_district') > 0 ? Input::get('region_district') : Input::get('region_city', 0));
        $locations = AppHelper::Locations();
        return View::make('customers.addresses.new')
            ->with('region', $region)
            ->with('locations',$locations);
    }

    //新增地址操作
    public function postAdd(){
        $data = array(
            'name' => trim(htmlspecialchars(Input::get('name'))),
            'telephone' => trim(htmlspecialchars(Input::get('telephone'))),
            'address' => trim(htmlspecialchars(Input::get('address')))
        );

        $rules = array(
            'name' => 'required',
            'telephone' => 'required|cnphone',
            'address' => 'required'

        );
        $messages = array(
            'name.required' => '请填写收件人姓名',
            'telephone.required' => '请填写手机号码',
            'telephone.cnphone' => '请填写正确的手机号',
            'address.required' => '请填写详细地址'
        );
        $v = Validator::make($data, $rules, $messages);
        if($v->fails()){
            return Redirect::route('address.add',['redirect'=>Input::get('redirect')])->withErrors($v->messages())->withInput();
        }else{
            $region_id = $this->getSelectAddress(Input::get('region_province'),Input::get('region_city'),Input::get('region_district'));
            if($region_id > 0){
                $address = new Address;
                $address->name = $data['name'];
                $address->mobile = Auth::customer()->user()->mobile;
                $address->telephone = $data['telephone'];
                $address->region_id = $region_id;
                $address->customer_id = Auth::customer()->user()->id;
                $address->address = $data['address'];
                $address->alias = getFullRegionPath($region_id).' '.$data['address'];
                Log::info(Input::get('redirect'));
                if($address->save()){
                    if(Input::get('redirect') != ''){
                        return Redirect::route(Input::get('redirect'));
                    }
                    return Redirect::route('addresses');
                }else{
                    return Redirect::route('address.add',['redirect'=>Input::get('redirect')])->withErrors(array('region.not_exsits'=>'系统错误'))
                        ->withInput();
                }

            }else{
                return Redirect::route('address.add')->withErrors(array('region.not_exsits'=>'请选择地区'))->withInput();
            }

        }
    }

    //删除地址
    public function getDel($id){

        $address = Address::where('id',$id)->customer()->first();
        if($address){
            if($address->delete()){
                return Redirect::route('addresses');
            }else{
                return Redirect::route('addresses')->withErrors(array('error'=>'系统错误'));
            }
        }else{
            return Redirect::route('addresses')->withErrors(array('error'=>'地址不存在'));
        }
    }

    //转向地址编辑页面
    public function getEdit($id){
        $address = Address::where('id',$id)->customer()->first();
        $region = locations($address->region_id);
        if($address){
            $locations = AppHelper::Locations();
            return View::make('customers.addresses.edit')
                         ->with('address',$address)
                         ->with('region', $region)
                         ->with('locations',$locations);

        }else{
            return Redirect::route('addresses')->withErrors(array('error'=>'地址不存在'));
        }
    }

    //更新地址信息操作
    public function postEdit(){
        $address = Address::where('id',Input::get('id'))->customer()->first();
        if($address){
            $data = array(
                'name' => trim(htmlspecialchars(Input::get('name'))),
                'telephone' => trim(htmlspecialchars(Input::get('telephone'))),
                'address' => trim(htmlspecialchars(Input::get('address')))
            );

            $rules = array(
                'name' => 'required',
                'telephone' => 'required|cnphone',
                'address' => 'required'

            );
            $messages = array(
                'name.required' => '请填写收件人姓名',
                'telephone.required' => '请填写电话号码',
                'telephone.cnphone' => '请填写正确的手机号',
                'address.required' => '请填写详细地址'
            );
            $v = Validator::make($data, $rules, $messages);
            if($v->fails()){
                return Redirect::route('address.edit',array('id'=>$address->id))->withErrors($v->messages())->withInput();
            }else{
                $region_id = $this->getSelectAddress(Input::get('region_province'),Input::get('region_city'),Input::get('region_district'));
                if($region_id > 0){
                    $address->name = $data['name'];
                    $address->mobile = Auth::customer()->user()->mobile;
                    $address->telephone = $data['telephone'];
                    $address->region_id = $region_id;
                    $address->address = $data['address'];
                    $address->alias = getFullRegionPath($region_id).' '.$data['address'];

                    if($address->save()){
                        return Redirect::route('addresses');
                    }else{
                        return Redirect::route('address.edit',array('id'=>$address->id))->withErrors(array('region.not_exsits'=>'系统错误'))->withInput();
                    }

                }else{
                    return Redirect::route('address.edit',array('id'=>$address->id))->withErrors(array('region.not_exsits'=>'请选择地区'))->withInput();
                }
            }

        }else{
            return Redirect::route('addresses')->withErrors(array('error'=>'地址不存在'));
        }
    }

    //设置默认地址
    public function postSetDefault($id){
        $address = Address::where('id',$id)->customer()->first();
        if($address){
            DB::transaction(function() use ($address){
                Address::customer()->whereNotIn('id', array($address->id))->update(array('default' => 0));
                $address->default = 1;
                $address->save();
            });
            return Redirect::route('addresses');
        }else{
            return Redirect::route('addresses')->withErrors(array('error'=>'地址不存在'));
        }
    }


    //获取已选择的地区编号
   public function getSelectAddress($p_id,$c_id,$d_id){
       $address_id  = 0;
       if($d_id > 0){
           $address_id = $d_id;
       }else if($c_id > 0){
           $address_id = $c_id;
       }else if($p_id > 0){
           $address_id = $p_id;
       }
       return $address_id;
   }

} 

