// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var setupPlayerDeleteButtons = function() {
        var $buttons = $('#player-role-list').find("button[data-action='delete']");
        $buttons.off("click");
        $buttons.click(function(){
                $formGroup = $(this).parentsUntil('div.form-group').parent();
                $formGroup.find(":input[type='hidden'][name*=”_destroy”]").val("true");
                $formGroup.hide();
        });
}

$(document).ready(function(){
	var $playerRoleList = $('#player-role-list');
	var gameRoles = [];
	
	$('#player-role-add').click(function(){
		var uniqueId = new Date().valueOf();
		var $playerRole = $($("#player-role-template").html());
		
		$.each(gameRoles, function(i,role){
			$playerRole.find('select[name="game_play[game_play_roles_attributes][0][game_role_id]"]')
				.append($("<option>")
					.attr("value", role.id)
					.text(role.name));
		});
		
		$.each(window.userList, function(i,user){
			$playerRole.find('select[name="game_play[game_play_roles_attributes][0][user_id]"]')
				.append($("<option>")
					.attr("value", user.id)
					.text(user.name))
		});
		
		$playerRole.find('select[name="game_play[game_play_roles_attributes][0][game_role_id]"]')
			.attr({
				"name": "game_play[game_play_roles_attributes]["+uniqueId+"][game_role_id]",
				"id": uniqueId+"_game_role_id"
			});
		$playerRole.find('select[name="game_play[game_play_roles_attributes][0][user_id]"]')
			.attr({
				"name": "game_play[game_play_roles_attributes]["+uniqueId+"][user_id]",
				"id": uniqueId+"_user_id"
			});
		$playerRole.find('input[name="game_play[game_play_roles_attributes][0][name]"]')
			.attr({
				"name": "game_play[game_play_roles_attributes]["+uniqueId+"][name]",
				"id": uniqueId+"_name"
			});
		$playerRole.find('input[name="game_play[game_play_roles_attributes][0][_destroy]"]')
			.attr({
				"name": "game_play[game_play_roles_attributes]["+uniqueId+"][_destroy]",
				"id": uniqueId+"__destroy"
			});
		
		$playerRole.find('input[name="game_play[game_play_roles_attributes][0][won]"]')
			.attr({
				"name": "game_play[game_play_roles_attributes]["+uniqueId+"][won]",
				"id": uniqueId+"_won"
			});
		
		$playerRole.appendTo($playerRoleList);
		$playerRole.find(":checkbox").bootstrapToggle();
		setupPlayerDeleteButtons();
	});
	
	$("#game_play_game_id").blur(function(){
		$.getJSON("/game_roles.json",{game_id: $(this).val()},function(data){
			gameRoles = data;
			$('#player-role-add').prop("disabled", false);
		});
	});
	
	if($("#game_play_game_id").val() === "") {
		$('#player-role-add').prop("disabled", true);
	} else {
		$("#game_play_game_id").blur();
	}
	setupPlayerDeleteButtons();
});