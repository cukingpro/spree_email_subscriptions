Spree::Core::Engine.routes.draw do
	namespace :api do		
  		resources :email_subscriptions, only: [:index, :show, :create]
  		put "/confirm_subscription/" => "/spree/api/email_subscriptions#confirm_subscription"
  		put "/confirm_unsubscription/" => "/spree/api/email_subscriptions#unsubscribe"
  	end
  # Add your extension routes here
end
