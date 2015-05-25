<?php

class AccountController extends BaseController {
    public $customer;

    function __construct() {
        $this->customer = Auth::customer()->check()?Auth::customer()->user():null;
    }

    public function getIndex(){
        $account = CustomerAccount::where('customer_id',$this->customer->id)->with('front_image','back_image')->first();
        return View::make('customers.account.index',compact('account'));
    }

    public function postEdit(){
        $account = CustomerAccount::where('customer_id',$this->customer->id)->first();

        if($account){
           try{
                DB::beginTransaction();


               $account->alipay_account = Input::get('alipay_account');
               $account->alipay_name = Input::get('alipay_name');
               $account->cash_account = Input::get('cash_account');
               $account->cash_name = Input::get('cash_name');
               $account->bank_name = Input::get('bank_name');
               $account->image1 = Input::get('photo1');
               $account->image2 = Input::get('photo2');
               $account->update();
                DB::commit();
            }catch (Exception $e){
                DB::rollback();
                return Redirect::back()->withErrors(array('系统错误'))->withInput();
            }

            return Redirect::route('account.index');
        }else{
            try{
                DB::beginTransaction();


                $account = new CustomerAccount();
                $account->alipay_account = Input::get('alipay_account');
                $account->alipay_name = Input::get('alipay_name');
                $account->cash_account = Input::get('cash_account');
                $account->cash_name = Input::get('cash_name');
                $account->bank_name = Input::get('bank_name');
                $account->image1 = Input::get('photo1');
                $account->image2 = Input::get('photo2');
                $account->customer_id = $this->customer->id;
                $account->save();

                DB::commit();
            }catch (Exception $e){
                DB::rollback();
                return Redirect::back()->withErrors(array('系统错误'))->withInput();
            }
            return Redirect::route('account.index');
        }
    }

    public function postPhotoUpload()
    {
        $file = Input::file('photo1');

        $extension = $file->getClientOriginalExtension();
        $size = $file->getSize();

        $directory = 'public/uploads/Customers/account-'.$this->customer->id.'/';
        $directory2 = 'uploads/Customers/account-'.$this->customer->id.'/';
        //$directory2 = 'images/uploads/'.date('Y-m-d').'/';
        $filename = str_random(10).".{$extension}";

        $file->move($directory, $filename);

        $image = new Image();
        $image->name = $filename;
        $image->url = $directory2.$filename;
        $image->file_type = $extension;
        $image->file_path = '';
        $image->file_size = $size;
        $image->save();

        return Response::json($image);
    }

    public function postPhotoUpload2()
    {
        $file = Input::file('photo2');

        $extension = $file->getClientOriginalExtension();
        $size = $file->getSize();

        $directory = 'public/uploads/Customers/account-'.$this->customer->id.'/';
        $directory2 = 'uploads/Customers/account-'.$this->customer->id.'/';
        //$directory2 = 'images/uploads/'.date('Y-m-d').'/';
        $filename = str_random(10).".{$extension}";

        $file->move($directory, $filename);

        $image = new Image();
        $image->name = $filename;
        $image->url = $directory2.$filename;
        $image->file_type = $extension;
        $image->file_path = '';
        $image->file_size = $size;
        $image->save();


        return Response::json($image);
    }
}
