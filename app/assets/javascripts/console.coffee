# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.repo-count a', ->
  $(".repo-count").hide()
  $(".repo-list").hide()
  $(".repo-count-loading").show()
  $(".repo-list-loading").show()
  $.getScript @href
  false

$(document).on 'click', '.project-count a', ->
  $(".project-count").hide()
  $(".project-list").hide()
  $(".project-count-loading").show()
  $(".project-list-loading").show()
  $.getScript @href
  false

$(document).on 'click', '.repo-branches a', ->
  $(".individual-info-panel").hide()
  $(".info-individual-loading").show()
  $.getScript @href
  false

$(document).on 'click', '.repo-pull-requests a', ->
  $(".individual-info-panel").hide()
  $(".info-individual-loading").show()
  $.getScript @href
  false

$(document).on 'click', '.list-group a.list-group-item', ->
  $(".repo-branches").hide()
  $(".current-repo").hide()
  $(".repo-pull-requests").hide()
  $(".repo-branch-loading").show()
  $(".repo-pull-request-loading").show()
  $(".current-repo-loading").show()
  $.getScript @href
  false

$(document).on 'click', '.list-group.project-list a.list-group-item.project-list', ->
  $(".project-stories").hide()
  $(".current-project").hide()
  $(".project-story-loading").show()
  $(".current-project-loading").show()
  $.getScript @href
  false

$(document).on 'click', '.project-stories a', ->
  $(".story-info-panel").hide()
  $(".info-story-loading").show()
  $.getScript @href
  false

$(document).on 'click', '[data-toggle=offcanvas]', ->
  $(this).toggleClass 'visible-xs text-center'
  $(this).find('i').toggleClass 'glyphicon-chevron-right glyphicon-chevron-left'
  $('.row-offcanvas').toggleClass 'active'
  $('#lg-menu').toggleClass('hidden-xs').toggleClass 'visible-xs'
  $('#xs-menu').toggleClass('visible-xs').toggleClass 'hidden-xs'
  $('#btnShow').toggle()
  return
