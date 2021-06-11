Rails.application.routes.draw do
  resources :sightings
  resources :animals
  get '/animals/:id/sightings' => 'animals#sightingsbyanimal'
  get '/sightings/:start_date/:end_date'=>'sightings#rangeSights'
end
