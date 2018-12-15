<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/12 0012
 * Time: 11:25
 */

namespace app\index\model;
use think\Model;

class Cate extends Model
{
    public function catetree(){
        $data=$this->order('id desc')->select();
        return $this->resort($data);
    }

    public function resort($data,$pid=0,$level=0){
        static $arr=array();
        foreach ($data as $k => $v) {
            if ($v['pid']==$pid) {
                $v['level']=$level;
                $arr[]=$v;
                $this->resort($data,$v['id'],$level+1);
            }
        }
        return $arr;
    }
    public function getchild($cateid){
        $data=$this->select();
        return $this->getchildids($data,$cateid);
    }
    public function getchildids($data,$cateid){
        static $res=array();
        $res[]=$cateid;
        foreach ($data as $k => $v) {
            if ($v['pid']==$cateid) {
                $res[]=$v['id'];
                $this->getchildids($data,$v['id']);

            }
        }
        return array_unique($res);
    }
}