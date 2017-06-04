<section data-section="1">
  <nav>
    <h2>Перевірка полів під час заповнення форми</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Less</li>
      <li>Js</li>
      <li>Example</li>
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
    
    <form action="#" method="post" class="form" id="js-register-form">
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

  <code data-type="example">
    <img src="/skins/img/section/section-1.jpg" alt="section-1">
  </code>
</section>

<section data-section="2">
  <nav>
    <h2>Добавлення джерела при копіюванні тексту в буфер</h2>
    <ul>
      <li>Js</li>
      <li>Example</li>
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

  <code data-type="example">
    <img src="/skins/img/section/section-2.jpg" alt="section-2">
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
      <li>Example</li>
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
    <img src="/skins/img/section/section-3.jpg" alt="section-3">
  </code>
</section>

<section data-section="4">
  <nav>
    <h2>Кнопка у Верх</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>JS</li>
      <li>Example</li>
    </ul>
    <div class="num-section">4</div>
  </nav>

  <code data-type="tpl"><?=hc('
    <div id="scroll-top">
      <span>›</span>
    </div>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    #scroll-top {
      position: fixed;
      z-index: 1000;
      bottom: 25px;
      right: 25px;
      background-color: #333333;
      width: 38px;
      height: 38px;
      text-align: center;
      cursor: pointer;
      color: #ffffff;
      display: none;
      .opacity(0.9);
      .border-radius(8px);
    
      &:hover {
        color: #f27c66;
      }
    
      span {
        line-height: 30px;
        font-size: 44px;
        display: inline-block;
        left: 8px;
        top: 3px;
        position: absolute;
        .transform(rotate(-90deg));
        .transition(all 0.3s);
      }
    }', 1)?>
  </code>

  <code data-type="js"><?=hc('
    scroll_top(); // Виклик
    
    function scroll_top() {
        $("#scroll-top").on("click", function () {
            $("html, body").animate({scrollTop: 0});
            return false;
        });
      
        $(window).scroll(function () {
            if ($(window).scrollTop() > 400) {
                $("#scroll-top").fadeIn();
            } else {
                $("#scroll-top").fadeOut();
            }
        });
      
        $(window).scroll();
    }', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-4.jpg" alt="section-4">
  </code>
</section>

<section data-section="5">
  <nav>
    <h2>Перевірка на включення "Cookie" у користувача</h2>
    <ul>
      <li>JS</li>
      <li>Example</li>
    </ul>
    <div class="num-section">5</div>
  </nav>

  <code data-type="js"><?=hc('
    if (!navigator.cookieEnabled) {
        alert("You have disabled cookies. Several functions may not work intermittently or completely broken. Enable them to improve work!");
    }
    ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-5.jpg" alt="section-5">
  </code>
</section>

<section data-section="6">
  <nav>
    <h2>Перевірка на включення "JavaScript" у браузері</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">6</div>
  </nav>

  <code data-type="tpl"><?=hc('
    <!-- Вставляємо у body першим елементом -->
    
    <noscript>
      <div class="no-script">
        <b>JavaScript disabled</b>
        <hr>
        <p><i>JavaScript is disabled</i> on your browser. To use The Analytical Scientist please enable JavaScript or
          upgrade to a JavaScript capable browser. </p>
      </div>
    </noscript>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    .no-script {
      background: #f5fff6;
      color: #2f363e;
      text-align: center;
      font-size: 20px;
      width: 70%;
      padding: 10px 15%;
      margin: 20px 0;
      font-family: sans-serif;
      . box-shadow(0 0 10 px 0 gray);
      
      b {
        font-size: 26px;
        vertical-align: bottom;
        display: inline-block;
      }
      
      hr {
        background: #f00;
        height: 3px;
      }
      
      i {
        font-weight: 600;
        color: #ef4533;
      }
      
      p {
        margin-top: 15px;
      }
    }', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-6.jpg" alt="section-6">
  </code>
</section>

<section data-section="7">
  <nav>
    <h2>Відображення відео через бібліотеку "Video.js"</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Js</li>
      <li>Example</li>
    </ul>
    <div class="num-section">7</div>
  </nav>

  <code data-type="api" class="hljs less"><?=hc('
    API      |   http://docs.videojs.com/docs/guides/api.html
    Method   |   http://docs.videojs.com/docs/api/video.html
    Install  |   - через bower, за пошуком: video.js
    Version  |   v5.12.6 > і вище
    
    Template generator  |   http://www.scriptsmashup.com/Video_Skin_Generator/Videojs/videojs-skin-generator.html
    Nice documentation  |   https://docs.brightcove.com/en/perform/brightcove-player/guides/customize-appearance.html#componentselectors
    ', 1)?>
  </code>

  <code data-type="tpl"><?=hc('
    <script src="/vendor/public/video.js/dist/video.min.js" defer></script>
    
    <video id="cool-video1" class="video-js vjs-default-skin">
      <source type="video/flash" src="/uploaded/videos/test.flv">
      <source type="video/mp4" src="/uploaded/videos/test.mp4">
      <source type="video/webm" src="/uploaded/videos/test.webm">
      <source type="video/ogg" src="/uploaded/videos/test.ogv">
    </video>
    ', 1)?>
  </code>

  <code data-type="js"><?=hc('
    videojs("cool-video1", {
        controls: true,
        autoplay: false,
        preload: "auto",
        poster: "/skins/default/img/video-dp.png",
        controlBar: {
            volumeMenuButton: {
                inline: false,
                vertical: true
            },
            liveDisplay: true,
            muteToggle: false
        }
    }, function () {
        this.play(); // Запустити відразу
        this.on("play", function(e) {}); // Кожну подію можна відстежити та виконати певні дії
    });
    ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-7.jpg" alt="section-7">
  </code>
</section>

<section data-section="8">
  <nav>
    <h2>Галерея "Magnific Popup" - відкриває УСЕ через модальне вікно</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">8</div>
  </nav>

  <code data-type="api" class="hljs less"><?=hc('
    API      |   http://dimsemenov.com/plugins/magnific-popup/documentation.html#including-files
    Example  |   http://dimsemenov.com/plugins/magnific-popup/
    ', 1)?>
  </code>

  <code data-type="tpl"><?=hc('
    <script src="/vendor/public/magnific-popup/dist/jquery.magnific-popup.min.js" defer></script>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    // Переносимо всі стилі з їхнього коду у наш (там небагато коду).
    ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-8.jpg" alt="section-8">
  </code>
</section>

<section data-section="9">
  <nav>
    <h2>Технологія "LocalStore"</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Js</li>
    </ul>
    <div class="num-section">9</div>
  </nav>

  <code data-type="api" class="hljs less pre-wrap"><?=hc('
    LocalStorage - технологія відноситься до JavaScript. Суть її полягає в тому, що в нього можна записувати дані, які будуть зберігатися в браузері. Дані не зникнуть навіть якщо закрити браузер і відкрити його знов або піти зі сторінки і потім повернетеся на неї знов. Виходить, що можна зберігати дані форми в сховище, а при завантаженні сторінки перевіряти на наявність даних, і якщо вони є, то підставляти їх у форму.
    
    // Задати/отримати/видалити значення через name/value   |   // Альтернативний синтаксис
    localStorage.setItem("lastname", object);               |   localStorage.lastname = object;
    localStorage.getItem("lastname");                       |   localStorage.lastname;
    localStorage.removeItem("lastname");
    ', 1)?>
  </code>

  <code data-type="tpl"><?=hc('
    <form action="/" method="post">
      <textarea name="note"> <!-- Текст який попаде у сховище --> </textarea>
      <div class="submit"> 
        <input type="submit" value="Зберегти"> 
      </div>
    </form>
    ', 1)?>
  </code>

  <code data-type="js"><?=hc('
    if (window.localStorage) {
        var elements = document.querySelectorAll("[name]");
        
        for (var i = 0, length = elements.length; i < length; i++) {
            (function(element) {
                var name = element.getAttribute("name");
                
                element.value = localStorage.getItem(name) || "";
                element.onkeyup = function() {
                    localStorage.setItem(name, element.value);
                };
            })(elements[i]);
        }
    }
    
    var object = { value: "Smith", timestamp: new Date().getTime() };
    object = JSON.stringify(object);
    
    // Приклад з встановленням значення
    function setLocalStorageNav(k, item) {
        var value  = localStorage.getItem(\'navigation\'),
        object = (value? JSON.parse(value) : {
            value      : {},
            timestamp  : new Date().getTime(),
            setTimeSec : 30 * 60 * 1000
        });
        
        object.value[k] = item;
        object          = JSON.stringify(object);
        localStorage.setItem("navigation", object);
    }
    
    // А тепер видаляємо застарілі записи
    function removeLocalStorage() {
        var obj = localStorage,
        storage;
        
        for (var prop in obj) {
            if (!obj.hasOwnProperty(prop)) {
                continue;
            }
          
            storage = JSON.parse(obj[prop]);
          
            if (new Date().getTime() > (storage.timestamp + storage.setTimeSec)) {
                localStorage.removeItem(prop);
            }
        }
    }
    ', 1)?>
  </code>
</section>

<section data-section="10">
  <nav>
    <h2>Слайдер</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Less</li>
      <li>Js</li>
      <li>Example</li>
    </ul>
    <div class="num-section">10</div>
  </nav>

  <code data-type="api" class="hljs less pre-wrap"><?=hc('
    API       |   https://github.com/woocommerce/FlexSlider/wiki/FlexSlider-Properties
    Install   |   - через bower, за пошуком: flexslider/jquery.flexslider.js
    ', 1)?>
  </code>

  <code data-type="tpl"><?=hc('
    <div class="main-banner">
      <div class="flex-itemList">
        <img src="/img1.jpg" title="img1" alt="img1">
        <img src="/img2.jpg" title="img1" alt="img2">
        <img src="/img3.jpg" title="img1" alt="img3">
      </div>
      <div class="flex-rows-list">
        <span></span>
        <span></span>
        <span></span>
      </div>
      <div class="flex-prev"></div>
      <div class="flex-next"></div>
    </div>', 1)?>
  </code>

  <code data-type="less"><?=hc('
    .main-banner {
      position: relative;
      zoom: 1;
      padding: 0 35px;
      margin: 30px auto 0;
      height: auto;
      max-height: 480px;
      max-width: 700px; // Максимальна ширина зображення
      
      .flex-next, .flex-prev {
        z-index: 100;
        position: absolute;
        top: 50%;
        height: 37px; // Висота внутрішнього контента
        margin: -20px 0 0 0;
        cursor: pointer;
        
        &::before {
          content: "";
          display: inline-block;
          height: inherit;
          width: 21px;
        }
      }
      
      .flex-prev {
        left: 0;
        
        &::before {
          background: url("@{urlDirImg}sprite.png") -657px -226px no-repeat;
        }
        
        &:hover::before {
          background: url("@{urlDirImg}sprite.png") -290px -226px no-repeat;
        }
      }
      
      .flex-next {
        right: 0;
        
        &::before {
          background: url("@{urlDirImg}sprite.png") -682px -226px no-repeat;
        }
        
        &:hover:before {
          background: url("@{urlDirImg}sprite.png") -315px -226px no-repeat;
        }
      }
      
      .flex-itemList {
        overflow: hidden;
        zoom: 1;
        max-height: inherit;
        border: 2px solid @color2;
        &:extend(.clear-fix all);
      }
      
      .flex-rows-list {
        position: absolute;
        bottom: 15px;
        text-align: center;
        list-style: none;
        line-height: 10px;
        width: 80%;
        padding: 0 10%;
        z-index: 20;
        left: 0;
      
        span {
          background: #fff;
          display: inline-block;
          width: 14px;
          height: 14px;
          margin: 0 5px;
          cursor: pointer;
          .border-radius(100%);
          .opacity(0.9);
      
          &.flex-active {
            background-color: @color2;
          }
        }
      }
    }
      ', 1)?>
  </code>

  <code data-type="js"><?=hc('
    $(".main-banner").flexslider({
        animation: "fade",
        selector: ".flex-itemList > img",
        touch: false, // IE знімаємо фікс у анімації fade(touch у події вписали webkitTransition для IE це не підтримується)
        controlNav: true,
        manualControls: ".flex-rows-list span",
        directionNav: true,
        customDirectionNav: ".flex-prev, .flex-next",
    });
    ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-10.jpg" alt="section-10">
  </code>
</section>

<section data-section="11">
  <nav>
    <h2>Затримка функцій Jquery через "deley()"</h2>
    <ul>
      <li>Js</li>
    </ul>
    <div class="num-section">11</div>
  </nav>

  <code data-type="js"><?=hc('
    $(".example").delay(300).queue(function (next) {
        $(".example2").css("margin-left", "100px");
        next();
    });
    ', 1)?>
  </code>
</section>

<section data-section="12">
  <nav>
    <h2>Мульти функціональний таймер зворотного відліку</h2>
    <ul>
      <li>Api</li>
      <li>Php + Tpl</li>
      <li>Less</li>
      <li>Js</li>
      <li>Example</li>
    </ul>
    <div class="num-section">12</div>
  </nav>

  <code data-type="api" class="hljs less"><?=hc('
    1. Можна вказувати безліч на сторінці.
    2. Потрібно вказати час до початку та до кінця. // До кінця повино бути обов\'язкове поле!
    ', 1)?>
  </code>

  <code data-type="php + tpl" class="hljs php"><?=hc('
      <?=(isset($share["top"])? $share["top"] : "<div class="timer"><p class="timer-text">Таймер не существует</p></div>")?>
      
      // PHP: Формування відбувається тут
      $shares = q("
          SELECT `id`, `name`, `end`, `start`, `symbol_code`
          FROM admin_shares
          WHERE `active` = 1
          AND `end` != ""
      ");
      
      if($shares->num_rows > 0){
          while($row = hsc($shares->fetch_assoc())){
              $stop = false;
              $jsEnd = (new DateTime($row["end"]))->format("M d,Y H:i:s");
              $jsStart = "";
      
              if (!empty($row["start"])){
                  $jsStart = (new DateTime($row["start"]))->format("M d,Y H:i:s");
                  $d = timePassed($row["start"], "to");
              }
      
              if (!isset($d) || !is_array($d)){
                  if(!is_array($d = timePassed($row["end"], "end"))){
                      $stop = true;
                  }
              }
              
              if ($stop){
                  $htmlTimer = "<div class="timer" data-timer-id="\'.$row[\'id\'].\'"><p class="timer-text">Акция Завершена</p></div>";
              } else {
                  $d["type"] = ($d["type"] == "end"? "До конца акции:" : "До начала акции:");
                  
                  $htmlTimer = "<div class="timer" data-timer-id="\'.$row[\'id\'].\'" data-timer-start="\'.$jsStart.\'" data-timer-end="\'.$jsEnd.\'"
                                                                                      data-timer-text="До конца акции:|Акция Завершена">
                    <p class="timer-text">\'.$d[\'type\'].\'</p>
                    
                    <div class="day">
                      <span>\'.$d[\'day\'][0].\'</span> <span>\'.$d[\'day\'][1].\'</span> <span>\'.$d[\'day\'][2].\'</span>
                    </div>
                    
                    <div class="separator">:</div>
                    
                    <div class="hour">
                      <span>\'.$d[\'hour\'][0].\'</span> <span>\'.$d[\'hour\'][1].\'</span>
                    </div>
                    
                    <div class="separator">:</div>
                    
                    <div class="min">
                      <span>\'.$d[\'min\'][0].\'</span> <span>\'.$d[\'min\'][1].\'</span>
                    </div>
                    
                    <div class="separator">:</div>
                    
                    <div class="sec">
                      <span>\'.$d[\'sec\'][0].\'</span> <span>\'.$d[\'sec\'][1].\'</span>
                    </div>
                  
                  </div>";   
              }
              
              $share[$row["symbol_code"]] = $htmlTimer;
          }   
      }
      
      function timePassed($var, $type){
          $date = time();
          $date_t = strtotime($var);
          $timer = $date_t - $date;
          
          if($date_t > $date){
              $day = intval($timer / (24 * 60 * 60));
              $day = strval($day < 10? \'00\'.$day : ($day > 99? $day : \'0\'.$day));
              
              $hour = intval($timer / (60 * 60)) % 24;
              $hour = strval($hour < 10? \'0\'.$hour : $hour);
              
              $min = intval($timer / 60) % 60;
              $min = strval($min < 10? \'0\'.$min : $min);
              
              $sec = intval($timer) % 60;
              $sec = strval($sec < 10? \'0\'.$sec : $sec);
              
              return [
                "type" => $type,
                "day"  => $day,
                "hour" => $hour,
                "min"  => $min,
                "sec"  => $sec
              ];
          } else {
              return false;
          }
      }
      ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    .timer {
      margin: 20px auto 0;
      max-width: 320px;
      font-size: 0;
      text-align: center;
      
      & > div {
        display: inline-block;
        .border-radius(2px);
      }
    }
     
    div:not([class="separator"]) {
      overflow: hidden;
      padding: 2px;
      background: url("@{urlDirImg}sprite.png") -164px -34px no-repeat;
    }
      
    .separator {
      font: 36px @font-TrebuchetMS-bolt;
      vertical-align: text-bottom;
      line-height: 46px;
      margin: 0 4px;
      
      @media screen and (max-width: 940px) {
        margin: 0;
      }
    }
      
    span {
      display: inline-block;
      position: relative;
      font: 36px @font-TrebuchetMS-bolt;
    }
    
    .timer-text {
      font: 21px @font-TrebuchetMS;
      text-align: center;
      color: #fff;
      line-height: 26px;
      margin-bottom: 10px;
    }', 1)?>
  </code>

  <code data-type="js"><?=hc('
    var objTimers = {};
    
    $(".timer[data-timer-id]").each(function (i) {
        objTimers[i] = {
            id: $(this).attr("data-timer-id"),
            start: $(this).attr("data-timer-start"),
            end: $(this).attr("data-timer-end"),
            text: $(this).attr("data-timer-text")
        };
    });
    
    getTimer(objTimers); // Заводимо наші таймери
    
    function getTimer(obj) {
        var date = new Date(),
            date_t, // Кінцева дата
            timer,  // Скільки залишається до кінця таймінга
            sel,
            param,
            text,
            newDate = false;
    
        for (var prop in obj) {
            if (!obj.hasOwnProperty(prop)) {
                continue;
            }
    
            param = obj[prop];
            sel = $(".timer[data-timer-id="" + param.id + ""]");
    
            if (param.end === undefined) {
                delete(obj[prop]);
                continue;
            } else if (param.start.length > 0) {
                date_t = new Date(param.start);
    
                if (date_t < date) {
                    date_t = new Date(param.end);
                    sel.find(".timer-text").text(param.text.split("|")[0]);
                    obj[prop].start = "";
                    newDate = true;
                }
            } else {
                date_t = new Date(param.end);
            }
    
            if (date_t > date) { // Провіряєм на закінчення відліку
                timer = date_t - date;
    
                var day = parseInt(timer / (24 * 60 * 60 * 1000));
                day = (day < 10 ? "00" + day : (day > 99 ? day : "0" + day)).toString();
          
                var hour = parseInt(timer / (60 * 60 * 1000)) % 24;
                hour = (hour < 10 ? "0" + hour : hour).toString();
          
                var min = parseInt(timer / (1000 * 60)) % 60;
                min = (min < 10 ? "0" + min : min).toString();
          
                var sec = parseInt(timer / 1000) % 60;
                sec = (sec < 10 ? "0" + sec : sec).toString();
    
                if (newDate) {
                    sel.find(".day").html("<span>" + day[0] + "</span> <span>" + day[1] + "</span> <span>" + day[2] + "</span>");
                    sel.find(".hour").html("<span>" + hour[0] + "</span> <span>" + hour[1] + "</span>");
                    sel.find(".min").html("<span>" + min[0] + "</span> <span>" + min[1] + "</span>");
                    sel.find(".sec").html("<span>" + sec[0] + "</span> <span>" + sec[1] + "</span>");
                    continue;
                }
    
                // Replace Animation
                var nextDay = false;
    
                // Дні
                if (hour == 23 && min == 59 && sec == 59) {
                    nextDay = true;
                }
          
                if (day[1] == 9 && day[2] == 9 && nextDay) {
                    animation_t(sel.find(".day span:first"), day[0]);
                }
          
                if (day[1] == 9 && nextDay) {
                    animation_t(sel.find(".day span:eq(1)"), day[1]);
                }
          
                if (nextDay) {
                    animation_t(sel.find(".day span:last"), day[2])
                }
          
                // Години
                if ((hour == 9 || hour == 19 || hour == 23) && min == 59 && sec == 59) {
                    animation_t(sel.find(".hour span:first"), hour[0]);
                }
          
                if (min == 59 && sec == 59) {
                    animation_t(sel.find(".hour span:last"), hour[1]);
                }
          
                // Хвилини
                if (min[1] == 9 && sec == 59) {
                    animation_t(sel.find(".min span:first"), min[0]);
                }
          
                if (sec == 59) {
                    animation_t(sel.find(".min span:last"), min[1]);
                }
          
                // Секунди
                if (sec[1] == 9) {
                    animation_t(sel.find(".sec span:first"), sec[0]);
                }
    
                animation_t(sel.find(".sec span:last"), sec[1]);
            } else {
                sel.html("<p class="timer-text">" + param.text.split("|")[1] + "</p>");
                delete(obj[prop]);
            }
        }
      
        var count = 0;
        for (var i in obj) {
            if (obj.hasOwnProperty(i)) {
                count++;
            }
        }
    
        if (count > 0) {
            setTimeout(function () {
                getTimer(obj)
            }, 1000);
        } else {
            return false;
        }
    }
    
    function animation_t(sel, param) {
        sel.html(param).css({"top": "-45px", "opacity": "0"}).animate({"top": "0", "opacity": "1"}, 600);
    }
  ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-12.jpg" alt="section-12">
  </code>
</section>

<section data-section="13">
  <nav>
    <h2>Google maps</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Js</li>
      <li>Example</li>
    </ul>
    <div class="num-section">13</div>
  </nav>

  <code data-type="api" class="hljs less"><?=hc('
    1. Перш ніж підключити карту, необхідно авторизуватись на сайті Google та отримита ключ для карти.
    2. Ключ можна отримати тут: https://developers.google.com/maps/documentation/javascript/get-api-key
    ', 1)?>
  </code>

  <code data-type="tpl"><?=hc('
    <script defer src="https://maps.googleapis.com/maps/api/js?key=KEY&language=ru"></script>
    <div id="map-canvas"></div>
    ', 1)?>
  </code>

  <code data-type="js"><?=hc('
    function mapStart() {
        var map = new google.maps.Map(document.getElementById("map-canvas"), {
            center: {lat: 49.5504868, lng: 25.5866435},
            zoom: 17,
            mapTypeId: google.maps.MapTypeId.ROADMAP, // Відображення карти
            disableDefaultUI: true,                   // Відключаєм стандартні настройки
            zoomControl: true,                        // Значок + -
            mapTypeControl: true,                     // Значок вибір типу карти
            mapTypeControlOptions: {
                style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
                position: google.maps.ControlPosition.LEFT_TOP
            },
            scaleControl: false,      // Метраж на карті
            streetViewControl: true,  // Мождивість попасти у вулицю онлайн
            rotateControl: false,
            scrollwheel: false
        });

        var marker = new google.maps.Marker({
            position: {lat: 49.550666, lng: 25.586499},
            map: map,
            title: "Children\'s Dream",
            animation: google.maps.Animation.DROP
        });
        
        var infowindow = new google.maps.InfoWindow({
            content: "<div class="content-map"><h1>Магазин автомобілів</h1 ></div>"
        });
    
        google.maps.event.addListener(marker, "click", function() {
            infowindow.open(map,marker);
        });
    }
    ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-13.jpg" alt="section-13">
  </code>
</section>

<section data-section="14">
  <nav>
    <h2>Адаптивне модальне вікно на CSS3</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Js</li>
    </ul>
    <div class="num-section">14</div>
  </nav>

  <code data-type="tpl"><?=hc('
    <div data-modal="modal1"> Тут контент </div> 
    <!-- data-modal - назва індентифікатора кнопки на яку нажимаємо і появляється спливайка -->
    
    <div data-open-modal="modal1">Відкриваємо вікно</div> <!-- Кнопка щоб відкрити вікно -->
    <!-- data-open-modal - назва блоку елемента на який посилаємся -->
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    div[data-modal] {
      display: none;
    }
    
    .modHeader {
      font-size: 26px;
      line-height: 32px;
      text-align: center;
      margin-bottom: 20px;
      max-width: 390px;
      color: @color6;
    }
    
    .close {
      position: absolute;
      right: -15px;
      top: -15px;
      line-height: 30px;
      width: 30px;
      text-align: center;
      border: 2px solid #ffffff;
      background: #2face5;
      color: #ffffff;
      font-family: "Helvetica", "Arial", sans-serif;
      font-weight: bold;
      cursor: pointer;
      .border-radius(100%);
      .transition(all 0.3s);
      
      &:hover {
        background: @color2;
        .transition(all 0.3s);
      }
    }
    
    .dm-modal div[data-modal] {
      display: block;
    }
    
    .dm-overlay {
      position: fixed;
      top: 0;
      left: 0;
      background: rgba(0, 0, 0, 0.65);
      overflow: auto;
      width: 100%;
      height: 100%;
      z-index: 1000;
    }
    
    .dm-overlay:target {
      display: block;
      .animation(fade 0.6s);
    }
    
    .dm-table {
      display: table;
      width: 100%;
      height: 100%;
    }
    
    .dm-cell {
      display: table-cell;
      padding: 20px 1em;
      vertical-align: middle;
      text-align: center;
    }
    
    .dm-modal {
      display: inline-block;
      padding: 15px;
      background: #e0f3fb;
      text-align: left;
      color: @color6;
      border: 1px solid #2face5;
      position: relative;
      
      /* Максимальна ширина */
      max-width: 50em;
      .box-shadow(0px 15px 20px rgba(0, 0, 0, 0.22), 0px 19px 60px rgba(0, 0, 0, 0.3));
      .animation(fade 0.8s);
    }

    /* Анімація при появі затемнення і блоків з вмістом*/
    @-moz-keyframes fade {
      from {
        .opacity(0);
      }
      
      to {
        .opacity(1);
      }
    }
      
    @-webkit-keyframes fade {
      from {
        .opacity(0);
      }
      
      to {
        .opacity(1);
      }
    }
      
    @keyframes fade {
      from {
        .opacity(0);
      }
      
      to {
        .opacity(1);
      }
    }
    ', 1)?>
  </code>

  <code data-type="js"><?=hc('
    function modalWindow(dataName) {
        var nameBlock = dataName;
        var content = $("div[data-modal="\' + nameBlock + \'"]");
    
        if (content.length) {
            // Wrap Content
            $(function () {
                var modal = \'<div class="dm-overlay"><div class="dm-table"><div class="dm-cell"><div class="dm-modal"></div></div></div></div>\';
                content.wrap(modal).before("<div class="close">X</div>");
            });
    
            $("body").click(function (e) {
                var el = e.target;
    
                if ($(el).parents().is(".dm-overlay") && ($(el).is(".close") || $(el).is(".dm-cell"))) {
                    var backContent = $("div[data-modal="\' + nameBlock + \'"]");
    
                    $(".dm-table").hide();
                    $(".dm-overlay").animate({opacity:0}, function(){
                        $(this).remove();
                    });
    
                    $("footer").after(backContent);
                }
            });
        } else {
            alert("Error: modal window with that name does not exist");
        }
    }
    ', 1)?>
  </code>
</section>

<section data-section="15">
  <nav>
    <h2>Маска для заповнення полів телефону дати і т.д.</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Js</li>
      <li>Example</li>
    </ul>
    <div class="num-section">15</div>
  </nav>

  <code data-type="api" class="hljs less"><?=hc('
    API      |   https://github.com/RobinHerbots/Inputmask
    Install  |   - через bower, за пошуком: jquery.inputmask (автор: Robin Herbots)
    
    Для задання шаблону використовуємо для всіх цифр == 9, для алфавіту == а, змішано == *, наприклад:
    mask: "*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[.*{2,6}][.*{1,2}]"
    ', 1)?>
  </code>

  <code data-type="tpl"><?=hc('
    <script src="/vendor/public/jquery.inputmask/dist/jquery.inputmask.bundle.min.js" defer></script>
    
    <input id="test1" type="text" placeholder="Маска для телефону">
    <input id="test2" type="text" placeholder="Просте слово на 10 символів">
    <input id="test3" type="text" placeholder="Необов\'язковий символ">
    <input id="test4" type="text" placeholder="">
    ', 1)?>
  </code>

  <code data-type="js"><?=hc('       
    $("#test1").inputmask({
        showMaskOnHover: false,
        mask: "+38 (099) 999-99-99"
    });
    
    $("#test2").inputmask({
        showMaskOnHover: false,
        mask: "aaaaaaaaaa"
    });
    
    $("#test3").inputmask({
        showMaskOnHover: false,
        mask: "(99) 9999[9]-9999" // [] - необов\'язковий параметр може бути так і НЕ бути присутній символ
    });
    
    $("#test4").inputmask("9[-9999]", {
        showMaskOnHover: false,
        greedy: true // включає вивід 1 послідкового _ або всіх ___ до взаганого шаблону
    });
    
    Inputmask.isValid($(this).val(), { mask: "99/99/9999"} // Перевіряєм на правельне 
    ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-15.jpg" alt="section-15">
  </code>
</section>

<section data-section="16">
  <nav>
    <h2>Перевірка на заповнення полів через сервер, мотодом Ajax</h2>
    <ul>
      <li>Api</li>
      <li>Tpl</li>
      <li>Js</li>
    </ul>
    <div class="num-section">16</div>
  </nav>

  <code data-type="api" class="hljs less"><?=hc('
    1. Працює на основі власної розробки.
    2. Використовується для простих задач.
    3. Не потребує сторонніх ресурсів.
    4. Підтримується мульти функціональність.
    ', 1)?>
  </code>

  <code data-type="tpl"><?=hc('
    <form action="/?ajax=ok&callback=ok" method="post" name="callback" onsubmit="return checkForm("callback");">
      <div class="input-value">
        <p>Name*</p>
        <input type="text" name="name" value="">
      </div>
      <div class="input-value">
        <p>Phone*</p>
        <input type="text" name="phone" value="">
      </div>
      <div class="center-submit">
        <input type="submit" name="ok" value="Відправити">
      </div>
    </form>
    ', 1)?>
  </code>

  <code data-type="js"><?=hc('       
    function checkForm(nameForm) {
        var obj = $("form[name=" + nameForm + "] input:not([type="submit"])"),
            action = $("form[name=" + nameForm + "]").attr("action"),
            error = 0,
            value = {};
            
        for (var i = 0; i < obj.length; i++) {
            var input = $(obj[i]);
            value[input.attr("name")] = input.val();
            
            if (input.attr("data-next-check") !== undefined) { // Поле яке не перевіряємо
                continue;
            }
            
            // Check email
            if (input.attr("name") == "email") {
                var atpos = input.val().indexOf("@");
                var dotpos = input.val().lastIndexOf(".");
                
                if (!(atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= input.val().length) == false) {
                    input.addClass("error");
                    error = 1;
                }
            }
            
            if (input.val().length === 0) {
                input.addClass("error");
                error = 1;
            }
        }
        
        if (error == 0) {
            $.ajax({
                type: "POST",
                url: action,
                cache: false,
                data: value,
                success: function (response) {
                    var res = JSON.parse(response);
                    
                    if (res["error"] === undefined && res["successful"] == "ok") {
                    
                        // Тут розділяємо форми
                        if (nameForm == "nameform") {
                    
                        } else if(nameForm == "nameform"){
                    
                        } else {
                            alert("The form with this "" +nameform +"" was not found");
                        }
                    } else {
                        alert(res["error"]);
                    }
                }
            });
            
            return false;
        } else {
            for (var j = 0; j < obj.length; j++) {
                (function (i) {
                    $(obj[i]).delay(3500).queue(function (next) {
                        $(this).removeAttr("class");
                        next();
                    });
                })(j); // (j) - ключ в пам\'яті браузера про анонімну створену функцію
            }
            
            return false;
        }
    }', 1)?>
  </code>
</section>

<section data-section="17">
  <nav>
    <h2>PayPal оплата</h2>
    <ul>
      <li>Api</li>
      <li>Php1</li>
      <li>Php2</li>
      <li>Example</li>
    </ul>
    <div class="num-section">17</div>
  </nav>

  <code data-type="api" class="hljs less"><?=hc('
    1. Спочатку необхідно створити тестовий акаунт на сервісі: https://www.sandbox.paypal.com/
    2. Обов\'язково вказувати продавця і покупця в тестовому режимі (свої дані, на робочій машині достатньо поміняти їх).
    3. Там будемо перевіряти у тестовому режимі операції з перерахуванням коштів.
    4. Програмна розробка: для цього необхідно 2 файла. Перший - це сам class_PayPal.php. Другий функціонал оплати.
    ', 1)?>
  </code>

  <code data-type="php1" class="pre-wrap"><?=hc('
    Файл 1: class_PayPal.php
    
    class class_PayPal {
        var $last_error = "";
        var $ipn_response = "";
        var $ipn_log_file;
        var $ipn_log = true;     // Включити/виключити запис в лог файл
        var $ipn_data = array(); // Массив з даними від PayPal про оплату
        var $fields = array();   // Массив з значеннями полів PayPal
        
        // Параметри по замовчуванню, у подальшому можуть перезаписуватись.
        function class_PayPal() {
            $this->paypal_url   = "https://www.sandbox.paypal.com/cgi-bin/webscr";
            $this->ipn_log_file = $_SERVER["DOCUMENT_ROOT"]."/libs/PayPal/ipn_results.log";
            
            $this->add_field("rm", "2");         // Результат у вигляді (0,1 -> GET, 2 -> POST)
            $this->add_field("cmd", "_xclick");  // Кнопка оплати при кліку (оплатити зараз)
        }
        
        function add_field($field, $value) {
            $this->fields[$field] = $value; // Параметри PayPal у вигляді array(key => value)
        }
        
        /* Функція фактично генерує всю HTML-сторінку, що складається з форми з прихованими елементами, які передаються у PayPal. Це відбувається через атрибут OnLoad, коли сторінка сформувалася у прихованому режимі виконується функція яка запустить процес передачі даних на сервер PayPal. У цей момент користувачу з\'явиться повідомлення на екрані, де говориться: "Будь ласка, зачекайте, ваше замовлення обробляється ...", а потім відразу перенаправляється на PayPal. */
        
        function submit_paypal_post() {
            echo "<html>\n";
            echo "<head><title>Processing Payment...</title></head>\n";
            echo "<body onLoad="document.forms[\'paypal_form\'].submit();\">\n";
            echo "<form method="post" name="paypal_form" action=".$this->paypal_url.">\n";
            
            foreach($this->fields as $name => $value){
                echo "<input type="hidden" name="$name" value="$value">\n";
            }
            
            echo "</form>\n";
            echo "</body></html>\n";
        }
        
        function validate_ipn() {
            $postData = "";
        
            foreach($_POST as $field => $value){
                $this->ipn_data[$field] = $value;
                $postData .= $field."=".urlencode($value)."&";
            }
            
            $postData .= "cmd=_notify-validate";
            
            $curl = curl_init($this->paypal_url);
            curl_setopt($curl, CURLOPT_HEADER, 0);
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, $postData);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 2);
            $this->ipn_response = curl_exec($curl);
            curl_close($curl);
            
            if($this->ipn_response == "VERIFIED"){
                $this->log_ipn_results(true);
    
                return true;
            } else {
                $this->last_error = "Invalid IPN transaction.";
                $this->log_ipn_results(false);
    
                return false;
            }
        }
        
        function log_ipn_results($success) {
            if(!$this->ipn_log){
                return;
            }
            
            // Timestamp and SUCCESS
            $text = "[".date("m/d/Y H:i:s A")."] - ".($success? "SUCCESS!\n" : "FAIL: ".$this->last_error."\n");
            
            // Log the Get variable
            $text .= "IPN GET Vars from Paypal:\n";
            foreach($_GET as $key => $value){
                $text .= $key."=".$value."\n";
            }
            
            // Log the POST variables
            $text .= "IPN POST Vars from Paypal:\n";
            foreach($this->ipn_data as $key => $value){
                $text .= $key."=".$value."\n";
            }
            
            // Log the response from the paypal server
            $text .= "\nIPN Response from Paypal Server:\n ".$this->ipn_response;
            
            // Write to log
            $fp = fopen($this->ipn_log_file, \'a\');
            fwrite($fp, $text."\n\n");
            fclose($fp);  // close file
        }
        
        function dump_fields() {
            echo "<table width="95%" border="1" cellpadding="2" cellspacing="0">
            <tr>
               <td bgcolor="black"><b><font color="white">Field Name</font></b></td>
               <td bgcolor="black"><b><font color="white">Value</font></b></td>
            </tr>";
            
            ksort($this->fields);
            foreach($this->fields as $key => $value){
                echo "<tr><td>$key</td><td>".urldecode($value)."&nbsp;</td></tr>";
            }
            
            echo "</table><br>";
        }
    }', 1)?>
  </code>

  <code data-type="php2" class="pre-wrap"><?=hc('       
    Файл 2: Функціонал оплати
    
    if (isset($_POST["ok"])) { // Процес оплати...
        require_once($_SERVER["DOCUMENT_ROOT"]."/libs/PayPal/class_PayPal.php"); // Підключаємо класс PayPal
        
        $p = new class_PayPal;                                                   // Створюєм екземпляр класа
        $p->paypal_url   = "https://www.sandbox.paypal.com/cgi-bin/webscr";      // Тестовий url PayPal
        //$p->paypal_url = "https://www.paypal.com/cgi-bin/webscr";              // Робочий url PayPal для оплат
        
        $this_script = $arMainParam["url_http_site"]."/apply/payment/";          // Сторінка cancel, success, ipn!!!
        
        if (!isset($_POST["price"]) || !preg_match("#^\d+\.00$#uis", $_POST["price"])) {
            sessionInfo("/apply/payment/", "<p>Будь ласка не змінюйте код суми для оплати!</p>");
        } else {
            // Якщо потрібно додаткові параметри додаємо тут!
            $p->add_field("first_name", $data["first_name"]);
            $p->add_field("last_name", $data["last_name"]);
            $p->add_field("item_name", "Service Online");      // Короткий опис для покупця
            $p->add_field("amount", $_POST["price"]);          // Повна ціна оплати
            $p->add_field("item_number", $data["idCardHash"]); // Номер замовлення ( Унікальний!!! )
            $p->add_field("no_shipping", "1");                 // Запрос на адрес доставки (виключили)
            $p->add_field("currency_code", "USD");             // Валюта
            $p->add_field("charset", "utf-8");                 // Юнікод
            
            $p->add_field("business", "Savitskuy-facilitator@ukr.net"); // Email PayPal продавця
            
            $p->add_field("return", $this_script."payment-success/");
            $p->add_field("cancel_return", $this_script."payment-cancel/");
            $p->add_field("notify_url", $this_script."ipn-access/");
            
            $p->submit_paypal_post(); // Формумання скритої форми з параметрами які ми вказали
            //$p->dump_fields();      // Вивід на екран даних для перевірки полів
        }
    }
    
    if (isset($_GET["key1"]) && $_GET["key1"] == "payment-success") {
        // Тут після оплати перекидаємо користувача, що ви оплатили, но іде перевірка
    }
    
    if (isset($_GET["key1"]) && $_GET["key1"] == "payment-cancel") {
        sessionInfo("/apply/payment/", "<p>Оплата не виконалась, ви скасували свою оплату!</p>");
    }
    
    if (isset($_GET["key1"]) == "ipn-access") {
        // IP PayPal "173.0.82.126 -> test" "173.0.81.1 and 173.0.81.33" -> machine){
        $ipPayPal = array(
          "173.0.81.33",
          "173.0.81.1"
        );
        
        if(!in_array($_SERVER["REMOTE_ADDR"], $ipPayPal)) {
            // Якщо приходять з іншого ресурса дані, ми їх блочимо
        }
        
        require_once($_SERVER["DOCUMENT_ROOT"]."/libs/PayPal/class_PayPal.php"); // Підключаємо класс PayPal
        
        $p = new class_PayPal;                                                   // Створюєм екземпляр класа
        $p->paypal_url = "https://www.sandbox.paypal.com/cgi-bin/webscr";        // Тестовий url PayPal
        //$p->paypal_url = "https://www.paypal.com/cgi-bin/webscr";              // Робочий url PayPal для оплат
        
        if ($p->validate_ipn()) {
            // Тут перевіряємо дані які зберігаються у ipn_data() array.
            // Коротше кажучи - тут провіряємо оплату!!!
        }
    }', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-17.jpg" alt="section-17">
  </code>
</section>

<section data-section="18">
  <nav>
    <h2>Редагування стилю Radio|Checkbox через CSS3</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">18</div>
  </nav>

  <code data-type="tpl" class="xml"><?=hc('
    <input id="radio-1" name="radio" type="radio" checked>
    <label for="radio-1">Активный</label>
    
    <input id="checkbox-1" type="checkbox" checked>
    <label for="checkbox-1">Активный</label>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    label {
      display: block;
      margin-bottom: 5px;
      margin-top: 10px;
    }
    
    input[type="radio"], input[type="checkbox"] {
      display: none;
    }
    
    input + label::before {
      content: "";
      display: inline-block;
      width: 7px;
      height: 7px;
      margin-right: 8px;
      vertical-align: middle;
      border: 3px solid #ffffff;
      box-shadow: 0 0 0 3px #bdc3c7;
    }
    
    input[type="radio"] + label::before {
      border-radius: 50%;
    }
    
    input:checked + label::before {
      background: #1abc9c;
      box-shadow: 0 0 0 3px #1abc9c;
    }
    
    input:checked + label {
      color: #1abc9c;
    }', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-18.jpg" alt="section-18">
  </code>
</section>

<section data-section="19">
  <nav>
    <h2>Трюк на вертикальне та горизонтальне вирівнювання блока</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">19</div>
  </nav>

  <code data-type="tpl" class="xml"><?=hc('
    <div class="modal-wrapper">
      <div class="modal-cell">
        <div class="modal-content">
          <h1>Форма входа</h1>
          <input type="text" placeholder="Логин">
          <input type="password" placeholder="Пароль">
          <button type="submit">Отправить</button>
        </div>
      </div>
    </div>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    .modal-wrapper {
      display: table;
    }
    
    .modal-cell {
      display: table-cell;
      text-align: center;
      vertical-align: middle;
    }', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-19.jpg" alt="section-19">
  </code>
</section>

<section data-section="20">
  <nav>
    <h2>Кругла стрілка за допомогою рамки</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">20</div>
  </nav>

  <code data-type="tpl"><?=hc('
    <div class="arrow-round"></div>
  ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    .arrow-round {
      position: relative;
      width: 200px;
      height: 200px;
      margin: 100px auto;
      border: 50px solid #0074d9;
      border-radius: 50%;
      border-right-color: transparent;
      
      &:after {
        content: "";
        position: absolute;
        top: -45px;
        left: 130px;
        border: 100px solid #ffffff;
        border-top-width: 0;
        border-right-width: 0;
        border-bottom-color: #0074d9;
        border-left-color: transparent;
      }
    }
  ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-20.jpg" alt="section-20">
  </code>
</section>

<section data-section="21">
  <nav>
    <h2>Психоделічна тінь</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">21</div>
  </nav>

  <code data-type="tpl"><?=hc('
    <p>
      <span>C</span><span>S</span><span>S</span>
    </p>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    p {
        margin: 0;
        padding-top: 60px;
        text-align: center;
    }
    
    span:last-child {
        margin-left: 60px;
        text-shadow: 
            -5px -5px 0 #7fdbff,
            -10px -10px 0 #39cccc,
            -15px -15px 0 #3d9970,
            -20px -20px 0 #2ecc40,
            -25px -25px 0 #01ff70,
            -30px -30px 0 #ffdc00,
            -35px -35px 0 #ff851b,
            -40px -40px 0 #ff4136,
            -45px -45px 0 #f012be,
            -50px -50px 0 #b10dc9
        ;
    }
    
    span:nth-of-type(2) {
        margin-left: 60px;
        text-shadow: 
            0 -5px 0 #7fdbff,
            0 -10px 0 #39cccc,
            0 -15px 0 #3d9970,
            0 -20px 0 #2ecc40,
            0 -25px 0 #01ff70,
            0 -30px 0 #ffdc00,
            0 -35px 0 #ff851b,
            0 -40px 0 #ff4136,
            0 -45px 0 #f012be,
            0 -50px 0 #b10dc9
        ;
    }
    
    span:first-child {
        margin-left: 0;
        text-shadow: 
            5px -5px 0 #7fdbff,
            10px -10px 0 #39cccc,
            15px -15px 0 #3d9970,
            20px -20px 0 #2ecc40,
            25px -25px 0 #01ff70,
            30px -30px 0 #ffdc00,
            35px -35px 0 #ff851b,
            40px -40px 0 #ff4136,
            45px -45px 0 #f012be,
            50px -50px 0 #b10dc9
        ;
    }', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-21.jpg" alt="section-21">
  </code>
</section>

<section data-section="22">
  <nav>
    <h2>Зловісні тіні</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">22</div>
  </nav>

  <code data-type="tpl"><?=hc('
    <div class="btn">Вперед!</div>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    .btn {
      position: relative;
      width: 250px;
      margin: 0 25px;
      margin-top: 100px;
      padding: 20px 0;
      line-height: 20px;
      text-align: center;
      text-transform: uppercase;
      color: white;
      background: #2c3e50;
      cursor: pointer;
      box-shadow:
        inset 0 5px 0 0 #2ecc71,
        inset 0 -5px 0 0 #2ecc71,
        0 -20px 0 -10px #c0392b,
        0 -40px 0 -20px #e74c3c,
        0 20px 0 -10px #2980b9,
        0 40px 0 -20px #3498db
      ;
    }
    
    .btn::after {
      content: "";
      width: 50%;
      height: 5px;
      background: #16a085;
      position: absolute;
      top: 0;
      right: 0
    }
    
    .btn::before {
      content: "";
      width: 50%;
      height: 5px;
      background: #16a085;
      position: absolute;
      bottom: 0;
      left: 0
    }', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-22.jpg" alt="section-22">
  </code>
</section>

<section data-section="23">
  <nav>
    <h2>Цікаві CSS кнопки</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">23</div>
  </nav>

  <code data-type="tpl"><?=hc('
    <div class="effect-1">
      <a href="#">Апельсин</a>
    </div>
    
    <div class="effect-2">
      <a href="#">Виноград</a>
    </div>
    
    <div class="effect-3">
      <!-- Цікавий момент! -->
      <a href="#" data-hover="Лайм">Лайм</a>
    </div>
    
    <div class="effect-4">
      <a href="#">Ківі</a>
    </div>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    div[class^="effect-"] a {
      position: relative;
      display: inline-block;
      text-decoration: none;
      text-transform: uppercase;
      font-weight: 300;
      letter-spacing: 1px;
      outline: none;
      text-decoration: none !important;
    }
    
    /* BEGIN effect 1 */
    div[class^="effect-"] {
      width: 150px;
      margin: 0 auto;
      padding: 15px 10px;
      text-align: center;
    }
    
    .effect-1 {
      background-color: #f19f0f;
    }
    
    .effect-1 a {
      padding: 6px 0 8px;
      color: #ffffff;
    }
    
    .effect-1 a::after {
      content: "";
      position: absolute;
      top: 100%;
      left: 0;
      width: 100%;
      height: 4px;
      background-color: rgba(0, 0, 0, 0.1);
      opacity: 0;
      transition: opacity 0.3s, transform 0.3s;
      transform: translateY(10px);
    }
    
    .effect-1 a:hover::after {
      opacity: 1;
      transform: translateY(0px);
    }
    /* END effect 1 */
    
    /* BEGIN effect 2*/
    .effect-2 {
      background: #1f7199;
    }
    
    .effect-2 a {
      padding: 0 20px;
      height: 45px;
      line-height: 45px;
      color: #ffffff;
    }
    
    .effect-2 a::before,
    .effect-2 a::after {
      content: "";
      position: absolute;
      width: 45px;
      height: 2px;
      background-color: #ffffff;
      opacity: 0.2;
      transition: all 0.3s;
    }
    
    .effect-2 a::before {
      top: 0;
      left: 0;
      transform: rotate(90deg);
      transform-origin: 0 0;
    }
    
    .effect-2 a::after {
      right: 0;
      bottom: 0;
      transform: rotate(90deg);
      transform-origin: 100% 100%;
    }
    
    .effect-2 a:hover::before {
      left: 50%;
      opacity: 1;
      transform: rotate(0deg) translateX(-50%);
    }
    
    .effect-2 a:hover::after {
      right: 50%;
      opacity: 1;
      transform: rotate(0deg) translateX(50%);
    }
    /* END effect 2 */
    
    /* BEGIN effect 3 */
    .effect-3 {
      background-color: #2ac56c;
    }
    
    .effect-3 a {
      color: rgba(0, 0, 0, 0.2);
      font-weight: bold;
    }
    
    .effect-3 a::before {
      content: attr(data-hover); /* Цікавий момент! */
      position: absolute;
      color: #ffffff;
      transition: transform 0.3s, opacity 0.3s;
    }
    
    .effect-3 a:hover::before {
      transform: scale(0.9);
      opacity: 0;
    }
    /* END effect 3 */
    
    /* BEGIN effect 4 */
    .effect-4 {
      background-color: #3fa46a;
    }
    
    .effect-4 a {
      padding: 8px;
      font-weight: bold;
      color: #237546;
    }
    
    .effect-4 a:hover {
      color: #ffffff;
      transition: color 0.3s;
    }
    
    .effect-4 a::before,
    .effect-4 a::after {
      content: "";
      position: absolute;
      left: 0;
      width: 100%;
      height: 2px;
      background-color: #ffffff;
      opacity: 0;
      transition: opacity 0.3s, transform 0.3s;
    }
    
    .effect-4 a::before {
      top: 0;
      transform: translateY(-10px);
    }
    
    .effect-4 a::after {
      bottom: 0;
      transform: translateY(10px);
    }
    
    .effect-4 a:hover::before,
    .effect-4 a:hover::after {
      opacity: 1;
      transform: translateY(0px);
    }
    /* END effect 4*/
    ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-23.jpg" alt="section-23">
  </code>
</section>

<section data-section="24">
  <nav>
    <h2>При наведені на зображення висувається опис через CSS</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">24</div>
  </nav>

  <code data-type="tpl"><?=hc('
    <section class="works">
      <a class="caption-link" href="#" data-title="Sunset" data-description="Lorem ipsum dolor sit amet, consectetuer adipiscing elit.">
        <img src="/skins/img/main-bg.jpg" alt="Sunset">
      </a>
    </section>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    .works {
      width: 240px;
      margin: 100px auto;
      padding: 20px;
      background: white;
      box-shadow: 0 0 3px #cccccc;
    }
    
    .caption-link {
      position: relative;
      z-index: 1;
      display: block;
      overflow: hidden;
    }
    
    .caption-link img {
      display: block;
      max-width: 100%;
      transition: transform 0.7s ease-in-out;
    }
    
    .caption-link:hover img {
      transform: translateX(100%);
    }
    
    .caption-link::before,
    .caption-link::after {
      position: absolute;
      z-index: -1;
      width: 100%;
      text-align: center;
      background: #333333;
      box-sizing: border-box;
      transition: transform 0.7s ease-in-out;
      transform: translateX(-80px);
    }
    
    .caption-link::before {
      content: attr(data-title);
      height: 30%;
      padding: 30px;
      font-size: 22px;
      font-weight: bold;
      color: #ffffff;
    }
    
    .caption-link::after {
      content: attr(data-description);
      top: 30%;
      height: 70%;
      padding: 0 30px;
      color: #d7bb97;
    }
    
    .caption-link:hover::before,
    .caption-link:hover::after {
      transform: translateX(0);
    }
    ', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-24.jpg" alt="section-24">
  </code>
</section>

<section data-section="25">
  <nav>
    <h2>Хлібні крихти з цікавою реалізацією :before</h2>
    <ul>
      <li>Tpl</li>
      <li>Less</li>
      <li>Example</li>
    </ul>
    <div class="num-section">25</div>
  </nav>

  <code data-type="tpl"><?=hc('
    <div class="breadcrumbs">
      <a href="#">Головна</a>
      <a class="active" href="#">Курси</a>
      <a href="#">Седектори</a>
    </div>
    ', 1)?>
  </code>

  <code data-type="less"><?=hc('
    .breadcrumbs {
      display: inline-block;
      margin: 150px 0;
      color: black;
      box-shadow: 0 0 2px #aaaaaa;
      text-align: center;
      counter-reset: flag; /* Оголошуємо лічильник */
    }
    
    .breadcrumbs a::after {
      content: "";
      position: absolute;
      top: 0;
      right: -18px;
      z-index: 1;
      width: 36px;
      height: 36px;
      background-color: white;
      border-radius: 50px 0 0 0;
      box-shadow: 1px 1px 0 1px #dddddd;
      transform: rotate(-45deg) scale(0.73);
      transition: background-color 0.1s;
    }
    
    .breadcrumbs a:hover,
    .breadcrumbs a:hover::after,
    .breadcrumbs a.active,
    .breadcrumbs a.active::after {
      background-color: #f1c40f;
    }
    
    .breadcrumbs a {
      position: relative;
      float: left;
      padding-left: 60px;
      padding-right: 10px;
      text-decoration: none;
      line-height: 36px;
      color: black;
      background-color: white;
      transition: background-color 0.1s;
      
      &::before {
        content: counter(flag) "."; /* Виводимо дані */
        counter-increment: flag;    /* Збільшуємо значення лічильника */
        position: absolute;
        top: 8px;
        left: 30px;
        width: 20px;
        height: 20px;
        line-height: 20px;
        background-color: white;
        border-radius: 50%;
        box-shadow: 0 0 2px #cccccc;
      }
      
      &:first-child {
        padding-left: 46px;
      }
      
      &:first-child::before {
        left: 14px;
      }
    }', 1)?>
  </code>

  <code data-type="example">
    <img src="/skins/img/section/section-25.jpg" alt="section-25">
  </code>
</section>

<svg width="310" height="290">
  <ellipse cx="150" cy="270" rx="75" ry="20" fill="lightgray"/>

  <circle cx="150" cy="150" r="120" fill="gold"/>
  <circle cx="100" cy="120" r="50" fill="white"/>
  <circle cx="170" cy="120" r="50" fill="white"/>
  <circle cx="170" cy="120" r="10" fill="black"/>
  <circle cx="100" cy="120" r="10" fill="black"/>

  <ellipse cx="135" cy="210" rx="10" ry="20" fill="crimson"/>
</svg>