<?php

class AjaxController extends BaseController {

    /**
     * 图片上传
     * 路径为 '/uplodas/'
     * @return \Illuminate\Http\JsonResponse
     */
    public function postPhotoUpload()
    {

//        $file = Input::file('photo');
//
//        Log::info(Config::get('app.upload_dir'));
//        $extension = $file->getClientOriginalExtension();
//        Log::info($extension);
//        $size = $file->getSize();
//
//        $directory = '/uploads/'.date('Y-m-d').'/';
//        $path = Config::get('app.upload_dir') .'/'.'uploads/'.date('Y-m-d').'/';
//        mkFolder($path);
//        $filename = str_random(10).".".$extension;
//        $file->move($path, $filename);
//
//        $image = Image::create([
//            'name'  => '',
//            'url' => $directory.$filename,
//            'path' => $path.$filename,
//
//            'file_type' => $extension,
//            'file_path' => '',
//            'file_size' => $size,
//
//        ]);
//
//        return Response::json($image);


        if($file = Input::file('photo'))
        {
            $extension = $file->getClientOriginalExtension();
            $size = $file->getSize();

            $directory = '/uploads/'.date('Y-m-d').'/';
            $filename = str_random(5).time().".{$extension}";
            $path = Config::get('app.upload_dir') .'/'.'uploads/'.date('Y-m-d').'/';
            mkFolder($path);
            $file->move($path, $filename);

            Img::make($path . $filename)->resize(640,640)->save($path . $filename);
//            Img::make($path . $filename)->fit(640, 640, function ($constraint) {
//                $constraint->upsize();
//            })->save();

            $image = Image::create([
                'name'  => '',
                'url' => $directory.$filename,
                'path' => $path.$filename,
                'file_type' => $extension,
                'file_path' => '',
                'file_size' => $size
            ]);
            $image->url = AppHelper::imgSrc($image->url);
        }

        return Response::json($image);
    }

    /**
     * 获取产品分类
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCategories()
    {
        $categories = ProductCategory::roots()->with('children')->get();

        // TODO 使用Baum\Node的默认方法
        // foreach($categories as $key => $category) {
        //    $categories[$key] = $category->getDescendantsAndSelf()->toHierarchy()->toArray();
        //    print_r($category->getDescendantsAndSelf()->toHierarchy()->toArray());
        // }

        return Response::json($categories);
    }

    /**
     * 将用户(顾客)添加到组
     * @return \Illuminate\Http\JsonResponse
     */
    public function postAddToGroup(){
        $ids = Input::get('ids');
        $group_id = Input::get('group_id');
        if($ids && $group_id){
            $customer_ids = explode(",",$ids);
            $customers = Customer::whereIn('id',$customer_ids)->get();
            try{
                DB::transaction(function() use ($customers,$group_id)
                {
                    foreach($customers  as $customer){
                        $count = CustomerCustomersGroup::customer($customer->id)->group($group_id)->count();
                        if($count <= 0){
                            $customer_customers_group = new CustomerCustomersGroup();
                            $customer_customers_group->customer_id = $customer->id;
                            $customer_customers_group->group_id = $group_id;
                            $customer_customers_group->save();
                        }
                    }
                });
                return Response::json(array('result'=>1));
            }catch (Exception $e){

                Log::info($e->getMessage());
                return Response::json(array('result'=>0));
            }
        }
        else{
            return Response::json(array('result'=>0));
        }
    }

    /**
     * 根据省编号获取下级市
     * @return \Illuminate\Http\JsonResponse
     */
    public function postGetCitys(){
        $province_id = Input::get('province_id');
        $citys = Region::where('province_id',$province_id)->where('city_id',0)->get();
        return Response::json($citys);
    }

