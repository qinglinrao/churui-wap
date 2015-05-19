<?php

class CustomerObserver {



    public function created($model)
    {

        try{
            DB::beginTransaction();
            self::changeLeaderCustomerNum($model,1);
            DB::commit();
        }catch (Exception $e){
            DB::rollBack();
            throw $e;
        }


    }

    public function deleted($model)
    {
        try{
            DB::beginTransaction();
            self::changeLeaderCustomerNum($model,-1);
            DB::commit();
        }catch (Exception $e){
            DB::rollBack();
            throw $e;
        }
    }

    //改变商家的客户数量
    protected function changeLeaderCustomerNum($model,$num){
        $leader = $model->leader;
        if($leader){
            $leader->customer_num += $num;
            $leader->save();
        }
    }


}