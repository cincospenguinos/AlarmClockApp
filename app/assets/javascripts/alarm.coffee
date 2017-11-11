# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# TODO: this


setup = () ->
  `$('#new_alarm_form').on('ajax:success', function(event, data, status, xhr) {
      UnobtrusiveFlash.showFlashFromCookies()
  });`

$(document).ready(setup);