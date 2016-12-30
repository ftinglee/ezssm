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
                required : true,
                maxlength:20,
                remote:{
                    type: "post",
                    url: context+'/role/check',
                    data: {
                        name: function() {
                            return $("input[name='name']").val();
                        }
                    },
                    dataType: "json"
                }
            }
        },
        messages : {
            name : {
                required : "用户名不能为空",
                maxlength: "字母不能大于 20 个",
                remote: "用户名已占用"
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
    $.ajax({
        type: 'POST', data: $('.form-horizontal').serialize(), url: context+'/role/add', dataType: "json",
        success: function (data) {
            if(data == '1' || data == 1){
                window.location.href = context + "/role";
            }
        }
    });
}