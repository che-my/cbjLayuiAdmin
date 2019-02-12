<?php

namespace app\admin\controller;

use app\common\controller\Adminbase;
use libs\Tree;
use think\facade\Cache;
use think\Db;
use app\admin\validate\AuthRule;

/**
 * 规则管理
 */
class Rule extends Adminbase
{

    /**
     * @var \app\admin\model\AuthRule
     */
    protected $model = null;
    protected $rulelist = [];
    protected $multiFields = 'ismenu,status';

    public function initialize()
    {
        parent::initialize();
        $this->model = model('AuthRule');
        // 必须将结果集转换为数组
        $ruleList = $this->model->withAttr("pid", function ($value, $data) {
            return $value == 0 ? -1 : $value;
        })->order('weigh', 'desc')->select()->toArray();
        // foreach ($ruleList as $k => &$v)
        // {
            
        // }
        // unset($v);
        Tree::instance()->init($ruleList);
        $this->rulelist = Tree::instance()->getTreeList(Tree::instance()->getTreeArray(0), 'title');
        $ruledata = [0 => '无'];
        foreach ($this->rulelist as $k => &$v)
        {
            if (!$v['ismenu'])
                continue;
            $ruledata[$v['id']] = $v['title'];
        }
        $icons = Db::name('icons')->select();
        $this->assign("icons", $icons);
        $this->view->assign('ruledata', $ruledata);
    }

    /**
     * 查看
     */
    public function index()
    {
        if ($this->request->isAjax())
        {
            $list = $this->rulelist;
            foreach($list as $k=>$v){
                if($v['pid']=='0'){
                  $list[$k]['pid'] = -1;
                } 
            }
            $total = count($this->rulelist);
            $result = array("count" => $total,'code'=>0, 'msg'=>'ok',"data" => $list);
            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 添加
     */
    public function add()
    {
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            if ($params)
            {
                if (!$params['ismenu'] && !$params['pid'])
                {
                    $this->error();
                }
                //这里需要针对name做唯一验证
                $ruleValidate = new AuthRule();
                $result = $ruleValidate->check($params);
                $res = $this->model->save($params);
                if ($result === false||!$res) {
                    $this->error($ruleValidate->getError());
                }
                $result = array('code'=>1, 'msg'=>'添加成功',"data" => '','url'=>'');
                return json($result);
            }
            $result = array('code'=>0, 'msg'=>'添加失败',"data" => '','url'=>'');
            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 编辑
     */
    public function edit()
    {
        $id = $this->request->get('id/d');
        $row = $this->model->get(['id' => $id]);
        !$row ? $this->error("暂无该条数据!") : '' ;
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a");
            if ($params)
            {
                if (!$params['ismenu'] && !$params['pid'])
                {
                    $this->error('非菜单规则节点必须有父级');
                }
                //这里需要针对name做唯一验证
                $ruleValidate = new AuthRule();
                $result = $ruleValidate->check($params);
                if ($result === false) {
                    $this->error($ruleValidate->getError());
                }
                $res = $row->save($params);
                if (!$res) {
                    $msg = '更新失败';
                    $code = 0;
                }else{
                    $msg = '更新成功';
                    $code = 1;
                }
                $result = array('code'=>$code, 'msg'=>$msg,"data" => '','url'=>url('rule/index'));
                return json($result);
            }else{
                $result = array('code'=>0, 'msg'=>'更新失败',"data" => '','url'=>'');
                return json($result);
            }
        }
        $this->view->assign("row", $row);
        return $this->view->fetch();
    }

    /**
     * 删除
     */
    public function del($ids = "")
    {
        if ($ids)
        {
            $delIds = [];
            foreach (explode(',', $ids) as $k => $v)
            {
                $delIds = array_merge($delIds, Tree::instance()->getChildrenIds($v, TRUE));
            }
            $delIds = array_unique($delIds);
            $count = $this->model->where('id', 'in', $delIds)->delete();
            if ($count)
            {
                $this->success();
            }
        }
        $this->error();
    }

}
