
$(document).ready(function() {
	$(".edit-button").hide();
    $(".edit_character_div").hide();
    $(".background").css("opacity", "1");
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
        $("#new-tag-list").hide();
    } else {
        $('.edit-topbar').text('Edit')
    }
}

function cancelNewCharacter(){
	$(".new_character").html('');
    $(".background").css("opacity", "1");
}

function toggleNewSigmas(){
    $("#new_sigmas").toggle();
}
function toggleSigmas(){
    $("#sigmas").toggle();
}


