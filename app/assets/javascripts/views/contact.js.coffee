class CurrentSessions.Views.Contact extends Backbone.View

  events:
    'click .submit-button' : 'sendEmail'

  template: JST["contact/email"]

  render: ->
    $(@el).html(@template(model: @model))
    this

  initialize: () ->
    @email = new CurrentSessions.Models.Email()

  sendEmail: (event) =>
    console.log 'fart'
    $('#send-email-button').attr('disabled', true)
    @email.attributes = { address: $('#sender-email').val(), body: $('#sender-body').val(), name: $('#sender-name').val()}
    if @checkFields()
      @email.save( {address: @email.attributes.address, name: @email.attributes.name, body: @email.attributes.body},{ success: @emailSent , error: @emailFailed })
    else
      @emailFailed()

  reset: () ->
    $('#send-email-button').attr('disabled', false)
    @email = new CurrentSessions.Models.Email()

  checkFields: () ->
    valid = true
    if @email.attributes.name.length == 0
      $("#sender-name").addClass("error")
      $("#sender-name").children(".help-block").html("Please enter your name!")
      valid = false
    else
      $("#sender-name").removeClass("error")
      $("#sender-name").children(".help-block").html("")
    if not @validateEmail(@email.attributes.address)
      $("#sender-email").addClass("error")
      $("#sender-email").children(".help-block").html("Please enter a valid email!")
      valid = false
    else
      $("#sender-email").removeClass("error")
      $("#sender-email").children(".help-block").html("")
    if @email.attributes.body.length == 0
      $("#sender-body").addClass("error")
      $("#sender-body").children(".help-block").html("Please enter a message!")
      valid = false
    else
      $("#sender-body").removeClass("error")
      $("#sender-body").children(".help-block").html("")
      @email.attributes.body = @email.attributes.body.replace(///\n///g, '<br />')

    @emailFailed() if not valid
    return valid

    
  validateEmail: (email) ->
    emailPattern = /// ^ #begin of line
       ([\w.-]+)         #one or more letters, numbers, _ . or -
       @                 #followed by an @ sign
       ([\w.-]+)         #then one or more letters, numbers, _ . or -
       \.                #followed by a period
       ([a-zA-Z.]{2,6})  #followed by 2 to 6 letters or periods
       $ ///i            #end of line and ignore case
    return true if email.match emailPattern
    return false


  emailSent: () =>
    $('#sender-name').val('')
    $('#sender-body').val('')
    $('#sender-email').val('')
    $('#response-control').removeClass('error')
    $('#response-control').addClass('success')
    $('#response-control').children('.response').html("Email was successfully sent!")
    @reset()

  emailFailed: () =>
    $('#response-control').removeClass('success')
    $('#response-control').addClass('error')
    $('#response-control').children('.response').html("Email was not sent!")
    @reset()



