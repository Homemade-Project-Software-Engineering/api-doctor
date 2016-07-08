Rails.application.routes.draw do
  resources :users do
    resources :alarms
  end
  resources :relationships, only: [:index,:create]
  delete "relationships_remove" => "relationships#destroy", :as => "remove_relation"
end
