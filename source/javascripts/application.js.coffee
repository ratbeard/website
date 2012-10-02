handleNavClick = (e) ->
	$('nav').removeClass('big')
	contentEl = $('#content')
	
	contentEl.load('./work.html #content > *', ->
		contentEl.removeClass('transparent')
	)
	

$ ->
	if $('body.index').length
		$('#content').addClass('transparent')
		
	$(document).on('click', 'nav.big li', handleNavClick)
	
	


