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

	$('style').detach();

	if ($('.subscribe-form').length) {
		$('.subscribe-form > button:contains("Subscribe")').removeClass('primary').addClass('btn btn-primary custom-button turq-btn');
		$('.subscribe-form').addClass('form-inline');
	}
	

	$("#header").headroom({
		"offset": 305,
		"tolerance": 5
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

	$('#new_subscriber').submit(function() {
		var valuesToSubmit = $(this).serialize();
		$.ajax({
			type: 'POST',
			url: $(this).attr('action'),
			data: valuesToSubmit,
			dataType: "JSON",
			success: function(data, textStatus) {
				$('#new_subscriber').find('input[type=text], textarea').val('');
				
				$('#subscriber-message').show();
				$('#subscriber-message').delay(3000).slideUp('slow');
				$('#subscriber-error').delay(3000).slideUp('slow');
				
			},
			error:function(request, textStatus, errorThrown) {
				$('#subscriber-error > p').append(request.responseText);
				$('#subscriber-error').show();
				$('#subscriber-error').delay(4000).slideUp('slow');
				$('#subscriber-error').delay(4000).slideUp('slow');
			}
		});

		$('.error-response').remove();

		return false
	});
})