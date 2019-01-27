<?php
namespace app\admin\controller;
use app\common\controller\Adminbase;

class Admin extends Adminbase
{
    public function initialize()
    {
        parent::initialize();
        $this->model = model('Admin');
        
    }
    
    public function index()
    {
        if($this->request->isAjax()){
            $page = $this->request->get('page/d');
            $limit = $this->request->get('limit/d');
            $params = $this->request->except('page,limit');
            $where = [];
            if($params){
                foreach($params as $key=>$value){
                    if($value){
                        $where[] = array($key,'like','%'.trim($value).'%');
                    }
                }  
            }
            $field = 'id,username,nickname,email,createtime,updatetime,status';
            $_list = $this->model->where($where)->page($page, $limit)->field($field)->select();
            $total = count($this->model->where($where)->page($page, $limit)->field($field)->select());
            $result = array("code" => 0, "count" => $total, "data" => $_list);
            return json($result);
        }
        return $this->view->fetch();
    }

    public function add(){
        echo 'add';
    }

    public function edit(){
        echo 'edit';
    }

    public function del(){
        echo 'del';
    }

    public function multidel(){
        echo 'multidel';
    }
}