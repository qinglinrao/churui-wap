<?php
/**
 * Created by PhpStorm.
 * User: root
 * Date: 15-1-7
 * Time: 下午3:44
 */

class CommentController extends BaseController {

    //获取客户评论列表
    public function getComments(){

        $comments = Comment::customer()->get();
        return View::make('customers.comments.index')
                    ->with('comments',$comments);
    }

} 