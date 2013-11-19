pauseVideo = ($slideElement, oldIndex, newIndex) ->
  iframe = $('#vimeo'+oldIndex)[0]
  player = Froogaloop(iframe)
  player.api('pause')

$(document).ready ->
  # bxslider
  $('.bxslider').bxSlider
    # video: true
    # useCSS: false
    captions: true
    # onSlideBefore: pauseVideo
  # bxSlider item cloning workaround
  cloneFrame = $('.bxslider').children()[0]
  $(cloneFrame).find('iframe').attr('id',null)
  # fancybox
  $('.fancybox-media').fancybox
    openEffect: 'none'
    closeEffect: 'none'
    helpers:
      media:
        {}
  $('.carousel').carousel()
