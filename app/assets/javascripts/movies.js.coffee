# clear error

clearAlert = () ->
  $('#lookup-alert').remove()

# async vimeo videos load

appendVideos = (v) ->
  videos = $('#videos')
  for video in v
    a = $('<a href="#"></a>').
      html(video.title).
      attr('data-id', video.id).
      attr('data-thumbnail', video.thumbnail_small).
      popover
        html: true
        placement: 'bottom'
        trigger: 'hover'
        content: "<img src=\"#{video.thumbnail_small}\">"
        delay: 200
    li = $('<li></li>').html a
    videos.append li

videosLoaded = (v1, v2, v3) ->
  $('#videos').html('')
  appendVideos v1[0]
  appendVideos v2[0]
  appendVideos v3[0]

videosLoadError = ->
  $('#videos li').html 'Ошибка получения списка фильмов с Vimeo.
    <div style="margin-bottom:5px;"><button>Попробовать еще раз</button></div>'

loadVideos = ->
  url = 'http://vimeo.com/api/v2/skymemories/videos.json?page='
  params =
    dataType: 'jsonp'
    crossDomain: true
    timeout: 3000
  params.url = url + '1'
  req1 = $.ajax params
  params.url = url + '2'
  req2 = $.ajax params
  params.url = url + '3'
  req3 = $.ajax params
  $.when(req1, req2, req3).then(videosLoaded, videosLoadError)

$ ->
  $('#videos').on 'click', 'button', (e) -> loadVideos()  
  loadVideos()

# video selecting

$ ->
  $('#videos').on 'click', 'a', (e) ->
    e.preventDefault()
    clearAlert()
    a = $(@)
    $('#movie_vimeo_id').val a.attr('data-id')
    $('#movie_title').val a.text()
    $('#movie_thumbnail').val a.attr('data-thumbnail')
    $('#img_for_movie_thumbnail').attr 'src', a.attr('data-thumbnail')

# video filtering

$ ->
  $('#video-search').on 'input', (e) ->
    filter = $(@).val().toLowerCase()
    for a in $('#videos a')
      a = $(a)
      if a.text().toLowerCase().indexOf(filter) == -1
        a.parent().hide()
      else
        a.parent().show()

# lookup handler

lookupSuccess = (data) ->
  $('#movie_title').val data[0].title
  $('#movie_thumbnail').val data[0].thumbnail_small
  $('#img_for_movie_thumbnail').attr 'src', data[0].thumbnail_small

lookupError = (xhr, type, e) ->
  button = $('<button></button>').
    addClass('close').
    attr('type','button').
    attr('data-dismiss','alert').
    attr('aria-hidden','true').
    html('&times;')
  alert = $('<div></div>').
    addClass('alert alert-warning').
    attr('id','lookup-alert').
    html(button).
    append('Не удалось получить информацию о фильме.')
  $('form').prepend alert
  $('#movie_title').val ''
  $('#movie_thumbnail').val ''
  $('#img_for_movie_thumbnail').attr 'src', ''

$ ->
  $('#lookup').on 'click', (e) ->
    e.preventDefault()
    clearAlert()
    $(@).button('loading')
    vimeo_id = $('#movie_vimeo_id').val()
    url = "http://vimeo.com/api/v2/video/#{vimeo_id}.json"
    $.ajax
      url: url
      dataType: 'jsonp'
      crossDomain: true
      timeout: 2000
      success: lookupSuccess
      error: lookupError
      complete: => $(@).button('reset')
