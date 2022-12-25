class Calendar {
    static init() {
        const currentDate = new Date();
        Calendar.update(currentDate.getMonth() + 1, currentDate.getFullYear());
    }

    static update(month, year) {
        fetch('/dashboard/calendar?' + new URLSearchParams({
            month: month,
            year: year,
        }))
            .then((data) => data.text())
            .then((data) => {
                let container = document.querySelector("#calendarWidget");
                container.innerHTML = data;
            });
    }
}

addEventListener('DOMContentLoaded', () => {
    Calendar.init();
})

export {Calendar}