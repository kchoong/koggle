const DynamicTime = {
    loop: function () {
        let dateDivs = document.querySelectorAll('.date[data-date]');
        for (let div of dateDivs) {
            let rawDate = div.dataset.date;
            let date = new Date(rawDate);
            let secs = ((new Date()) - date) / 1000;
            let strDate;
            if (secs < 60) {
                strDate = Math.round(secs) + "s";
            } else if (secs < 60 * 60) {
                strDate = Math.round(secs / 60) + "mins";
            } else {
                strDate = rawDate;
            }
            div.innerHTML = strDate;
        }
        window.setTimeout(DynamicTime.loop, 5000);
    },
    init: function () {
        addEventListener('DOMContentLoaded', () => {
            DynamicTime.loop();
        })
    }
}

export {DynamicTime};