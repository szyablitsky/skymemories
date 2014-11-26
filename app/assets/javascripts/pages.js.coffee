$ ->
  $('#vimeo').fitVids()

  $('#movie-list').on 'click', '.vimeo', (e) ->
    player = $('#vimeo')
    player_video_id = player.data('video-id')
    player_thumbnail_id = player.data('thumbnail-id')
    player_title = player.find('h1').text()
    player_description = player.find('p').text()
    testimonials = $('#testimonials ul')
    player_testimonials = testimonials.html()

    link = $(this)
    link_video_id = link.data('video-id')
    link_thumbnail_id = link.data('thumbnail-id')
    link_title = link.find('h1').text()
    link_description = link.children('p').text()
    link_testimonials = link.find('ul').html()

    url = '//player.vimeo.com/video/' + link_video_id +
      '?title=0&amp;amp;byline=0&amp;amp;portrait=0'
    player.find('iframe').attr('src', url)
    player.data('video-id', link_video_id)
    player.data('thumbnail-id', link_thumbnail_id)
    player.find('h1').text(link_title)
    player.find('p').text(link_description)
    testimonials.html(link_testimonials)
    if link.find('ul').children().size() > 0
      $('#testimonials').removeClass('hidden')
    else
      $('#testimonials').addClass('hidden')
    location.href = "#vimeo"

    thumbnail = 'http://i.vimeocdn.com/video/' +
      player_thumbnail_id + '_360x203.jpg'
    link.find('img').attr('src',thumbnail)
    link.data('video-id', player_video_id)
    link.data('thumbnail-id', player_thumbnail_id)
    link.find('h1').text(player_title)
    link.find('p').text(player_description)
    link.find('ul').html(player_testimonials)
