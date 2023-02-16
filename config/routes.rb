# frozen_string_literal: true

Rails.application.routes.draw do
  get 'tiles/:zoom/:x/:y', to: 'tiles#show', as: :tile
  resource :map_style, only: :show

  root 'maps#show'
end
