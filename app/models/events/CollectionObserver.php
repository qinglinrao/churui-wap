<?php

class CollectionObserver {



    public function created($model)
    {

        try{
            DB::beginTransaction();
            self::changeProductCollectionCount($model,1);
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
            self::changeProductCollectionCount($model,-1);
            DB::commit();
        }catch (Exception $e){
            DB::rollBack();
            throw $e;
        }
    }

    //改变产品的收藏统计数
    protected function changeProductCollectionCount($model,$num){
        $product = $model->product;
        if($product){
            $product->collection_count += $num;
            $product->save();
        }
    }


}