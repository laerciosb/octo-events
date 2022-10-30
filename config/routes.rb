# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json } do
    scope module: :v1, constraints: VersionConstraint.new(version: 1, default: true), as: 'v1' do
      resources :issues, only: [], param: :number do
        get :events, on: :member
      end
    end
  end

  namespace :webhooks, defaults: { format: :json } do
    namespace :github do
      resources :events, only: [:create]
    end
  end

  scope :monitoring do
    get :check, to: proc { [200, {}, []] }, as: :health_check
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
