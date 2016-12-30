/**
 * Created by leezhao on 16/12/26.
 */
var $validator,$secValidator;

$(function () {
    formValidate();
    initCropper();

    $('.prof-tool.state-edit').on("click",function(){
        if($(this).parent().parent().hasClass('security')){
            changeState(1,document.forms[1]);
        }else{
            resetFormContent();
            changeState(1,document.forms[0]);
        }
    });

    $('.prof-tool.state-editing').on("click",function(event){

        if($(this).parent().parent().hasClass('security')){
            if($(this).hasClass("save")){
                $('.form-horizontal.security').triggerHandler( "submit.validate",event);
            }else{
                changeState(0,document.forms[1]);
            }
        }else{
            if($(this).hasClass("save")){
                $('.form-horizontal.basic').triggerHandler( "submit.validate",event);
            }else{
                changeState(0,document.forms[0]);
            }
        }

    });
});

function formValidate() {
    $validator = $('.form-horizontal.basic').validate({
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
            }
        },
        messages : {
            name : {
                required : "名称不能为空"
            },
            email:{
                required:"E-mail不能为空",
                email:"E-mail地址不正确"
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
            formSubmit(0);
        }
    });

    $secValidator = $('.form-horizontal.security').validate({
        errorElement : 'span',
        errorClass : 'help-block',
        focusInvalid : false,
        rules : {
            old_pass : {
                required : true,
            },
            new_pass: {
                required: true,
                minlength: 6
            },
            en_pass: {
                required: true,
                minlength: 6,
                equalTo: "input[name='new_pass']"
            }
        },
        messages : {
            old_pass : {
                required : "密码不能为空"
            },
            new_pass : {
                required : "密码不能为空",
                minlength: "密码长度最少 6 位"
            },
            en_pass: {
                required: "请再次输入密码",
                minlength: "密码长度最少 6 位",
                equalTo: "密码不一致"
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
            formSubmit(1);
        }
    });

}

function formSubmit(type){
    var data,url;
    if(type){
        data = $('.form-horizontal.security').serialize();
        url = context+'/user/password';
    }else{
        data = $('.form-horizontal.basic').serialize();
        url = context+'/user/update'
    }
    $.ajax({
        type: 'POST', data: data, url: url, dataType: "json",
        success: function (data) {
            if(data.state == 1){
                window.location.href = context + "/profile";
            }else{
                alert(data.msg);
            }
        }
    });
}

function initCropper(){
    var $image = $('#image');
    var cropBoxData;
    var canvasData;

    $('#modal').on('shown.bs.modal', function () {
        $image.cropper({
            autoCropArea: 0.5,
            built: function () {
                $image.cropper('setCanvasData', canvasData);
                $image.cropper('setCropBoxData', cropBoxData);
            }
        });
    }).on('hidden.bs.modal', function () {
        cropBoxData = $image.cropper('getCropBoxData');
        canvasData = $image.cropper('getCanvasData');
        $image.cropper('destroy');
    });
}

function resetFormContent(){
    $("input[type=text],textarea",document.forms[0]).each(function(){
        $(this).val($(this).next().text());
    });
}

function changeState(state,form){
    if(state){ //editing
        $('.state-edit',form).addClass("hidden");
        $('.state-editing',form).removeClass("hidden");
    }else{ //normal
        $validator.hideThese($validator.errors());
        $('.form-group',form).removeClass('has-error');
        $('.state-edit',form).removeClass("hidden");
        $('.state-editing',form).addClass("hidden");
    }
}