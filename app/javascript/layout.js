class Layout {
    static init() {
        addEventListener ("DOMContentLoaded", () => {
            this.initAlertDismiss();
        });
    }

    static initAlertDismiss() {
        let successes = document.querySelectorAll(".alert-success");
        successes.forEach((success) => {
            setTimeout(function() {
                // success.close();
            }, 2000);
        });
    }
}

export {Layout}