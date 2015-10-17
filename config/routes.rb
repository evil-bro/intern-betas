Rails.application.routes.draw do

	match 'browse'						=> 'vacancies#index',						:as => 'vacancies_browse',						:via => [:get]
	match 'browse/:type'				=> 'vacancies#index',																		:via => [:get]

	match 'dashboard/interns'			=> 'internusrs#list',						:as => 'dashboard_interns',						:via => [:get]
  	resources :internusrs
	resources :vacancies

	match 'dashboard'					=> 'dashboard#vacancies',					:as => 'dashboard_vacancies',					:via => [:get]
	
	root to: 'vacancies#index'

end
