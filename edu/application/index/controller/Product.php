<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/12/12 0012
 * Time: 15:42
 */

namespace app\index\controller;

use think\Controller;
use think\Request;
use app\index\model\Cate as CateModel;
use app\index\model\Product as ProductModel;
use app\index\model\Brand as BrandModel;
class Product extends Controller
{
    public function productList()
    {
        $product = new ProductModel();
        $productList = ProductModel::paginate(5);
        //获取记录数量
        $count = ProductModel::count();

        //给结果集对象数组中的每个模板对象添加班级关联数据,非常重要
        foreach ($productList as $value) {
            $value->cate = $value->cate->catename;
        }
        foreach ($productList as $value) {
            $value->brand = $value->brand->name;
        }
        $this->view->assign('productList', $productList);
        $this->view->assign('count', $count);
        return $this->view->fetch('product_list');
    }

    //渲染分类列表添加界面
    public function productAdd()
    {
        $cate = new CateModel();
        $brand = new BrandModel();
        $this->view->assign('title', '添加商品');
        $this->view->assign('keywords', '商品信息');
        $this->view->assign('desc', '添加商品信息');
        $cateres = $cate->catetree();
        $brandres = $brand->select();
        $this->assign('brandres', $brandres);
        $this->assign('cateres', $cateres);
        //$cateres=$cate->select();
        //$this->assign('cateres',$cateres);
        //将班级表中所有数据赋值给当前模板
        //  $this->view->assign('gradeList',\app\index\model\Grade::all());

        return $this->view->fetch('product_add');
    }

    public function doAdd(Request $request)
    {

        //从提交表单中获取数据
        $data = $request->param();
//        $file = request()->file('original');
//        $info = $file->validate(['size' => 15678, 'ext' => 'jpg,gif,png,jpeg'])->move(ROOT_PATH . 'public' . DS . 'uploads');
//        if ($info) {
//            $exclePath = $info->getSaveName();  //获取文件名
//            $file_name = ROOT_PATH . 'public' . DS . 'uploads' . DS . $exclePath;   //上传文件的地址
//            $data['original']=$file_name;
//            }
        // print_r($data);
        //新增学生记录
        $result = ProductModel::create($data);

        //设置返回数据
        $status = 0;
        $message = '添加失败,请检查';

        //检测更新结果,将结果返回给grade_edit模板中的ajax提交回调处理
        if (true == $result) {
            $status = 1;
            $message = '恭喜, 添加成功~~';
        }
        return ['status' => $status, 'message' => $message];
    }

    public function productEdit(Request $request)
    {
        $cate = new CateModel();
        $brand = new BrandModel();
        $product_id = $request->param('id');
        $result = ProductModel::get($product_id);
        $this->view->assign('title', '编辑商品信息');
        $this->view->assign('keywords', '商品信息');
        $this->view->assign('desc', '编辑商品信息');
        $this->view->assign('products', $result->getData());
        $cateres = $cate->catetree();
        $brandres = $brand->select();
        $this->assign('brandres', $brandres);
        $this->assign('cateres', $cateres);
        return $this->view->fetch('product_edit');
    }

    //更新数据操作
    public function editProduct(Request $request)
    {
        //获取表单返回的数据
//        $data = $request -> param();
        $param = $request->param();

        //去掉表单中为空的数据,即没有修改的内容
        foreach ($param as $key => $value) {
            if (!empty($value)) {
                $data[$key] = $value;
            }
        }

        $condition = ['id' => $data['id']];
        $result = ProductModel::update($data, $condition);


        if (true == $result) {
            return ['status' => 1, 'message' => '更新成功'];
        } else {
            return ['status' => 0, 'message' => '更新失败,请检查'];
        }
    }

    public function deleteProduct(Request $request)
    {
        $product = new ProductModel();
//        $id = $request -> param('id');
//        if($product->delete($id)){
//            $this->success('删除栏目成功！');
//        }else{
//            $this->error('删除栏目失败！');
//        }
        $param = $request->param();
        $count = ProductModel::destroy($param);
        if ($count > 0) {
            $this->success("删除成功", "product/productList");
        } else {
            $this->error('删除栏目失败！', "product/productList");
        }
    }

    public function addexcel()
    {
        $product = new ProductModel();
        vendor("PHPExcel.PHPExcel"); //获取PHPExcel类
        $excel = new \PHPExcel();

        $file = request()->file('file');
        $info = $file->validate(['size' => 15678, 'ext' => 'xlsx,xls,csv'])->move(ROOT_PATH . 'public' . DS . 'excel');


        if ($info) {
            $exclePath = $info->getSaveName();  //获取文件名
            $file_name = ROOT_PATH . 'public' . DS . 'excel' . DS . $exclePath;   //上传文件的地址
            $objReader = \PHPExcel_IOFactory::createReader('Excel2007');
            $obj_PHPExcel = $objReader->load($file_name, $encode = 'utf-8');  //加载文件内容,编码utf-8
            echo "<pre>";
            $excel_array = $obj_PHPExcel->getsheet(0)->toArray();   //转换为数组格式
            array_shift($excel_array);  //删除第一个数组(标题);
            $arr = reset($excel_array);
            unset($excel_array[0]);
            $data = [];
            $i = 0;
            foreach ($excel_array as $k => $v) {
          //      $data[$k]['id'] = $v[0];
                $data[$k]['proid'] = $v[0];
                $data[$k]['name'] = $v[1];
                $data[$k]['cate_id'] = $v[2];
                $data[$k]['brand_id'] = $v[3];
                $data[$k]['original'] = $v[4];
                $data[$k]['cost'] = $v[5];
                $data[$k]['price'] = $v[6];
                $data[$k]['stock'] = $v[7];
                $i++;
            }

            $res = $product->insertAll($data);
            $this->success("导入成功", "product/productList");
        }
        else{
            echo $file->getError();
        }

    }
}