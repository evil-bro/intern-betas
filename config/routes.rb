Rails.application.routes.draw do
	resources :vacancies

	match 'dashboard'					=> 'dashboard#vacancies',					:as => 'dashboard_vacancies',					:via => [:get]
	
	root to: 'vacancies#index'

end
