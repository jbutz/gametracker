// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var setupGameRoleDeleteButtons = function() {
        var $buttons = $("#game_roles_list").find("button[data-action='delete']");
        $buttons.off("click");
        $buttons.click(function(){
                $inputGroup = $(this).parentsUntil('div.input-group').parent();
                $inputGroup.find(":input[type='hidden'][name*=”_destroy”]").val("true");
                $inputGroup.hide();
        });
}

$(document).ready(function(){
        $("#games_form_add_game_role").click(function(e){
                var uniqueId = new Date().valueOf();
                $("<div>").addClass("input-group")
                        .append($("<input type='text'>")
                                .addClass("form-control")
                                .attr("name","game[game_roles_attributes]["+uniqueId +"][name]")
                                .attr("id",uniqueId))
                        .append($("<span>")
                                .addClass("input-group-btn")
                                .append($("<button>").addClass("btn btn-danger").attr("type","button")
                                        .append($("<span>").addClass("glyphicon glyphicon-remove"))))
                        .appendTo("#game_roles_list");
                setupGameRoleDeleteButtons();
        });
        
        setupGameRoleDeleteButtons()
});