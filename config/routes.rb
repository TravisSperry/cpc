# frozen_string_literal: true

Cpc::Application.routes.draw do
  resources :boxes

  resources :colors

  resources :customers

  resources :manufacturers

  resources :powders

  resources :quote_request_attachments

  resources :notes

  devise_for :users

  resources :quote_requests do
    resources :notes

    member do
      get 'mark_as_viewed'
      get 'mark_as_submitted'
      get 'mark_as_won'
      get 'mark_as_lost'
    end

    collection do
      get 'calculator'
    end
  end

  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/thank_you'

  match 'contact' => 'contact#new', :as => 'new_message', :via => :get
  match 'contact' => 'contact#create', :as => 'contact', :via => :post

  root to: 'static_pages#home'

end
