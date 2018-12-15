<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/15 0015
 * Time: 10:30
 */

namespace app\index\model;
use think\Model;

class Client extends Model
{
    public function getLevelAttr($value)
    {
        $level = [
            1=>'VIP客户',
            2=> '普通客户'
        ];
        return $level[$value];
    }
}