$ ->
  $('#vimeo').fitVids()

  $('#movie-list').on 'click', '.vimeo', (e) ->
    player = $('#vimeo')
    player_video_id = player.data('video-id')
    player_thumbnail_id = player.data('thumbnail-id')
    player_title = player.find('h1').text()
    player_description = player.find('p').text()

    link = $(this)
    link_video_id = link.data('video-id')
    link_thumbnail_id = link.data('thumbnail-id')
    link_title = link.find('h1').text()
    link_description = link.find('p').text()

    url = '//player.vimeo.com/video/' + link_video_id +
      '?title=0&amp;amp;byline=0&amp;amp;portrait=0'
    player.find('iframe').attr('src', url)
    player.data('video-id', link_video_id)
    player.data('thumbnail-id', link_thumbnail_id)
    player.find('h1').text(link_title)
    player.find('p').text(link_description)
    location.href = "#vimeo"

    thumbnail = 'http://i.vimeocdn.com/video/' +
      player_thumbnail_id + '_360x203.jpg'
    link.find('img').attr('src',thumbnail)
    link.data('video-id', player_video_id)
    link.data('thumbnail-id', player_thumbnail_id)
    link.find('h1').text(player_title)
    link.find('p').text(player_description)
