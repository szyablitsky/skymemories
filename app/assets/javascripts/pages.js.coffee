pauseVideo = ($slideElement, oldIndex, newIndex) ->
  iframe = $('#vimeo'+oldIndex)[0]
  player = Froogaloop(iframe)
  player.api('pause')

$ ->
  $('#vimeo').fitVids()

  $('#movie-list').on 'click', '.vimeo', (e) ->
    small_id = 1 

