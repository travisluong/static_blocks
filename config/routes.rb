StaticBlocks::Engine.routes.draw do
  resources :static_blocks
  root to: 'static_blocks#index'
end
