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
                maxlength:20
            }
        },
        messages : {
            name : {
                required : "名称不能为空",
                maxlength: "字母不能不能大于 20 个"
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
        type: 'POST', data: $('.form-horizontal').serialize(), url: context+'/role/update', dataType: "json",
        success: function (data) {
            if(data == '1' || data == 1){
                window.location.href = context + "/role";
            }else{
                alert("修改失败");
            }
        }
    });
}