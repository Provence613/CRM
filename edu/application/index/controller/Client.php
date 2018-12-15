<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/15 0015
 * Time: 10:32
 */

namespace app\index\controller;

use think\Controller;
use think\Request;
use app\index\model\Client as ClientModel;
class Client extends Controller
{
    public function clientList(){
        $client=new ClientModel();
        $clientList = ClientModel::paginate(5);
        //获取记录数量
        $count = ClientModel::count();
        $this -> view -> assign('clientList', $clientList);
        $this -> view -> assign('count', $count);
        return $this -> view -> fetch('client_list');
    }
    //渲染分类列表添加界面
    public function clientAdd()
    {
        $this->view->assign('title','添加客户');
        $this->view->assign('keywords','客户信息');
        $this->view->assign('desc','添加客户信息');
        return $this->view->fetch('client_add');
    }
    public function doAdd(Request $request)
    {

        //从提交表单中获取数据
        $data = $request -> param();
        //      print_r($request);
        //新增学生记录
        $result = ClientModel::create($data);

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
    public function clientEdit(Request $request)
    {
        $client_id = $request -> param('id');
        $result = ClientModel::get($client_id);
        $this->view->assign('title','编辑商品信息');
        $this->view->assign('keywords','商品信息');
        $this->view->assign('desc','编辑商品信息');
        $this->view->assign('clients',$result->getData());;
        return $this->view->fetch('client_edit');
    }

    //更新数据操作
    public function editClient(Request $request)
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
        $result = ClientModel::update($data, $condition);


        if (true == $result) {
            return ['status'=>1, 'message'=>'更新成功'];
        } else {
            return ['status'=>0, 'message'=>'更新失败,请检查'];
        }
    }
    public function deleteClient(Request $request){
        $product=new ClientModel();
//        $id = $request -> param('id');
//        if($product->delete($id)){
//            $this->success('删除栏目成功！');
//        }else{
//            $this->error('删除栏目失败！');
//        }
        $param = $request->param();
        $count = ClientModel::destroy($param);
        if($count >0 ){
            $this->success("删除成功", "client/clientList");
        }else{
            $this->error('删除栏目失败！', "client/clientList");
        }
    }

}