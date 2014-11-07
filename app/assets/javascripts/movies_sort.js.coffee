dragEnd = ->
  movies = $(@).parent().children()
  array = $.map movies, (movie) ->
    $(movie).data('id')
  $.post 'movies/order', { order: array }

$ ->
  $('ul.movies').dragsort
    dragEnd: dragEnd
    dragSelectorExclude: 'button, a'
