<?php
namespace app\common\controller;
use app\admin\library\Auth;
use think\Controller;
use think\facade\Config;
use think\facade\Hook;
use think\facade\Session;

class Adminbase extends Controller
{
    /**
     * 无需登录的方法,同时也就不需要鉴权了
     * @var array
     */
    protected $noNeedLogin = [];

    /**
     * 无需鉴权的方法,但需要登录
     * @var array
     */
    protected $noNeedRight = [];

    /**
     * 布局模板
     * @var string
     */
    protected $layout = 'default';

    public function initialize()
    {
        parent::initialize();
        $modulename = $this->request->module();
        $controllername = strtolower($this->request->controller());
        $actionname = strtolower($this->request->action());
        $path = str_replace('.', '/', $controllername) . '/' . $actionname;

        // 定义是否Addtabs请求
        !defined('IS_ADDTABS') && define('IS_ADDTABS', input("addtabs") ? TRUE : FALSE);

        // 定义是否Dialog请求
        !defined('IS_DIALOG') && define('IS_DIALOG', input("dialog") ? TRUE : FALSE);

        // 定义是否AJAX请求
        !defined('IS_AJAX') && define('IS_AJAX', $this->request->isAjax());

        $this->auth = Auth::instance();

        // 设置当前请求的URI
        $this->auth->setRequestUri($path);
        // 检测是否需要验证登录
        // if (!$this->auth->match($this->noNeedLogin)) {
        //     //检测是否登录
        //     if (!$this->auth->isLogin()) {
        //         Hook::listen('admin_nologin', $this);
        //         $url = Session::get('referer');
        //         $url = $url ? $url : $this->request->url();
        //         $this->error(__('Please login first'), url('index/login', ['url' => $url]));
        //     }
        //     // 判断是否需要验证权限
        //     if (!$this->auth->match($this->noNeedRight)) {
        //         // 判断控制器和方法判断是否有对应权限
        //         if (!$this->auth->check($path)) {
        //             Hook::listen('admin_nopermission', $this);
        //             $this->error(__('You have no permission'), '');
        //         }
        //     }
        // }
        // 语言检测
        $lang = strip_tags($this->request->langset());

        $site = Config::get("site");
        //渲染权限对象
        $this->assign('auth', $this->auth);
        $this->assign('controllername',str_replace('.', '/', $controllername));
        //渲染站点配置
        $this->assign('site', $site);
    }
}