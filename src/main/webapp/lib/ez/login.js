/**
 * Created by leezhao on 16/12/26.
 */

$(function () {
    formValidate();
});

function formValidate() {
    $('.login-form').validate({
        errorElement : 'span',
        errorClass : 'help-block',
        focusInvalid : false,
        rules : {
            username : {
                required : true
            },
            password : {
                required : true
            }
        },
        messages : {
            username : {
                required : "用户名不能为空"
            },
            password : {
                required : "密码不能为空"
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
            error.appendTo(element.parent());
        },
        submitHandler : function(form) {
            formSubmit();
        }
    });
    $('.login-form input').keypress(function(e) {
        if (e.which == 13) {
            $('.login-form').triggerHandler( "submit.validate",e);
            return false;
        }
    });
}

function formSubmit(){
    $.ajax({
        type: 'POST', data: $('.login-form').serialize(), url: context+'/login', dataType: "json",
        success: function (data) {
            if(data.state == 1){
                window.location.href = context + "/home";
            }else{
                addError(data.msg);
            }
        }
    });
}

function addError(msg){
    var $alert = [
        '<div class="alert alert-danger avatar-alert alert-dismissable">',
        '<button type="button" class="close" data-dismiss="alert">&times;</button>',
        msg,
        '</div>'
    ].join('');

    $('.login-form .form-title').after($alert);
}