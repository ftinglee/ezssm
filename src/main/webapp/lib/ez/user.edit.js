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
            name : {
                required : true
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
            name : {
                required : "名称不能为空"
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
        type: 'POST', data: $('.form-horizontal').serialize()+"&roleIds="+roles.join(","), url: context+'/user/update', dataType: "json",
        success: function (data) {
            if(data.state == 1){
                window.location.href = context + "/user";
            }else{
                alert(data.msg);
            }
        }
    });
}