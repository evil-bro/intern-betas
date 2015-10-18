Rails.application.routes.draw do

  	match 'blog'						=> 'blog#index',							:as => 'blog',									:via => [:get]

	match 'team'						=> 'pages#team',							:as => 'team',									:via => [:get]
	match 'interns/why'					=> 'internusrs#why',						:as => 'why_interns',							:via => [:get]
	match 'companies/why'				=> 'companies#why',							:as => 'why_companies',							:via => [:get]

	match 'browse'						=> 'vacancies#browse',						:as => 'vacancies_browse',						:via => [:get]
	match 'browse/:type'				=> 'vacancies#browse',																		:via => [:get]

	match 'dashboard/interns'			=> 'internusrs#list',						:as => 'dashboard_interns',						:via => [:get]
  	resources :internusrs
	resources :vacancies

	match 'dashboard'					=> 'dashboard#vacancies',					:as => 'dashboard_vacancies',					:via => [:get]
	
	root to: 'vacancies#index'

end
