pauseVideo = ($slideElement, oldIndex, newIndex) ->
  iframe = $('#vimeo'+oldIndex)[0]
  player = Froogaloop(iframe)
  player.api("pause")

$(document).ready ->
  $(".bxslider").bxSlider
    video: true
    useCSS: false
    onSlideBefore: pauseVideo
  # bxSlider item cloning workaround
  cloneFrame = $(".bxslider").children()[0]
  $(cloneFrame).find("iframe").attr("id",null)
