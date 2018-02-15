/***
	* Display a toast message
	* text 	- the message to display
	* duration - display duration
	*/
$.Toast = function (text, duration, cb) {
    var defDuration = (typeof duration === 'undefined'
                        || duration === 'normal' ? 2000 : duration),
        doc = $('body'),
        exToast = $('.sToast'),
        toast = $('<div class="sToast load"></div>');

    toast.text(text).appendTo(doc);
    setTimeout(function () {
        toast.removeClass('load')

        if (exToast.length > 0) {
            clearTimeout(to);
            $(exToast).addClass('load');
            setTimeout(function () {
                $(exToast).remove();
                if(cb) cb();
            }, 300);
        }

        to = setTimeout(function () {
            toast.addClass('load');
            setTimeout(function () {
                toast.remove();
                if(cb) cb();
            }, 300);
        }, defDuration);

    }, 0);
}

/* Toast with undo button */
$.ToastUndo = function (text, duration, onUndo, cb) {
    var defDuration = (typeof duration === 'undefined'
                        || duration === 'normal' ? 2500 : duration),
        doc = $('body'),
        exToast = $('.sToast'),
        toast = $('<div class="sToast plus load"></div>'),
        undo = $('<span class="action">UNDO</span>');

    undo.click(function () {
        if (onUndo) onUndo();
        clearTimeout(to);
        toast.addClass('load');
        setTimeout(function () {
            toast.remove();
            //if (cb) cb();
        }, 300);
    });
    toast.text(text).append(undo).appendTo(doc);
    setTimeout(function () {
        toast.removeClass('load')

        if (exToast.length > 0) {
            clearTimeout(to);
            $(exToast).addClass('load');
            setTimeout(function () {
                $(exToast).remove();
                if (cb) cb();
            }, 300);
        }

        to = setTimeout(function () {
            toast.addClass('load');
            setTimeout(function () {
                toast.remove();
                if (cb) cb();
            }, 300);
        }, defDuration);

    }, 0);
}