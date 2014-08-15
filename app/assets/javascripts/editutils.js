
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
//random integer between [lo,high]
function randInt(hi, lo){
    return Math.floor((Math.random() * (hi-lo)) + 0.999) + lo;
}

function assignRandomByShuffle(new_fields){
    var shuffleDistribution = [16, 14, 13, 12, 11, 10];
    if (new_fields){
        var fieldIds = ["#new_strength", "#new_dexterity", "#new_constitution", "#new_intelligence", "#new_wisdom", "#new_charisma"];
    } else {
        var fieldIds = ["#strength", "#dexterity", "#constitution", "#intelligence", "#wisdom", "#charisma"];
    }
    for (var i = 0; i < 6; i++){
        var rand = randInt(0, fieldIds.length - 1);

        $(fieldIds[rand]).val(shuffleDistribution[i]);
        fieldIds.splice(rand, 1);
    }
    if (new_fields){    
        $("#new_health").val(randInt(8, 14) + parseInt($("#new_constitution").val()));
    } else {
        $("#health").val(randInt(8, 14) + parseInt($("#constitution").val()));
    }
}

function assignRandomByDice(new_fields){
    if (new_fields){
        var fieldIds = ["#new_strength", "#new_dexterity", "#new_constitution", "#new_intelligence", "#new_wisdom", "#new_charisma"];
    } else {
        var fieldIds = ["#strength", "#dexterity", "#constitution", "#intelligence", "#wisdom", "#charisma"];
    }    
    var rands = [];
    for (var i=0; i < 6; i++){
        rands = [randInt(1, 6), randInt(1, 6), randInt(0, 6), randInt(0, 6)];
        rands.splice(rands.indexOf(Math.min.apply(Math, rands)), 1);
        $(fieldIds[i]).val(rands.reduce(function(prev, cur){ return prev + cur;}));
    }
    if (new_fields){    
        $("#new_health").val(randInt(8, 14) + parseInt($("#new_constitution").val()));
    } else {
        $("#health").val(randInt(8, 14) + parseInt($("#constitution").val()));
    }
}


