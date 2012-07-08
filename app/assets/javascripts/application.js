//= require jquery
//= require jquery-ui
//= require jquery_ujs

$(document).ready(function(){
    $(".bbcode-spoiler-div").hide();

    $(".bbcode-spoiler-legend").click(function(){
       $(this).parent().children(".bbcode-spoiler-div").slideToggle("normal");
    });

    $("#ocultador").click(function(){
        $("#izquierda").children().animate({height:'toggle'},1000);
        if ($(this).text() == "Mostrar barra lateral"){
            $(this).text("Ocultar barra lateral");
        }
        else{
            $(this).text("Mostrar barra lateral");
        };
    });

    $("#youtube").click(function(){
        var imageLoc = prompt('Ingrese la dirección del video:');
        if ( imageLoc ) {
            $(".nicEdit-main").append("[youtube]"+imageLoc+"[/youtube]");
        }
        return false;
    });
    $("#imagen").click(function(){
        var imageLoc = prompt('Ingrese la dirección de la imágen:');
        if ( imageLoc ) {
            $(".nicEdit-main").append("[img]"+imageLoc+"[/img]");
        }
        return false;
    });
    $("#url").click(function(){
        var imageLoc = prompt('Ingrese la dirección:');
        if ( imageLoc ) {
            $(".nicEdit-main").append("[url="+imageLoc+"]Link[/url]");
        }
        return false;
    });
    $("#centrar").click(function(){
        $(".nicEdit-main").append("[center][/center]");
    });
    $("#spoiler").click(function(){
        $(".nicEdit-main").append("[spoiler][/spoiler]");
    });

});
function verificarResolucion(){
   if (screen.width>1400)
        switch_style('big')
}

function insertAtCaret(areaId,text) {
    var txtarea = document.getElementById(areaId);
    var scrollPos = txtarea.scrollTop;
    var strPos = 0;
    var br = ((txtarea.selectionStart || txtarea.selectionStart == '0') ?
        "ff" : (document.selection ? "ie" : false ) );
    if (br == "ie") {
        txtarea.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -txtarea.value.length);
        strPos = range.text.length;
    }
    else if (br == "ff") strPos = txtarea.selectionStart;

    var front = (txtarea.value).substring(0,strPos);
    var back = (txtarea.value).substring(strPos,txtarea.value.length);
    txtarea.value=front+text+back;
    strPos = strPos + text.length;
    if (br == "ie") {
        txtarea.focus();
        var range = document.selection.createRange();
        range.moveStart ('character', -txtarea.value.length);
        range.moveStart ('character', strPos);
        range.moveEnd ('character', 0);
        range.select();
    }
    else if (br == "ff") {
        txtarea.selectionStart = strPos;
        txtarea.selectionEnd = strPos;
        txtarea.focus();
    }
    txtarea.scrollTop = scrollPos;
}
