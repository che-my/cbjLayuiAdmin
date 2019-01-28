layui.use(['table','form'], function() {
    var table = layui.table,form = layui.form,$ = layui.$;
    var ConfigUrl = {
        'index_url':'index',    //列表
        'add_url':'add',        //添加
        'edit_url':'edit',      //编辑
        'del_url':'del',        //删除
        'multidel_url':'multidel',//批量删除
    };
    var tableIns = table.render({
        elem: '#table',
        toolbar: '#toolbarDemo',
        url: ConfigUrl.index_url,
        page: true,
        cols: [
            [
                { type: 'checkbox', fixed: 'left' },
                { field: 'id', width: 80, title: 'ID'},
                { field: 'username', title: '账号'},
                { field: 'nickname', title: '昵称' },
                { field: 'email', title: '邮箱' },
                { field: 'createtime',title: '创建时间' },
                { field: 'updatetime',title: '更新时间'},
                { field: 'status', title: '状态', templet: '<div>{{#  if(d.status){ }} 正常 {{#  } else { }} <font color="#FF0000">隐藏</font> {{#  } }} </div>' },
                { fixed: 'right', width: 120, title: '操作', toolbar: '#barTool' }
            ]
        ],
    });

    //搜索查询
    form.on('submit(formDemo)', function(data){
        tableIns.reload({
            page:{
                curr:1
            },
            where: data.field
        })
        return false;
    });

     //监听头部工具事件
    table.on('toolbar(table)', function(obj) {
        if (obj.event === 'delAll'){
            var checkStatus = table.checkStatus('table'),
                data = checkStatus.data,
                ids = []; 
            if (data.length > 0) {
                for (let i in data) {
                    ids.push(data[i].userid);
                }
                layer.confirm('确定删除选中的数据？', { icon: 3, title: '提示信息' }, function(index) {
                    $.post(ConfigUrl.mutldel_url, { 'ids': ids }, function(data) {
                        if (data.code == 1) {
                            if (data.url) {
                                layer.msg(data.msg + ' 页面即将自动跳转~');
                            } else {
                                layer.msg(data.msg);
                            }
                            setTimeout(function() {
                                if (data.url) {
                                    location.href = data.url;
                                } else {
                                    location.reload();
                                }
                            }, 1500);
                        } else {
                            layer.msg(data.msg);
                            setTimeout(function() {
                                if (data.url) {
                                    location.href = data.url;
                                }
                            }, 1500);
                        }
                    });
                    layer.close(index);
                })
            }
        }else if(obj.event ===  'search'){
            var that = $('.layui-card-header');
            if(that.hasClass('layui-hide')){
                that.removeClass('layui-hide');
            }else{
                that.addClass('layui-hide');
            }   
        }else if(obj.event ===  'refresh'){
            table.reload('table');
        }
    });

    //监听行工具事件
    table.on('tool(table)', function(obj) {
        var data = obj.data;
        if (obj.event === 'del') {
            layer.confirm('确定删除这条数据？', { icon: 3, title: '提示' }, function(index) {
                layer.close(index);
                $.post(ConfigUrl.del_url, { 'id': data.userid }, function(data) {
                    if (data.code == 1) {
                        if (data.url) {
                            layer.msg(data.msg + ' 页面即将自动跳转~');
                        } else {
                            layer.msg(data.msg);
                        }
                        setTimeout(function() {
                            if (data.url) {
                                location.href = data.url;
                            } else {
                                location.reload();
                            }
                        }, 1500);
                    } else {
                        layer.msg(data.msg);
                        setTimeout(function() {
                            if (data.url) {
                                location.href = data.url;
                            }
                        }, 1500);
                    }

                });
            });
        }else if (obj.event === 'edit') {
            window.open(ConfigUrl.edit_url + "?id=" + data.id, '_self')
        }else if (obj.event ===  'refresh'){
            table.reload('table');
        }
    });
});