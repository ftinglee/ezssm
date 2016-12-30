/**
 * Created by leezhao on 16/12/26.
 */

$(function () {
    formValidate();
});

function formValidate() {
    $('.form-horizontal').validate({
        errorElement : 'span',
        errorClass : 'help-block',
        focusInvalid : false,
        rules : {
            username : {
                required : true,
                minlength:5,
                maxlength:20,
                remote:{
                    type: "post",
                    url: context+'/user/check',
                    data: {
                        username: function() {
                            return $("input[name='username']").val();
                        }
                    },
                    dataType: "json"
                }
            },
            name : {
                required : true
            },
            password : {
                required : true,
                minlength:6
            },
            password_confirm: {
                required: true,
                minlength: 6,
                equalTo: "input[name='password']"
            },
            email : {
                required : true,
                email:true
            },
            userRole: {
                required: true
            }
        },
        messages : {
            username : {
                required : "用户名不能为空",
                minlength: "字母不能少于 5 个且不能大于 20 个",
                maxlength: "字母不能少于 5 个且不能大于 20 个",
                remote: "用户名已占用"
            },
            name : {
                required : "名称不能为空"
            },
            password : {
                required : "密码不能为空",
                minlength: "密码长度最少 6 位"
            },
            password_confirm: {
                required: "请再次输入密码",
                minlength: "密码长度最少 6 位",
                equalTo: "密码不一致"
            },
            email:{
                required:"E-mail不能为空",
                email:"E-mail地址不正确"
            },
            userRole:{
                required:"至少指定一个角色"
            }
        },
        highlight : function(element) {
            $(element).closest('.form-group').addClass('has-error');
        },
        success : function(label) {
            label.closest('.form-group').removeClass('has-error');
            label.remove();
        },
        errorPlacement : function(error, element) {
            if ( element.is(':checkbox')) { //如果是checkbox
                error.appendTo(element.parent().parent().parent());
            } else {
                error.appendTo(element.parent());
            }
        },
        submitHandler : function(form) {
            formSubmit();
        }
    });
}

function formSubmit(){
    var roles = [];
    $('input[name="userRole"]:checked').each(function(){
        roles.push($(this).val());
    });
    $.ajax({
        type: 'POST', data: $('.form-horizontal').serialize()+"&roleIds="+roles.join(","), url: context+'/user/add', dataType: "json",
        success: function (data) {
            if(data == '1' || data == 1){
                window.location.href = context + "/user";
            }
        }
    });
}