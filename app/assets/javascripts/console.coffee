# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'click', '.repo-count a', ->
  $(".repo-count").hide()
  $(".repo-count-loading").show()
  $.getScript @href
  false

$(document).on 'click', '.list-group a.list-group-item', ->
  $(".repo-branches").hide()
  $(".repo-branch-loading").show()
  $(".repo-pull-requests").hide()
  $(".repo-pull-request-loading").show()
  $.getScript @href
  false