    /**
     * 创建产品分润规则模板
     * @return mixed
     */
    public function postCreateProfit(){
        $data = array(
            'id'    => Input::get('id'),
            'name' => Input::get('name'),
            'first'   => Input::get('first'),
            'two'=> Input::get('two'),
            'three'=> Input::get('three')
        );
        $rules = array(
            'name' =>"required",
            'first' => "required|integer|between:0,100",
            'two' => "required|integer|between:0,100",
            'three' => 'required|integer|between:0,100'
        );
        $messages = array(
            'name.required' => '请输入名称',
            'first.required' => '请输入第一级分润值',
            'two.required' => '请输入第二级分润值',
            'three.required' => '请输入第三级分润值',
            'first.integer' => '第一级分润值必须为整数',
            'two.integer' => '第二级分润值必须为整数',
            'three.integer' => '第三级分润值必须为整数',
            'first.between' => '第一级分润值必须为0～100之间的整数',
            'two.between' => '第二级分润值必须为0～100之间的整数',
            'three.between' => '第三级分润值必须为0～100之间的整数',

        );
        $v = Validator::make($data, $rules, $messages);
        if ($v->fails()) {
            return $this->setJsonMsg(0,$v->messages()->first());
        }else{

            if(isset($data['id']) && !empty($data['id'])){
                $profit = ProductProfit::where('id',$data['id'])->first();
            }else{
                $profit = new ProductProfit();
            }

            $profit->name = $data['name'];
            $profit->first = $data['first'];
            $profit->two = $data['two'];
            $profit->three = $data['three'];
            if($profit->save()){
                return $this->setJsonMsg(1,'');
            }else{
                return $this->setJsonMsg(0,'系统错误!');
            }
        }

    }

    public function postGetSecondCategory(){
        $rootCategory = Input::get('root_category_id');
        $second_categories = ProductCategory::where('parent_id',$rootCategory)->get();
        return Response::json($second_categories);
    }


    public function postChangeProductStatus(){
        $ids = Input::get('ids');

        $status = Input::get('status');

        if($ids && in_array($status,['1','0'])){
            Log::info($status);
            $product_ids = explode(",",$ids);
            try{
                DB::beginTransaction();
                Product::whereIn('id',$product_ids)->update(['visible'=>$status]);
                DB::commit();
                return Response::json(array('result'=>1));

            }catch (Exception $e){
                DB::rollBack();
                return Response::json(array('result'=>0));
            }
        }else{
            return Response::json(array('result'=>0));
        }

    }

    public function postUploadCategoryImage(){
        $image = Input::file('image_id');
        $category_id = Input::get('category_id');
        $category = ProductCategory::where('id',$category_id)->first();
        if($category){
            $configure = array(
                'attr'=>'image_id',
                'folder'=>'Category',
                'relation_image_name'=>'coverImage',
                'width'=>640,
                'height'=>640
            );
            try{
                $image = $this->uploadImage($image,$configure,true,true,$category);
                return $this->setJsonMsg(1,$image->url);
            }catch (Exception $e){
                $this->setJsonMsg(0,'系统错误!');
            }
        }else{
            return $this->setJsonMsg(0,'该分类不存在!');
        }
    }

    public function postSearchProduct(){
        $q = Input::get('query');
        return Product::where('name','like','%'.$q.'%')->orWhereHas('category',function($query) use($q){
            $query->where('name','like',$q.'%');
        })->whereVisible(1)->ofType(0)->get();
    }


    public function postEditorPhotoUpload()
    {
        Debugbar::disable();
        if($file = Input::file('upload'))
        {
            $extension = $file->getClientOriginalExtension();
            $size = $file->getSize();

            $directory = '/uploads/'.date('Y-m-d').'/';
            $filename = str_random(5).time().".{$extension}";
            $path = Config::get('app.upload_dir') .'/'.'uploads/'.date('Y-m-d').'/';
            mkFolder($path);
            $file->move($path, $filename);
            Img::make($path.$filename)->widen(640)->save();
            $url = Config::get('app.image_domain').$directory.$filename;
            $image = Image::create([
                'name'  => '',
                'url' => $url,

                'file_type' => $extension,
                'file_path' => '',
                'file_size' => $size
            ]);
        }
        $editor = Input::get('CKEditorFuncNum');
        return "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction('{$editor}','{$url}');
        </script>";
    }
}