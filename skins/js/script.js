$(document).ready(function() {
    // Clock and time
    displayTime();
    startClock();

    // Remove old LocalStorage
    if (window.localStorage && localStorage.length > 0) {
        removeLocalStorage();
    }

    // Remove all LocalStorage Navigation
    $('.clear-local-sorage').click(function(){
        localStorage.removeItem('navigation');
    });

    // Active Navigation
    var nav = localStorage.getItem('navigation');
    if (nav) {
        var obj = JSON.parse(nav).value,
            el;

        for (var prop in obj) {
            if (!obj.hasOwnProperty(prop)) {
                continue;
            }

            el = $('section[data-section="' + prop + '"] nav li:nth-of-type(' + obj[prop] + ')');
            el.addClass('active');

            $('section[data-section="' + prop + '"] code[data-type="' + el.text().toLowerCase() + '"]').addClass('active');
        }
    }

    // Navigation
    $('nav li').click(function() {
        var type       = $(this).text().toLowerCase(),
            numSection = $(this).parents('section').attr('data-section'),
            parent     = $('section[data-section="' + numSection + '"]');

        $(this).siblings('.active').removeAttr('class');
        $(this).addClass('active');

        $(parent).find('code:not([data-type="' + type + '"])').removeClass('active');
        $(parent).find('code[data-type="' + type + '"]').addClass('active');

        setLocalStorageNav(numSection, $(this).index() + 1);
    });

    // Highlight code
    $('code[data-type]').each(function(i, block) {
        hljs.highlightBlock(block);
    });
});

function setLocalStorageNav(k, item) {
    var value  = localStorage.getItem('navigation'),
        object = (value? JSON.parse(value) : {
                value      : {},
                timestamp  : new Date().getTime(),
                setTimeSec : 30 * 60 * 1000
            });

    object.value[k] = item;
    object          = JSON.stringify(object);

    localStorage.setItem("navigation", object);
}

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
