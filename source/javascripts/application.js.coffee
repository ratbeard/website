# DOM helpers
# ====
classRegex = do ->
  cache = {}
  (className) ->
  	cache[className] ||= new RegExp("(\\s|^)" + className + "(\\s|$)")

hasClass = (el, className) ->
  classRegex(className).test(el.className)

removeClass = (el, className) ->
  return unless hasClass(el, className)
  el.className = el.className.replace(classRegex(className), " ")

addClass = (el, className) ->
  return if hasClass(el, className)
  el.className += " #{className}"

# Like `closest` but takes a className not a selector
ancestorWithClass = (el, className) ->
  el = el.parentNode until !el || hasClass(el, className)
  el

# App
# ====
# On clicking a thumbnail, update the active thumbnail and replace the main image
showThumbnail = (thumbnailEl) ->
  projectEl = ancestorWithClass(thumbnailEl, "project")
  activeThumbnailEl = projectEl.querySelector(".active")
  mainImageEl = projectEl.querySelector(".main-image")
  activateThumbnail(thumbnailEl, activeThumbnailEl, mainImageEl)


showNextThumbnail = (mainImageEl) ->
  projectEl = ancestorWithClass(mainImageEl, "project")
  activeThumbnailEl = projectEl.querySelector(".active")
  nextThumbnailEl = activeThumbnailEl.nextElementSibling || projectEl.querySelector(".thumbnail")
  activateThumbnail(nextThumbnailEl, activeThumbnailEl, mainImageEl)

activateThumbnail = (thumbnailEl, oldThumbnailEl, mainImageEl) ->
  removeClass(oldThumbnailEl, "active")
  addClass(thumbnailEl, 'active')
  mainImageEl.src = thumbnailEl.src


document.addEventListener "click", (e) ->
  el = e.target

  if hasClass(el, 'thumbnail')
  	showThumbnail(el)
  else if hasClass(el, "main-image")
  	showNextThumbnail(el)



