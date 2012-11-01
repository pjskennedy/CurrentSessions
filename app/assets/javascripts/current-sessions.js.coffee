# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.CurrentSessions =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new CurrentSessions.Routers.Admin()
    new CurrentSessions.Routers.MainRouter()
    Backbone.history.start({pushState: true})
    
$(document).ready ->
  CurrentSessions.init()
