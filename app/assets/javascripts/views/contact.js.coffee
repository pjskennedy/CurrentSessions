class CurrentSessions.Views.Contact extends Backbone.View

  events:
    'submit #send-email-form' : 'sendEmail'

  template: JST["contact/email"]

  render: ->
    $(@el).html(@template(model: @model))
    this

  addErrorMessages: (msgs) =>
    console.log msgs
    _.each(_.keys(msgs), (key) =>
      _.each(msgs[key], (err) =>
        $("##{key}-space .help-block").append("<p class='text-error'>#{key} #{err}<p>")
      )
    )
    
  sendEmail: (event) =>
    event.preventDefault()
    $('#send-email-button').attr('disabled', true)
    @email = new CurrentSessions.Models.Email()
    @email.save( { address: $('#sender-email').val(), body: $('#sender-body').val(), name: $('#sender-name').val()},
      success: => 
        $(".help-block").html("")
        $('input').val('')
        $('#response-control').removeClass('error')
        $('#response-control').addClass('success')
        $('#response-control').children('.response').html("Email was successfully sent!")
        $('#send-email-button').attr('disabled', false)
      error: (email, response) =>
        $(".help-block").html("")
        @addErrorMessages(JSON.parse(response.responseText))
        $('#response-control').removeClass('success')
        $('#response-control').addClass('error')
        $('#response-control').children('.response').html("Email was not sent!")
        $('#send-email-button').attr('disabled', false)
    )




