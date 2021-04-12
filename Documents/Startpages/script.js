document.addEventListener("keypress", function(e) {
    switch (e.key) {
        case "Enter":
            submit();
            break;
        default:
            document.getElementsByTagName('input')[0].focus()
            break;
    }
});

function submit() {
    var typed = document.getElementsByTagName('input')[0].value;
    var browseIn = typed.split(' ');
    switch (browseIn[0]) {
        case "d":
            typed = typed.substr(0,0) + typed.substr(1+1);
            window.location = "https://duckduckgo.com/?q=" + typed;
            break;
        case "g":
            typed = typed.substr(0,0) + typed.substr(1+1);
            window.location = "https://www.google.com/search?q=" + typed;
            break;
        case "y":
            typed = typed.substr(0,0) + typed.substr(1+1);
            window.location = "https://www.youtube.com/results?search_query=" + typed;
            break;
        case "r":
            typed = typed.substr(0,0) + typed.substr(1+1);
            window.location = "https://www.youtube.com/results?search_query=" + typed;
            break;
        case "w":
            typed = typed.substr(0,0) + typed.substr(1+1);
            window.location = "https://" + typed;
            break;
        default:
            window.location = "https://duckduckgo.com/?q=" + typed;
    }
}
