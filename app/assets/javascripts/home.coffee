# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.ip').click ->
    $(this).parents('.failovers').find('.addresses').toggle()

  $('.addresses .label-warning').each ->
    $(this).parents('.failovers').find('.addresses').show()
