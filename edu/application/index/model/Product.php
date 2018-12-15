<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/12 0012
 * Time: 15:36
 */

namespace app\index\model;
use think\Model;

class Product extends Model
{
    public function _before_insert(&$data,$option){
        if($_FILES['original']['tmp_name']){
            $upload = new \Think\Upload();// 实例化上传类
            $upload->maxSize = 3145728 ;// 设置附件上传大小
            $upload->exts = array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
            // $upload->autoSub = false;
            $upload->savePath = './public/uploads/Goods/'; // 设置附件上传目录
            $upload->rootPath = './';
            $info = $upload->uploadOne($_FILES['original']);
            $original=$info['savepath'].$info['savename'];
            $max_thumb=$info['savepath'].'max_'.$info['savename'];
            $mid_thumb=$info['savepath'].'mid_'.$info['savename'];
            $sm_thumb=$info['savepath'].'sm_'.$info['savename'];
            $image = new \Think\Image();
            $image->open($original);
            $image->thumb(362, 362)->save($max_thumb);
            $image->thumb(222, 222)->save($mid_thumb);
            $image->thumb(67, 67)->save($sm_thumb);
            $data['original']=$original;
          //  $data['max_thumb']=$max_thumb;
            //$data['mid_thumb']=$mid_thumb;
            //$data['sm_thumb']=$sm_thumb;
        }
    }
    public function brand()
    {
        return $this->belongsTo('brand');
    }
    public function cate()
    {
        return $this->belongsTo('cate');
    }

}