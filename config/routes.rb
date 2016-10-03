Rails.application.routes.draw do
	devise_for :usuarios
	get 'reunioes/index'
	get 'pagina/index'

	root :to => 'pagina#index'

	resources :reunioes do
		collection do
			get :listar
		end
		resources :pautas
		resources :atas
	end
	resources :coordreunioes
	resources :gerencias
	
end
