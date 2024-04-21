function showToast() {
    // Get the toast DIV
    let toast = document.getElementById("toast");

    // Add the "show" class to DIV
    toast.classList.add("show");

    // After 3 seconds, remove the show class from DIV
    setTimeout(function() {
        toast.classList.remove("show");
    }, 3000);
}

const hideToastDiv =()=> {
    let toast = document.getElementById("toast");
    setTimeout(function() {
        toast.outerHTML = "";
    }, 3000);
}

function showAndRemoveToast() {
    // Get the toast DIV
    let toast = document.getElementById("toast");
    console.log("It is being called");

    // Set toast to be visible
    toast.style.visibility = "visible";

    // After 3 seconds, remove the toast from the DOM
    setTimeout(function() {
        toast.parentNode.removeChild(toast);
    }, 3000);
}
