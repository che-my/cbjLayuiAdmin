<?php
namespace app\common\controller;
use think\Controller;

class Adminbase extends Controller
{
    public function initialize()
    {
        parent::initialize();
        $modulename = $this->request->module();
        $controllername = strtolower($this->request->controller());
        $actionname = strtolower($this->request->action());
        $this->assign('controllername',$controllername);
    }
}