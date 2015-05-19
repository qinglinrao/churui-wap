<?php

class MerchantObserver {

    public function saving($model)
    {

    }

    public function created($model)
    {

        try{
            DB::beginTransaction();
            self::createNewAccount($model);
            self::createNewShop($model);
            DB::commit();
        }catch (Exception $e){
            DB::rollBack();
            throw $e;
        }


    }

    public function deleted($model)
    {

    }

    //初始化一个店铺
    protected function createNewShop($model){
        $shop = $model->ownShop;
        if(!$shop){
            $shop = new Shop();
            $shop->name = '店铺名称';
            $shop->merchant_id = $model->id;
            if($model->weixin){
                $shop->weixin = $model->weixin;
            }
            $shop->intro = '我的店铺';
            $shop->save();
        }
    }

    //初始化一个财物帐号
    protected  function  createNewAccount($model){
        $account = $model->account;
        if(!$account){
            $account = new MerchantAccount();
            $account->merchant_id = $model->id;
            $account->status = 0;
            $account->save();
        }
    }


}