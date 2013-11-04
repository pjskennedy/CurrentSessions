class CurrentSessions.Views.AdminSessionsIndex extends Backbone.View

  el: "#admin-sessions-index"

  events:
    "click #update-ordering-button" : "newOrdering"

  initialize: () ->
    $( "#admin-sessions-container" ).sortable({
      revert: true,
      handle: "i.fa.fa-align-justify"
      update: () -> 
        $("#admin-sessions-container").css("background-color", "#e0e0e0")
        $("#update-ordering").removeClass("hidden")
    });

  newOrdering: (event) ->
    $.ajax(
      url: "/admins/videos/ordering",
      type: "PUT",
      data: {ordering: _.map($( "#admin-sessions-container li" ), (d) -> $(d).data("id"))},
      success: () ->
        $("#admin-sessions-container").css("background-color", "transparent")
        $("#update-ordering").addClass("hidden")
      error: () -> 
        alert "Something went wrong, contact web developer!"
      )

