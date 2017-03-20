<section data-section="1">
  <nav>
    <h2>Перевірка полів під час заповнення форми</h2>
    <ul>
      <li class="active">Api</li>
      <li>Tpl</li>
      <li>Less</li>
      <li>Js</li>
      <li>Example</li>
    </ul>
  </nav>

  <code data-type="api" class="active">
    <!--Підключаєм бібліотеку через bower jquery-validation-->
    <!--API: https://jqueryvalidation.org/documentation/-->
    <!---->
    <!--required — поле обязательное для заполнения (true или false)-->
    <!--remote — указывается файл для проверки поля (например: check.php)-->
    <!--email — проверяет корректность e-mail адреса (true или false)-->
    <!--url — проверяет корректность url адреса (true или false)-->
    <!--date — проверка корректности даты (true или false)-->
    <!--dateISO — проверка корректности даты ISO (true или false)-->
    <!--number — проверка на число (true или false)-->
    <!--digits — только цифры (true или false)-->
    <!--creditcard — корректность номера кредитной карты (true или false)-->
    <!--equalTo — равное чему-то (например другому полю equalTo:»#pswd»)-->
    <!--accept — проверка на правильное расширение (accept: «xls|csv»)-->
    <!--maxlength — максимальное кол-во символов (число)-->
    <!--minlength — минимальное кол-во символов (число)-->
    <!--rangelength — кол-во символов от скольки и до скольки (rangelength: [2, 6])-->
    <!--range — число должно быть в диапазоне от и до (range: [13, 23])-->
    <!--max — максимальное значение числа (22)-->
    <!--min — минимальное значение числа (11)-->
  </code>

  <code data-type="tpl"><?=hc('
    <script src="/vendor/public/jquery-validation/dist/jquery.validate.min.js" defer></script>
    
    <form action="#" method="#" class="form" id="js-register-form">
      <div class="message js-form-message"></div>
      <input type="text"     placeholder="Ваше имя"      name="form_name"  class="form-input">
      <input type="email"    placeholder="Ваш e-mail"    name="form_email" class="form-input">
      <input type="tel"      placeholder="Ваш телефон"   name="form_tel"   class="form-input">
      <input type="password" placeholder="Пароль"        name="form_pswd1" class="form-input" id="form_pswd1">
      <input type="password" placeholder="Повторите ..." name="form_pswd2" class="form-input">
      
      <textarea name="comments" placeholder="Текст сообщения" class="form-textarea"></textarea>
      <button type="submit" class="form-btn">Отправить</button>
    </form>')?>
  </code>

  <code data-type="less"><?=hc('
    .error { color: red; }')?>
  </code>

  <code data-type="js"><?=hc('
    $.validator.addMethod("notnumbers", function(value, element) { // Добавлення власного поля
        return !/[0-9]*/.test(value);
    }, "Please don\'t insert numbers.");
    
    $("#js-register-form").validate({
        rules: {
          form_name: {
            notnumbers: true
          },
          form_email: {
            required: true,
            email: true
          },
          form_tel: {
            required: true,
            digits: true
          },
          form_pswd1: {
            required: true,
            minlength: 6
          },
          form_pswd2: {
            required: true,
            minlength: 6,
            equalTo: "#form_pswd1"
          }
        },
        messages: {
          form_name: {
            required: "Поле Имя обязательное для заполнения"
          },
          form_email: {
            required: "Поле E-mail обязательное для заполнения",
            email: "Введите пожалуйста корректный e-mail"
          }
        },
        focusCleanup: true,
        focusInvalid: false,
        invalidHandler: function(event, validator) {
          $(".js-form-message").text("Исправьте пожалуйста все ошибки.");
        },
        onkeyup: function(element) {
          $(".js-form-message").text("");
        },
        errorPlacement: function(error, element) {
          return true;
        },
        errorClass: "form-input_error",
        validClass: "form-input_success"
    });')?>
  </code>

  <!--<div data-type="example"></div>-->
</section>