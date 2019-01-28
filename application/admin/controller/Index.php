<?php
namespace app\admin\controller;
use think\Controller;

class Index extends Controller
{
    public function index()
    {
        return $this->view->fetch();
    }

    public function home()
    {
        return $this->view->fetch();
    }
}