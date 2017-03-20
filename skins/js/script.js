$(document).ready(function() {
    // Clock and time
    displayTime();
    startClock();

    //
    $('nav li').click(function() {
        var suffix = $(this).text().toLowerCase();

        $(this).siblings('.active').removeClass('active');
        $(this).addClass('active');
        $('code:not([data-type="' + suffix + '"])').removeClass('active');
        $('code[data-type="' + suffix + '"]').addClass('active');
    });

    // Highlight code
    $('code').each(function(i, block) {
        hljs.highlightBlock(block);
    });
});

function startClock() {
    var time    = new Date(),
        hour    = time.getHours(),
        min     = time.getMinutes(),
        sec     = time.getSeconds(),
        bHour   = $('.hour'),
        bMin    = $('.minute'),
        bSec    = $('.sekond'),
        hRotate = (hour > 12? (hour - 12) * 30 : hour * 30) + min / 2,
        mRotate = min * 6,
        sRotate = sec * 6;

    bHour.css('transform', 'rotate(' + hRotate + 'deg)');
    bMin.css('transform', 'rotate(' + mRotate + 'deg)');
    bSec.css('transform', 'rotate(' + sRotate + 'deg)');

    setTimeout(startClock, 1000);
}

function displayTime() {
    var currentTime = new Date();
    var hours       = chekTime(currentTime.getHours());
    var minutes     = chekTime(currentTime.getMinutes());
    var seconds     = chekTime(currentTime.getSeconds());

    $('.digital-watch').html(hours + ':' + minutes + ':' + seconds);

    setTimeout(function() {
        displayTime();
    }, 1000);
}

function chekTime(n) {
    return (n < 10? '0' + n : n);
}
