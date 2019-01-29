layui.config({
    base: '/static/assets/'
}).extend({
    treetable: 'treetable-lay/treetable'
}).use(['table','form','jquery','treetable'], function() {

    var table = layui.table,treetable = layui.treetable,
    $ = layui.jquery,form = layui.form;

    //路由配置
    var ConfigUrl = {
        'index_url':'index',        //列表
        'add_url':'add',            //添加
        'edit_url':'edit',          //编辑
        'del_url':'del',           //删除
        'multidel_url':'multidel',  //批量删除
        'weigh_url':'weigh',        //排序
    };

    //获取页面行为
    var data_action = $(".layui-card-body").attr('data-action');
    if(data_action==ConfigUrl.index_url){
        //列表表格数据
        var renderTable = function () {
            layer.load(2);
            treetable.render({
                treeColIndex: 1,
                treeSpid: -1,
                treeIdName: 'id',
                treePidName: 'pid',
                treeDefaultClose: true,
                treeLinkage: false,
                elem: '#table',
                url: ConfigUrl.index_url,
                toolbar:'#toolbarDemo',
                page: false,
                cols: [[
                    {type: 'numbers',title: '序号'},
                    {field: 'title', minWidth: 200, title: '规则名称'},
                    {field: 'name', title: '规则'},
                    {field: 'icon', title: '图标',templet: '<div><i class="{{d.icon}}"></i></div>' },
                    {field: 'ismenu', title: '是否菜单', templet: '<div>{{#  if(d.ismenu){ }} <font color="#00FF00">是</font> {{#  } else { }} <font color="#FF0000">否</font> {{#  } }} </div>' },
                    {field: 'status', title: '状态', templet: '<div>{{#  if(d.status){ }} 显示 {{#  } else { }} <font color="#FF0000">隐藏</font> {{#  } }} </div>' },
                    {field: 'weigh', title: '排序', edit: 'text' },
                    {width: 160, title: '操作', toolbar: '#barTool' }
                ]],
                done:function(){
                    layer.closeAll();
                }
            });
        };
        renderTable();
        
        //刷新
        $('#Table-Refresh').on('click', function() {
            renderTable();
        });
    
        //展开折叠
        document.menu_change = function menu_change(e) {
            if($(e).text()=='全部展开'){
                treetable.expandAll('#table'); 
                $(e).text('全部折叠');
            }else{
                treetable.foldAll('#table');
                $(e).text('全部展开');
            }   
        };
    
        //搜索
        document.search = function () {
            var keyword = $('#edt-search').val();
            var searchCount = 0;
            $('#table').next('.treeTable').find('.layui-table-body tbody tr td').each(function () {
                $(this).css('background-color', 'transparent');
                var text = $(this).text();
                if (keyword != '' && text.indexOf(keyword) >= 0) {
                    $(this).css('background-color', 'rgba(250,230,160,0.5)');
                    if (searchCount == 0) {
                        treetable.expandAll('#table');
                        $('html,body').stop(true);
                        $('html,body').animate({scrollTop: $(this).offset().top - 150}, 500);
                    }
                    searchCount++;
                }
            });
            if (keyword == '') {
                layer.msg("请输入搜索内容", {icon: 5});
            } else if (searchCount == 0) {
                layer.msg("没有匹配结果", {icon: 5});
            }
        };
    
        //监听单元格编辑
        table.on('edit(table)', function(obj) {
            var value = obj.value,data = obj.data;
            $.post(ConfigUrl.weigh_url, { 'id': data.id,'value':value }, function(data) {
                if (data.code == 1) {
                    layer.msg(data.msg,{'time':'1500'});
                }else{
                    layer.msg(data.msg,{'time':'1500'});
                }
                setTimeout(function() {
                    renderTable();
                }, 1500);
            })
        });
    
        //监听行工具事件
        table.on('tool(table)', function(obj) {
            var data = obj.data;
            //console.log(obj);
            if (obj.event === 'del') {
                layer.confirm('确定删除这条数据？', { icon: 3, title: '提示' }, function(index) {
                    layer.close(index);
                    $.post(ConfigUrl.del_url, { 'id': data.id }, function(data) {
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
            } else if (obj.event === 'add') {
                window.open(ConfigUrl.add_url + "?parentid=" + data.id, '_self')
    
            } else if (obj.event === 'edit') {
                window.open(ConfigUrl.edit_url + "?id=" + data.id, '_self')
            }
        });
    }
    //  else if(data_action==ConfigUrl.add_url){
    //     //添加数据
    //     form.on('submit(rule_add)', function(data){
    //         layer.msg(JSON.stringify(data.field));
    //         return false;
    //     });
    // } else if(data_action==ConfigUrl.edit_url){
    //     //添加数据
    //     form.on('submit(rule_edit)', function(data){
    //         layer.msg(JSON.stringify(data.field));
            
    //         return false;
    //     });
    // }
    if(data_action==ConfigUrl.add_url||data_action==ConfigUrl.edit_url){
        $("#icons2").on('click',function(){
            console.log($("#icons2"));
            $(".selector-popup").slideToggle();
            var data = $(this).attr("data");
            $('.cover').show()
            if(data=='1'){
                $(this).html("<i class='fip-icon-up-dir'></i>");
                $(this).attr("data",'0');
                
            }else{
                $(this).html("<i class='fip-icon-down-dir'></i>");
                $(this).attr("data",'1');
            }     
        });
        $('.cover').on('click',function(){
            $(this).hide();
            $(".selector-popup").slideUp();
            $("#icons2").html("<i class='fip-icon-down-dir'></i>");
            $("#icons2").attr("data",'1');
        })
        window.funclick = function (obj){
            $("#icons2").html("<i class='fip-icon-down-dir'></i>");
            $("#icons1").html($(obj).html());
            var value = $(obj).children().attr("class");
            $("#icon").val(value);
            $(".cover").hide();
            $(".selector-popup").slideUp();
            $("#icons2").attr("data",'1');
        }
    }
    
});
