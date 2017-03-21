<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <title>Готові рішення</title>
  <meta name="apple-mobile-web-app-title" content="Готові рішення">
  <meta name="description" content="Готові рішення">
  <meta name="keywords" content="Готові рішення">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="author" content="Савіцький Андрій">
  <meta name="robots" content="index, nofollow">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="format-detection" content="address=no">

  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

  <link rel="stylesheet" href="./bower_components/normalize-css/normalize.css">
  <link rel="stylesheet" href="/skins/node_modules/highlight/styles/github-gist.css">
  <link rel="stylesheet" href="/skins/css/style.min.css?v=<?=$vF?>">

  <!--[if lt IE 9]>
  <script src="/skins/default/js/ielt9.min.js" defer></script><![endif]-->
  <script src="./bower_components/jquery/dist/jquery.min.js" defer></script>
  <script src="/skins/node_modules/highlight/highlight.pack.min.js" defer></script>
  <script src="/skins/js/script.min.js?v=<?=$vF?>" defer></script>
</head>
<body>

<header>
  <a href="/" title="Готові рішення"><img src="/skins/img/logo.jpg"></a>
  <div class="clock-block">
    <div class="minute"><img src="/skins/img/clock/minute.png"></div>
    <div class="hour"><img src="/skins/img/clock/hour.png"></div>
    <div class="sekond"><img src="/skins/img/clock/sek.png"></div>
  </div>
  <div class="two-block-header">
    <div class="digital-watch"></div>
    <div class="clear-local-sorage">Очистити сховище</div>
  </div>
</header>

<main><?=$content?></main>

<footer>Всі права захищені<br> &copy; <?=(date("Y") == '2017'? '2017' : '2017 - '.date("Y"))?></footer>

</body>
</html>