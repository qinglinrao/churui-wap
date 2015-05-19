<?php

class BaseController extends Controller {

	function __construct(){

	}


	/**
	 * Setup the layout used by the controller.
	 *
	 * @return void
	 */
	protected function setupLayout()
	{
		if ( ! is_null($this->layout))
		{
			$this->layout = View::make($this->layout);
		}
	}

    /** 返回JSON数据响应头
     * @param $state 返回状态码 默认1  （1或者0)
     * @param string $msg 返回信息 默认为空字符串
     * @return mixed
     */
    protected function setJsonMsg($state,$msg=''){
        return Response::json(array('state'=>$state,'msg'=>$msg));
    }

    /**
     * @param $file input file 域对象
     * @param array $config  配置数组
     *          attr                = >  目标对象对应image表的字段 默认为"image_id"
     *          folder              = >  图片要上传的文件夹 默认为"Users"
     *          relation_image_name = >  目标对象对应image表的字段 默认为"image_id"
     *          width               = >  图片裁剪的宽度   (可选配置参数,与height同时设置才有效)
     *          height              = >  图片裁剪的高度   (可选配置参数,与width同时设置才有效)
     * @param null $obj     目标对象 默认为 null
     * @param bool $update_obj  是否更新目标对象 默认为 false
     * @param bool $del_orgin_image 是否删除目标对象 原关联的Image图片 默认为false
     * @throws Exception
     */
    protected  function uploadImage($file,$config,$update_obj = false,$del_orgin_image = false,$obj = null){


        $config = array_merge(array('attr'=>'image_id','folder'=>'Users','relation_image_name'=>'image'),$config);
//        Log::info($config);
        $name = time() . '.' . $file->getClientOriginalExtension();

        $file_size =  $file->getSize();

        $folder = 'uploads/'.$config['folder'].'/';
        mkFolder(Config::get('app.upload_dir') .'/'.$folder);
        $file->move(Config::get('app.upload_dir') .'/'.$folder, $name);
        if(isset($config['width']) && isset($config['height']))
            ImgUtil::make(Config::get('app.upload_dir') .'/'.$folder.$name)->resize($config['width'], $config['height'])->save(Config::get('app.upload_dir') .'/'.$folder . $name);
        $image = new Image();
        $image->name =  $name;
        $image->url = '/'.$folder . $name;
        $image->file_path = Config::get('app.upload_dir') .'/'.$folder. $name;
        $image->file_size = $file_size;
        $image->file_type = $file->getClientOriginalExtension();
        try{

            DB::beginTransaction();
            $image->save();
            Log::info('image save');
            //如果有要操作的对象并且允许改变其image_id
            if($obj != null && $update_obj){
                $orgin_image = $obj->$config['relation_image_name'];
                $obj->$config['attr'] = $image->id;
                $obj->save();
                if($del_orgin_image && $orgin_image){
                    $orgin_image->delete();
                    $this->deleteFile($orgin_image->file_path);
                }
            }
            DB::commit();
            $image->url = AppHelper::imgSrc($image->url);
            return $image;

        }catch (Exception $e){
            DB::rollback();
            throw $e;
        }

    }


    protected  function deleteFile($file_path){
        if(file_exists($file_path)){
            @unlink($file_path);
        }
        return true;
    }



    public function postAuthCode(){
        $data = array(
            'mobile' => Input::get('mobile')
        );
        $rules = array(
            'mobile' =>"required|cnphone",
        );
        $messages = array(
            'mobile.required' => '请填写手机号',
            'mobile.cnphone' => '请填写正确格式的手机号',
        );

        $v = Validator::make($data, $rules, $messages);

        if ($v->fails()) {
            $result['state'] = 0;
            $result['msg'] = $v->messages()->first();
        }else{
            $hasSent = AuthCode::type('mobile')->mobile(Input::get('mobile'))->valid()->count();
            if($hasSent <= 0){
                $mobiles[] = $data['mobile'];
                $code = rand(100000,999999);
                $content = Yimei::getContent($code);
                $sendState = Yimei::sendSMS($mobiles,$content);
                if($sendState === '0'){
                    $result['state'] = 1;
                    $authCode = new AuthCode();
                    $authCode->email = 'test';
                    $authCode->mobile = $data['mobile'];
                    $authCode->type= 'mobile';
                    $authCode->code = $code;
                    $authCode->state = $sendState;
                    $authCode->expired_at = Carbon::now()->addHours(8);
                    if(!$authCode->save()){
                        $result['state'] = 0;
                        $result['msg'] = "系统出错啦!(But验证码发送成功!)";
                    }
                }else{
                    $result['state'] = 0;
                    $result['msg'] = "验证码发送失败($sendState)";
                }

            }else{
                $result['state'] = 0;
                $result['msg'] = '您的验证码在'.Config::get('app.verify_phone_time').'分钟内已发送过!';
            }
        }

        return Response::json($result);

    }




}
