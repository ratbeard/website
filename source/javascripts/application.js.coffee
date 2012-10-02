handleNavClick = (e) ->
	$('nav').removeClass('big')
	

$ ->
	$(document).on('click', 'nav.big li', handleNavClick)
	
	


