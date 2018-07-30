bindKeys = ->
  Mousetrap.bind 'left', ->
    if jekyll_page_previous? and not window.disable_keyboard_nav
      Turbolinks.visit(jekyll_page_previous)

  Mousetrap.bind 'right', ->
    if jekyll_page_next? and not window.disable_keyboard_nav
      Turbolinks.visit(jekyll_page_next)

  Mousetrap.bind 'e d i t o r', ->
    if localStorage.debug_mode is "yes"
      # Disable
      localStorage.debug_mode = "no"
      $('[data-debug-toggle]').hide()
    else
      # Enable
      localStorage.debug_mode = "yes"
      $('[data-debug-toggle]').show()

window.disable_keyboard_nav = false

document.addEventListener 'DOMContentLoaded', ->
  # DO NOT DO ON EVERY TURBONAV
  bindKeys()

document.addEventListener 'turbolinks:load', ->
  if localStorage.debug_mode is "yes"
    $('[data-debug-toggle]').show()

document.addEventListener 'turbolinks:visit', ->
  window.jekyll_page_up = null
  window.jekyll_page_previous = null
  window.jekyll_page_next = null
