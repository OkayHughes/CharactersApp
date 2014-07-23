$(document).ready(function() {
	$(".edit-button").hide();
	$(".background").css({"-webkit-filter": "blur(0px)",
    "-moz-filter": "blur(0px)",
    "-o-filter": "blur(0px)",
    "-ms-filter": "blur(0px)",
    "filter" : "blur(0px)"});
})

function editToggle(){
	$(".edit-button").toggle();

}

function cancelNewCharacter(){
	$(".new_character").html('');
	$(".background").css({"-webkit-filter": "blur(0px)",
    "-moz-filter": "blur(0px)",
    "-o-filter": "blur(0px)",
    "-ms-filter": "blur(0px)",
    "filter" : "blur(0px)"});
}