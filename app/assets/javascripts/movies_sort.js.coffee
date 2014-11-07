dragEnd = ->
  movies = $(@).parent().children()
  array = $.map movies, (movie) ->
    $(movie).data('id')
  console.log array

$ ->
  $('ul.movies').dragsort
    dragEnd: dragEnd
    dragSelectorExclude: 'button, a'
