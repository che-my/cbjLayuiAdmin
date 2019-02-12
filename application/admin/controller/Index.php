<?php
namespace app\admin\controller;
use app\common\controller\Adminbase;
use think\facade\Config;
use think\facade\Hook;
use think\Validate;

class Index extends Adminbase
{
    public function index()
    {
        //左侧菜单
        list($menulist, $navlist, $fixedmenu, $referermenu) = $this->auth->getSidebar([
            'dashboard' => 'hot',
            'addon'     => ['new', 'red', 'badge'],
            'auth/rule' => __('Menu'),
            'general'   => ['new', 'purple'],
        ], $this->view->site['fixedpage']);
        $this->view->assign('menulist', $menulist);
        return $this->view->fetch();
    }

    public function home()
    {
        return $this->view->fetch();
    }
}