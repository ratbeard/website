# handleNavClick = (e) ->
# 	$('nav').removeClass('big')
# 	contentEl = $('#content')

# 	url = './work.html'
# 	contentSelector = '#content > *'

# 	# Load in page
# 	contentEl.load("#{url} #{contentSelector}", ->
# 		contentEl.removeClass('transparent')
# 	)

# 	# history.pushState?({}, 'title?', url)


# $ ->
# 	if $('body.index').length
# 		$('#content').addClass('transparent')

# 	$(document).on('click', 'nav.big li', handleNavClick)



# 	# Gallery
# 	window.mySwipe = new Swipe($('.gallery')[0])

return

win = $(window)
doc = $(document)

$('<div id="spacer">').appendTo('body').height(1200)

height =
	fadeIn: 70
	project: 300
	fadeOut: 70


projectEls = $('.project2')
p1 = projectEls.eq(0)
p2 = projectEls.eq(1)
p2.css(opacity: 0)

projectEls.css
	position: 'fixed'
	left: ($(document).width() - p1.width()) / 2


onScroll = ->
	top = win.scrollTop()
	console.log top


	diff = 70
	s = 300; e = s + diff
	if top < s
		p1.css(opacity: 1)

	if s< top < e
		percent = (top - s) / (e - s)
		p1.css(opacity: 1 - percent)
		p2.css(opacity: 0)

	[s, e] = [e, e+diff + 10]
	if s< top < e
		percent = (top - s) / (e - s)
		p1.css(opacity: 0)
		p2.css(opacity: percent)

	[s, e] = [e, e+diff]



$ ->
	$(document).scroll onScroll
	onScroll()

