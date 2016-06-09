/**
 * Created by Pratik on 4/8/2016.
 */
// .modal-backdrop classes

$(".modal-transparent").on('show.bs.modal', function () {
    setTimeout( function() {
        $(".modal-backdrop").addClass("modal-backdrop-transparent");
    }, 0);
});
$(".modal-transparent").on('hidden.bs.modal', function () {
    $(".modal-backdrop").addClass("modal-backdrop-transparent");
});

$(".modal-fullscreen").on('show.bs.modal', function () {
    setTimeout( function() {
        $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
    }, 0);
});
$(".modal-fullscreen").on('hidden.bs.modal', function () {
    $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
});

$(function(){
// this will get the full URL at the address bar
    var url = window.location.href;

// passes on every "a" tag
    $("nav a").each(function() {
// checks if its the same on the address bar
        if(url == (this.href)) {
            $(this).closest("li").addClass("active");
        }
    });
});