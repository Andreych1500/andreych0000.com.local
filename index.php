<?php
$vF = time().'-'.rand(1, 99);

function hc($text, $code = 0) {
    if ($code) {
        return htmlspecialchars(preg_replace('#(\n)(\s{4})#uimU', '', $text));
    } else {
        return htmlspecialchars($text);
    }
}

ob_start();

include('./modules/view/main.tpl');

$content = ob_get_clean();

include('./index.tpl');