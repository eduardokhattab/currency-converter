Rails.application.routes.draw do
  resources :currencies
  resources :countries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'simulations/company-plans', to: "simulations#company_plans"
  get 'simulations/company-plan/:plan', to: "simulations#company_plan", as: :simulations_company_plan
  post "/converter", to: "converter_api#convert"
end
