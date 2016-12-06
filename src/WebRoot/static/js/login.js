var Login = function () {
  var handleLogin = function () {
    var unme = Cookies.get('username');
    if (unme) {
      $('.login-form input[name="username"]').val(unme);
      $('.login-form input[name="remember"]').parent().addClass('checked');
      $('.login-form input[name="remember"]').prop("checked", true);
    }
    $('.login-form').validate({
      errorElement: 'span', //default input error message container
      errorClass: 'help-block', // default input error message class
      focusInvalid: false, // do not focus the last invalid input
      rules: {
        username: {
          required: true
        },
        password: {
          required: true
        },
        remember: {
          required: false
        }
      },

      messages: {
        username: {
          required: "请输入用户名"
        },
        password: {
          required: "请输入密码"
        }
      },

      invalidHandler: function (event, validator) { //display error alert on form submit
        $('.alert-danger', $('.login-form')).show();
      },

      highlight: function (element) { // hightlight error inputs
        $(element)
          .closest('.form-group').addClass('has-error'); // set error class to the control group
      },

      success: function (label) {
        label.closest('.form-group').removeClass('has-error');
        label.remove();
      },

      errorPlacement: function (error, element) {
        error.insertAfter(element.closest('.input-icon'));
      },

      submitHandler: function (form) {
        if ($('input[name="remember"]:checked').length > 0) {
          Cookies.set('username', $('.login-form input[name="username"]').val());
        } else {
          Cookies.remove('username');
        }
        form.submit(); // form validation success, call ajax form submit
      }
    });

    $('.login-form input').keypress(function (e) {
      if (e.which == 13) {
        if ($('.login-form').validate().form()) {
          $('.login-form').submit(); //form validation success, call ajax form submit
        }
        return false;
      }
    });
  };

  var handleForgetPassword = function () {
    $('.forget-form').validate({
      errorElement: 'span', //default input error message container
      errorClass: 'help-block', // default input error message class
      focusInvalid: false, // do not focus the last invalid input
      ignore: "",
      rules: {
        email: {
          required: true,
          email: true
        }
      },

      messages: {
        email: {
          required: "请输入电子邮件"
        }
      },

      invalidHandler: function (event, validator) { //display error alert on form submit

      },

      highlight: function (element) { // hightlight error inputs
        $(element)
          .closest('.form-group').addClass('has-error'); // set error class to the control group
      },

      success: function (label) {
        label.closest('.form-group').removeClass('has-error');
        label.remove();
      },

      errorPlacement: function (error, element) {
        error.insertAfter(element.closest('.input-icon'));
      },

      submitHandler: function (form) {
        form.submit();
      }
    });

    $('.forget-form input').keypress(function (e) {
      if (e.which == 13) {
        if ($('.forget-form').validate().form()) {
          $('.forget-form').submit();
        }
        return false;
      }
    });

    jQuery('#forget-password').click(function () {
      alert('请联系管理员');
      // jQuery('.login-form').hide();
      // jQuery('.forget-form').show();
    });

    jQuery('#back-btn').click(function () {
      jQuery('.login-form').show();
      jQuery('.forget-form').hide();
    });

  };

  return {
    init: function () {
      handleLogin();
      handleForgetPassword();
    }
  };
}();
jQuery(document).ready(function () {
  Login.init();
  particlesJS.load('particles', _PATH + '/static/particles.json');
  $('input[name="username"]:first').focus();
});