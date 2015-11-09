Rails.application.routes.draw do
  	match 'blog'						=> 'blog#index',							:as => 'blog',									:via => [:get]
  	match 'privacy'						=> 'pages#privacy',							:as => 'privacy',								:via => [:get]
  	match 'service'						=> 'pages#service',							:as => 'service',								:via => [:get]
	match 'pricing'						=> 'pages#pricing',							:as => 'pricing',								:via => [:get]

	match 'team'						=> 'pages#team',							:as => 'team',									:via => [:get]

	match 'interns/why'					=> 'internusrs#why',						:as => 'why_interns',							:via => [:get]
	match 'companies/why'				=> 'companies#why',							:as => 'why_companies',							:via => [:get]
	match 'vacancies/getvacancy'		=> 'vacancies#getvacancy',																	:via => [:get]
	match 'browse/filter/:id'			=> 'vacancies#filter',						:as => 'browse_filter',							:via => [:get]

	match 'browse'						=> 'vacancies#browse',						:as => 'vacancies_browse',						:via => [:get]
	match 'browse/:type'				=> 'vacancies#browse',																		:via => [:get]

	match 'dashboard/interns'			=> 'internusrs#list',						:as => 'dashboard_interns',						:via => [:get]
	match 'dashboard/subscribers'		=> 'subscribers#index',						:as => 'dashboard_subscribers',					:via => [:get]
	resources :subscribers
  	resources :internusrs
	resources :vacancies
	resources :candidates

	match 'dashboard'					=> 'dashboard#vacancies',					:as => 'dashboard_vacancies',					:via => [:get]
	
	root to: 'vacancies#index'

end
