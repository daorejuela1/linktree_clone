//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_self
$(document).on('tuborlinks:load', function() {
		alert("hola");
		$('form').on('click', '.remove_fields', function(event) {
				console.log('clicked remove!')
				$(this).prev('input[type=hidden]').val('1');
				$(this).closes('tr').hide();
				return event.preventDefault();
		});

		$('form').on('click', '.add_fields', function(event) {
				console.log('clicked add!')
				var regexp, time;
				time = new Date().getTime();
				regexp = new RegExp($(this).data('id'), 'g');
				$(this).before($(this).data('fields').replace(regexp, time));
				return event.preventDefault();
		});
});
