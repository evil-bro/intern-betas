var myElement = document.querySelector("header");
var headroom  = new Headroom(myElement);
headroom.init(); 

$(document).ready(function() {
	$('.learn-more').on('click', function() {
		$(this).parent().parent().parent().find('.vacancy-learn-more').toggle();
	});

	$('.apply-btn').on('click', function() {
		var vacancyId = $(this).attr('vacancy-id');

		$('#vacancy-form').find('input[type=text], textarea').val('');
		
		$.ajax({
			url: '/vacancies/getvacancy',
			data: {
				id: vacancyId
			},
			type: 'GET',
			success: function(data) {
				$('#vacancyFormLabel').text(data.vacancy_company_name)
				$('#vacancy_id').val(data.id);
				$('#apply-form').modal('show');
			}
		})
	});

	$('#vacancy-form').submit(function() {
		var valuesToSubmit = $(this).serialize();

		$.ajax({
			type: 'POST',
			url: $(this).attr('action'),
			data: valuesToSubmit,
			dataType: "JSON",
			success: function(data, textStatus) {
				$('#vacancy-form').find('input[type=text], textarea').val('');
				
				$('#system-message').show();
				$('#system-message').delay(3000).slideUp('slow');
				$('#system-error').delay(3000).slideUp('slow');
				
			},
			error:function(request, textStatus, errorThrown) {
				$('#system-error > p').append(request.responseText);
				$('#system-error').show();
				$('#system-error').delay(4000).slideUp('slow');
				$('#system-error').delay(4000).slideUp('slow');
			}
		});

		$('.error-response').remove();

		return false;
	});
})