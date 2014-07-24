
$(document).ready(function() {
	$(".edit-button").hide();
    $(".edit_character_div").hide();
	$(".background").css({"-webkit-filter": "blur(0px)",
    "-moz-filter": "blur(0px)",
    "-o-filter": "blur(0px)",
    "-ms-filter": "blur(0px)",
    "filter" : "blur(0px)"});

})

$(document).keydown(function(e){
    if (e.keyCode == 27) { 
       cancelNewCharacter();
    }
});

function editToggle(){
    $(".show_character_div").toggle();
    $(".edit_character_div").toggle();
    $(".edit-button").toggle();
    if ($('.edit-topbar').text() == 'Edit'){
        $('.edit-topbar').text('View')
    } else {
        $('.edit-topbar').text('Edit')
    }
}

function cancelNewCharacter(){
	$(".new_character").html('');
	$(".background").css({"-webkit-filter": "blur(0px)",
    "-moz-filter": "blur(0px)",
    "-o-filter": "blur(0px)",
    "-ms-filter": "blur(0px)",
    "filter" : "blur(0px)"});
}