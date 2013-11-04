class CurrentSessions.Views.AdminTypeahead extends Backbone.View

  typeaheadTemplate: JST["admins/typeahead"]

  events:
    "typeahead:selected #sessions-search" : "sessionSelected"

  initialize: (attrs) ->
    @el = attrs.el
    $("#sessions-search").typeahead(
      valueKey: "title"
      name: 'Sessions'   
      limit: 10
      remote: '/admins/videos?query=%QUERY'
      template: @typeaheadTemplate
      engine: JST
    )
    $('.tt-hint').addClass('form-control');


  sessionSelected: (event, data) =>
    window.location.href = "/admins/videos/#{data.id}"

