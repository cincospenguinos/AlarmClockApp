# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
UnobtrusiveFlash.flashOptions['timeout'] = 3000;

setup = () ->
  console.log('Setup AJAX here!')

$(document).ready(setup);