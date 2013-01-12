class CurrentSessions.Views.Player extends Backbone.View

  template: JST["sessions/player"]

  events: 
    'click .session-player-image':'carouselPlayer'
    'click #return-to-sessions'  :'exitPlayer'

  carouselPlayer: (event) ->
    number = $(event.currentTarget).data('number')
    $("#playerCarousel").carousel(number)

  exitPlayer: (event) ->
    Backbone.history.navigate("", true )

  render: (model) ->

    $("#blackout").addClass("blackout-active")
    $("#blackout").animate( 
      {
        opacity: 0.9
      }, 1000
    )

    @model = _.first(model.models)
    $(@el).html(@template(model: @model))
    $("#playerCarousel").carousel('pause')

    this
