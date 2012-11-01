class CurrentSessions.Views.Container extends Backbone.View

  template: JST['container']

  events:
    'click .navigation-cell' : 'navigateNewPage'

  # backbone functions

  initialize: =>
    @main_page       = new CurrentSessions.Views.Main()
    @production_page = new CurrentSessions.Views.Production()
    @contact_page    = new CurrentSessions.Views.Contact()
    @current_page    = undefined

  render: () ->
    $(@el).html(@template())
    this

  # - - - - - - -

  navigateNewPage: (event) =>
    event.preventDefault()
    new_page = $(event.currentTarget).data('page')
    console.log  new_page
    switch new_page
      when "sessions"   then @renderSessions()
      when "production" then @renderProduction()
      when "contact"    then @renderContact()

  renderNewPage: (page) ->
    $('.heading-image').children().attr('src', "../assets/current-sessions-logo.png") if @current_page == 'production'
    $("#container").fadeOut( 200, () => 
      $("#container").html(page.render().el).fadeIn(200)
    )

  renderSessions: ->
    if @current_page != 'sessions'
      @renderNewPage @main_page
      @current_page = 'sessions'
      Backbone.history.navigate("", false)

  renderProduction: ->
    if @current_page != 'production'
      $('.heading-image').children().attr('src', "../assets/current-sessions-productions-logo.png")
      @renderNewPage @production_page
      @current_page  = "production"
      Backbone.history.navigate("production", false)

  renderContact: ->
    if @current_page != 'contact'
      @renderNewPage @contact_page
      @current_page  = "contact"
      Backbone.history.navigate("contact", false)
