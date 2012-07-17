# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

jQuery ->
  playlistHandler()
  signupHandler()

signupHandler = ->
  $(".modallaunch").click ->
    id   = $(this).attr('data-album-id')
    name = $(this).attr('data-album-name')
    console.log(id)
    console.log(name)
    $('#signup-album').val(id)
    $('#modalheader').text("Select a day to listen to " + name)


playlistHandler = ->
  totalTracks = $(".song").length

  $(".song").click ->
    playSong($(this).attr('data-track'))
  
  $("#next").click ->
    currentTrack = $(".mp3player").attr('data-current')
    newTrack = +currentTrack+1
    if newTrack <= totalTracks
     playSong(newTrack)

  $("#prev").click ->
    currentTrack = $(".mp3player").attr('data-current')
    newTrack = +currentTrack-1
    if newTrack > 0
      playSong(newTrack)

  $(".mp3player").bind "ended", ->
    currentTrack = $(".mp3player").attr('data-current')
    newTrack = +currentTrack+1
    if newTrack <= totalTracks
      playSong(newTrack)

  playSong = (trackNumber) ->
    song   = $("a[data-track=#{trackNumber}]").attr('data-song')
    track  = $("a[data-track=#{trackNumber}]").attr('data-track')
    artist = $("a[data-track=#{trackNumber}]").attr('data-artist')
    title  = $("a[data-track=#{trackNumber}]").attr('data-title')
    $(".mp3player").attr('src', song)
    $(".mp3player").attr('data-current', track)
    $(".mp3player").attr('autoplay', "true")
    $("#nowplaying").text(title)
    return false