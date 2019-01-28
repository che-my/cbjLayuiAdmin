<?php

namespace app\admin\controller;

use app\common\controller\Adminbase;
use libs\Tree;
use think\facade\Cache;

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
            $params = $this->request->post("row/a", [], 'strip_tags');
            if ($params)
            {
                if (!$params['ismenu'] && !$params['pid'])
                {
                    $this->error(__('The non-menu rule must have parent'));
                }
                $result = $this->model->validate()->save($params);
                if ($result === FALSE)
                {
                    $this->error($this->model->getError());
                }
                Cache::rm('__menu__');
                $this->success();
            }
            $this->error();
        }
        return $this->view->fetch();
    }

    /**
     * 编辑
     */
    public function edit($ids = NULL)
    {
        $row = $this->model->get(['id' => $ids]);
        if (!$row)
            $this->error(__('No Results were found'));
        if ($this->request->isPost())
        {
            $params = $this->request->post("row/a", [], 'strip_tags');
            if ($params)
            {
                if (!$params['ismenu'] && !$params['pid'])
                {
                    $this->error(__('The non-menu rule must have parent'));
                }
                //这里需要针对name做唯一验证
                $ruleValidate = \think\Loader::validate('AuthRule');
                $ruleValidate->rule([
                    'name' => 'require|format|unique:AuthRule,name,' . $row->id,
                ]);
                $result = $row->validate()->save($params);
                if ($result === FALSE)
                {
                    $this->error($row->getError());
                }
                Cache::rm('__menu__');
                $this->success();
            }
            $this->error();
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
                Cache::rm('__menu__');
                $this->success();
            }
        }
        $this->error();
    }

}
