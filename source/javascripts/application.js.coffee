handleNavClick = (e) ->
	$('nav').removeClass('big')
	contentEl = $('#content')
	
	url = './work.html'
	contentSelector = '#content > *'
	
	# Load in page
	contentEl.load("#{url} #{contentSelector}", ->
		contentEl.removeClass('transparent')
	)
	
	# history.pushState?({}, 'title?', url)
	

$ ->
	if $('body.index').length
		$('#content').addClass('transparent')
		
	$(document).on('click', 'nav.big li', handleNavClick)
	
	


	window.mySwipe = new Swipe($('.thumbnails')[0])