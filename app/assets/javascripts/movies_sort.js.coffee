dragEnd = ->
  console.log $(@).parent().children()

$ ->
  $('ul.movies').dragsort
    dragEnd: dragEnd
    dragSelectorExclude: 'button, a'
