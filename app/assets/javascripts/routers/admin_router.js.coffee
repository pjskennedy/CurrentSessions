class CurrentSessions.Routers.Admin extends Backbone.Router
  routes:
    'admin'           : 'adminSessions'
    'admin/'          : 'adminSessions'
    'admin/admins'    : 'adminsPage'
    'admin/admins/'   : 'adminsPage'

  events:
    'click .admin-navigation-item' : 'navigate'


  authenticateRender: (page) =>
    @admin_container = new CurrentSessions.Views.AdminContainer()
    @locked_out      = new CurrentSessions.Views.AdminLockedOut()
    @user            = new CurrentSessions.Models.Admin()
    @user.fetch( 
      success: () => (@renderPage(page))
      )

  renderPage: (page) =>
    if @user.models[0] and @user.models[0].attributes.approved
      $("#admin-container").html(@admin_container.render().el)
      $("#admin-body").html(page.render().el) if page != null

    else
      Backbone.history.navigate("/admin/locked", false)
      $("#admin-container").html(@locked_out.render().el)

  navigate: (event) =>  
    event.preventDefault()
    console.log $(event.currentTarget)

  adminLandingPage: =>
    @main_page = new CurrentSessions.Views.AdminMain()
    @authenticateRender(null)

  adminSessions: =>
    page = new CurrentSessions.Views.AdminSessions()
    @authenticateRender(page)

  adminsPage: => 
    page = new CurrentSessions.Views.Admins()
    @authenticateRender(page)
      