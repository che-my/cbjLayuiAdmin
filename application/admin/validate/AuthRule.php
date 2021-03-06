<?php

namespace app\admin\validate;

use think\Validate;

class AuthRule extends Validate
{

    /**
     * 正则
     */
    protected $regex = ['format' => '[a-z0-9_\/]+'];

    /**
     * 验证规则
     */
    protected $rule = [
        'name'  => 'require|format|unique:AuthRule',
        'title' => 'require',
    ];

    /**
     * 提示消息
     */
    protected $message = [
        'name.require' => 'URL规则不能为空',
        'name.format' => 'URL规则只能是小写字母、数字、下划线和/组成'
    ];

    /**
     * 字段描述
     */
    protected $field = [
    ];

    /**
     * 验证场景
     */
    protected $scene = [
        'add'  =>  ['name','title'],
    ];

    public function __construct(array $rules = [], $message = [], $field = [])
    {
        $this->field = [
            'name'  => '规则',
            'title' => '规则名称',
        ];
        $this->message['name.format'] = 'URL规则只能是小写字母、数字、下划线和/组成';
        parent::__construct($rules, $message, $field);
    }

}
