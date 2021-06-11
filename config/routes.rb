Rails.application.routes.draw do
  resources :sightings
  resources :animals
  # get '/resources' => 'resources#index'
  # get '/animals/:id' => 'animals#sightingsbyanimal'
  get '/sightings/:start_date/:end_date'=>'sightings#rangeSights'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
