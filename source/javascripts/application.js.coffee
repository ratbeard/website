$ ->
  $('.thumbnail').click (e) ->
    e.preventDefault()
    el = $(@)
    el.addClass('active').siblings('.active').removeClass('active')
    el.closest('.project').find('.main-image').attr('src', el.attr('src'))

  $('body').addClass('animate')
