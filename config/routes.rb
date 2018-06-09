# frozen_string_literal: true

Cpc::Application.routes.draw do
  resources :boxes

  resources :colors

  resources :contacts

  resources :customers do
    resources :contacts
    resources :work_orders
  end

  resources :manufacturers

  resources :notes

  resources :powders

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
      get 'sand_blasting_quote_calculator'
    end
  end

  resources :quote_request_attachments

  get 'static_pages/home'
  get 'static_pages/about'
  get 'static_pages/thank_you'

  devise_for :users

  resources :work_orders do
    resources :notes

    collection do
      get 'workflow'
    end

    member do
      post 'quality_assurance_approval'
      put 'mark_completed'
    end
  end

  root to: 'static_pages#home'

end
