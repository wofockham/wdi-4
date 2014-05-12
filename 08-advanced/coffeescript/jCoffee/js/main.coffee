$(document).ready ->
  console.log 'document ready'
  console.log 'live compiling'

  $(window).mousemove (event) ->
    console.log event.pageX, event.pageY

  $('p').on 'click', ->
    $(@).css('font-style', 'italic')
    $('img').fadeToggle()

