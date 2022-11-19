document.addEventListener ("DOMContentLoaded", () => {
    let pageTitle = document.querySelector(".page-title");
    if (pageTitle.textContent) {
        document.title = `${pageTitle.textContent} - ${document.title}`;
    }
});