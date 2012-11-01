class CurrentSessions.Routers.MainRouter extends Backbone.Router
  routes:
    ''            : 'landingPage'
    '/'           : 'landingPage'
    'production'  : 'productionsPage'
    'production/' : 'productionsPage'
    'contact'     : 'contactPage'
    'contact/'    : 'contactPage'
    'home/index'  : 'redirectToBlank'

  initialize: =>
    @main_page       = new CurrentSessions.Views.Main()
    @production_page = new CurrentSessions.Views.Production()
    @contact_page    = new CurrentSessions.Views.Contact()
    @container_page  = new CurrentSessions.Views.Container()
    this

  renderMain: =>
    $("#main-container").html(@container_page.render().el)

  contactPage: =>
    @renderMain()
    @container_page.renderContact()

  landingPage: =>
    @renderMain()
    @container_page.renderSessions()

  productionsPage: =>
    @renderMain()
    @container_page.renderProduction()

  redirectToBlank: =>
    Backbone.history.navigate("", false)
    @landingPage()
  