<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/12 0012
 * Time: 11:15
 */

namespace app\index\controller;

use think\Controller;
use think\Request;
use app\index\model\Cate as CateModel;
class Cate extends Controller
{
    public function cateList(){
        $cate=new CateModel();
        $count = CateModel::count();
        $cateres=$cate->catetree();
        $this->assign('cateres',$cateres);
        $this -> view -> assign('count', $count);
        return $this->fetch("cate_list");
    }
    //渲染分类列表添加界面
    public function cateAdd()
    {
        $cate=new CateModel();
        $this->view->assign('title','添加商品分类');
        $this->view->assign('keywords','商品分类');
        $this->view->assign('desc','添加商品分类');
        $cateres=$cate->catetree();
        $this->assign('cateres',$cateres);
        //$cateres=$cate->select();
        //$this->assign('cateres',$cateres);
        //将班级表中所有数据赋值给当前模板
      //  $this->view->assign('gradeList',\app\index\model\Grade::all());

        return $this->view->fetch('cate_add');
    }
    //添加列表到表中
    public function doAdd(Request $request)
    {
        //从提交表单中获取数据
        $data = $request -> param();

        //新增学生记录
        $result = CateModel::create($data);

        //设置返回数据
        $status = 0;
        $message = '添加失败,请检查';

        //检测更新结果,将结果返回给grade_edit模板中的ajax提交回调处理
        if (true == $result) {
            $status = 1;
            $message = '恭喜, 添加成功~~';
        }
        return ['status'=>$status, 'message'=>$message];
    }
    //渲染编辑管理员界面
    public function cateEdit(Request $request)
    {
        $cate=new CateModel();
        $cate_id = $request -> param('id');
        $result = CateModel::get($cate_id);
        $this->view->assign('title','编辑商品类别信息');
        $this->view->assign('keywords','商品类别');
        $this->view->assign('desc','编辑商品类别信息');
        $this->view->assign('cates',$result->getData());
        $cateres=$cate->catetree();
        $this->assign('cateres',$cateres);
        return $this->view->fetch('cate_edit');
    }

    //更新数据操作
    public function editCate(Request $request)
    {
        //获取表单返回的数据
//        $data = $request -> param();
        $param = $request -> param();

        //去掉表单中为空的数据,即没有修改的内容
        foreach ($param as $key => $value ){
            if (!empty($value)){
                $data[$key] = $value;
            }
        }

        $condition = ['id'=>$data['id']] ;
        $result = CateModel::update($data, $condition);


        if (true == $result) {
            return ['status'=>1, 'message'=>'更新成功'];
        } else {
            return ['status'=>0, 'message'=>'更新失败,请检查'];
        }
    }

    public function deleteCate(Request $request){
        $cate=new CateModel();
//        $id = $request -> param('id');
//        $childids=$cate->getchild($id);
//        $childids=implode(',',$childids);
//        if($cate->delete($childids)){
//            $this->success('删除栏目成功！');
//        }else{
//            $this->error('删除栏目失败！');
//        }
        $param = $request->param();
        $count = CateModel::destroy($param);
        if($count >0 ){
            $this->success("删除成功");
        }else{
            $this->error('删除栏目失败！');
        }
    }
}