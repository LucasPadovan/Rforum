$(document).ready(function(){
    $('td#left-action-toggler').click(function() {
            $("#left-action").animate( {left: parseInt($("#left-action").css("left")) == -520 ? 0 : -520 });
            $("#form").animate({ opacity:parseInt($("#form").css("opacity")) == 1 ? 0 : 1 });
        });
});