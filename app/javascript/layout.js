class Layout {
    static init() {
        addEventListener ("DOMContentLoaded", () => {
            this.setPageTitle();
            this.initAlertDismiss();
        });
    }

    static setPageTitle() {
        let pageTitle = document.querySelector(".page-title");
        if (pageTitle.textContent) {
            document.title = `${pageTitle.textContent} - ${document.title}`;
        }
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