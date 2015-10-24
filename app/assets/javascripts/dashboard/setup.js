$(document).ready(function() {
	$('#vacancies-table').DataTable({
		columnDefs: [ {
            targets: [ 0 ],
            orderData: [ 0, 1 ]
        }, {
            targets: [ 1 ],
            orderData: [ 1, 0 ]
        }, {
        	targets: [3],
        	orderable: false
        }]
	});
})