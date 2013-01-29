# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
class Form
	constructor: ->
		@listen()

	listen: ->
		$('#submit').click =>
			url = $('#input').val()
			@shorten(url)

	shorten: (url) ->
		$('#output').fadeOut =>
			$.ajax '/create.json'
				type: "POST"
				data:
					link:
						url: url
				dataType: "json"
				success: (response) =>
					@display(response.url)
				error: (response) =>
					@display_error($.parseJSON(response.responseText).url)

	display: (url) ->
		$('#output').html(url).fadeIn();

	display_error: (errors) ->
		$('#output').html("Error. [#{errors.join(', ')}]").fadeIn();

$(document).ready -> 
	form = new Form()