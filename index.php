<?php
$vF = time().'-'.rand(1, 99);

function hc($text) {
    return htmlspecialchars($text);
}

ob_start();

include('./modules/view/main.tpl');

$content = ob_get_clean();

include('./index.tpl');