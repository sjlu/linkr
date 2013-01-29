# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
class Form
	constructor: ->
		@listen()

	listen: ->
		$('#submit').click =>
			url = $('#input').val()
			@shorten(url) if @valid(url)

	valid: (url) ->
		return false if not url?
		return /((http|https):\/\/(\w+:{0,1}\w*@)?(\S+)|)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/.test(url) 

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

	display: (url) ->
		$('#output').html(url).fadeIn();

$(document).ready -> 
	form = new Form()