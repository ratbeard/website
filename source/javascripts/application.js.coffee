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
document.addEventListener "click", (e) ->
  el = e.target

  # On clicking a thumbnail, update the active thumbnail and replace the main image
  if hasClass(el, 'thumbnail')
  	projectEl = ancestorWithClass(el, "project")
  	activeThumbnailEl = projectEl.querySelector(".active")
  	mainImageEl = projectEl.querySelector(".main-image")
  	removeClass(activeThumbnailEl, "active")
  	addClass(el, 'active')
  	mainImageEl.src = el.src
