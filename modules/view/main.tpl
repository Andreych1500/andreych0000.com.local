<section data-section="1">
  <nav>
    <h2>Перевірка полів під час заповнення форми</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Less</li>
      <li>Js</li>
    </ul>
    <div class="num-section">1</div>
  </nav>

  <code data-type="api" class="hljs less"><?=hc('
    API      |   https://jqueryvalidation.org/documentation/
    Install  |   - через bower, за пошуком: jquery-validation
    
    Params {
    
        required      |   (true/false)            |   Обов\'язкове поле  
        remote        |   (example: check.php)    |   Вказується файл для перевірки поля
        email         |   (true/false)            |   Коректність e-mail
        url           |   (true/false)            |   Коректність url
        date          |   (true/false)            |   Коректність date 
        dateISO       |   (true/false)            |   Коректність date ISO  
        number        |   (true/false)            |   Коректність number     
        digits        |   (true/false)            |   Тільки вводити числа        
        creditcard    |   (true/false)            |   Коректність номера кредитної карти 
        equalTo       |   (example: "#pswd")      |   Порівняння полів через id/class                     
        accept        |   (accept: "xls|csv")     |   Перевірка на правильне розширення  
        maxlength     |   (число)                 |   Максимальна к-ть символів
        minlength     |   (число)                 |   Мінімальна к-ть символів           
        rangelength   |   (rangelength: [2, 6])   |   К-ть символів від і до
        range         |   (range: [13, 23])       |   Число в діапазоні від і до
        max           |   (22)                    |   Максимальне значення числа     
        min           |   (11)                    |   Мінімальне значення числа
        
    }', 1)?>
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
    </form>', 1)?>
  </code>

  <code data-type="less" class=""><?=hc('
    .error { 
      color: red; 
    }', 1)?>
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
    });', 1)?>
  </code>
</section>

<section data-section="2">
  <nav>
    <h2>Добавлення джерела при копіюванні тексту в буфер</h2>
    <ul>
      <li>Js</li>
    </ul>
    <div class="num-section">2</div>
  </nav>

  <code data-type="js"><?=hc('
    function copyTextLink(event) {
      event.preventDefault();
      
      var copyText = window.getSelection();
      var newText = copyText + \'\n\nИсточник: \' + document.location.href + \'\n© Все права защищени.\';
      
      (event.clipboardData || window.clipboardData).setData(\'Text\', newText);
    }
    
    document.addEventListener(\'copy\', copyTextLink);
    ', 1)?>
  </code>
</section>

<section data-section="3">
  <nav>
    <h2>Кнопка поділитися - "соціальні мережі"</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Less</li>
      <li>JS</li>
    </ul>
    <div class="num-section">3</div>
  </nav>

  <code data-type="api" class="hljs less"><?=hc('
    API   |   https://habrahabr.ru/post/302656/
    ', 1)?>
  </code>

  <code data-type="tpl"><?=hc('
    <div class="soc-link">
      <div class="soc_icon js_facebook">facebook</div>
      <div class="soc_icon js_google">js_google</div>
      <div class="soc_icon js_twitter">js_twitter</div>
      <div class="soc_icon js_vk">js_vk</div>
      <div class="soc_icon js_mail_ru">js_mail_ru</div>
      <div class="soc_icon js_od">js_od</div>
    </div>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    .soc-link {
      height: 40px;
      width: 100%;
      margin-top: 30px;
      clear: both;
    }
    
    .soc_icon {
      background: rebeccapurple;
      height: 20px;
      display: inline-block;
    }', 1)?>
  </code>

  <code data-type="js"><?=hc('
    var url,
        Share = {
          vkontakte: function (purl, ptitle, pimg, text) {
            url = "https://vkontakte.ru/share.php?";
            url += "url=" + encodeURIComponent(purl);
            url += "&title=" + encodeURIComponent(ptitle);
            url += "&description=" + encodeURIComponent(text);
            url += "&image=" + encodeURIComponent(pimg);
            url += "&noparse=true";
            Share.popup(url);
          },
          facebook: function (purl, pimg) {
            url = "https://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(purl);
            url += "&picture=" + encodeURIComponent(pimg);
            Share.popup(url);
          },
          twitter: function (purl, ptitle) {
            url = "https://twitter.com/share?";
            url += "url=" + encodeURIComponent(purl);
            url += "&text=" + encodeURIComponent(ptitle);
            url += "&via=" + encodeURIComponent("https://twitter.com/video");
            Share.popup(url);
          },
          od: function (purl) {
            url = "https://connect.ok.ru/offer?url=" + encodeURIComponent(purl);
            Share.popup(url);
          },
          mailru: function (purl, ptitle, pimg, text) {
            url = "https://connect.mail.ru/share?";
            url += "url=" + encodeURIComponent(purl);
            url += "&title=" + encodeURIComponent(ptitle);
            url += "&description=" + encodeURIComponent(text);
            url += "&imageurl=" + encodeURIComponent(pimg);
            Share.popup(url)
          },
          plusone: function (purl) {
            url = "https://plus.google.com/share?url=" + encodeURIComponent(purl);
            Share.popup(url)
          },
          popup: function (url) {
            window.open(url, "", "toolbar=0,status=0,width=626,height=436");
          }
        };
        
    EnableShareIcons(Share);
    
    function EnableShareIcons(Share) {
      $(".soc_icon").click(function () {
    
        var title = document.title;
        var desc = $("meta[name="description"]")[0].content;
        var url = window.location.href;
        var img = window.location.href + "skins/default/img/logo.png";
    
        var soc_pic = $("meta[property="og:image"]");
        if (soc_pic.length > 0) {
          img = soc_pic[0].content;
        }
    
        if ($(this).hasClass("js_vk")) {
          Share.vkontakte(url, title, img, desc);
        }
        if ($(this).hasClass("js_facebook")) {
          Share.facebook(url, img);
        }
        if ($(this).hasClass("js_twitter")) {
          Share.twitter(url, title);
        }
        if ($(this).hasClass("js_od")) {
          Share.od(url);
        }
        if ($(this).hasClass("js_mail_ru")) {
          Share.mailru(url, title, img, desc);
        }
        if ($(this).hasClass("js_google")) {
          Share.plusone(url);
        }
      });
    }', 1)?>
  </code>

  <code data-type="example">

  </code>
</section>