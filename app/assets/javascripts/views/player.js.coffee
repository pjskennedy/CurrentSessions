class CurrentSessions.Views.Player extends Backbone.View

# Note:
#
#   The Description passed in the model is an HTML object. 
#   The only way I could get this to display as HTML, and not a string
#   is by adding it to the DOM in the router. I know this is bad code.
#   Whoever you are, I am sorry.
# 

  template: JST["sessions/player"]

  events: 
    'click .session-player-image' : 'carouselPlayer'
    'click .return-to-sessions'   : 'exitPlayer'
    'keypress document' : 'exitPlayer'

  initialize: ->
    $(document).keyup((event) -> (
      console.log event.keyCode
      switch (event.keyCode)
        when 27 then Backbone.history.navigate("", true )
        when 37 then $("#playerCarousel").carousel('prev')
        when 39 then $("#playerCarousel").carousel('next')

    ))

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
    $("#playerCarousel").carousel({interval: false})

    this

    