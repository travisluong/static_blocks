StaticBlocks::Engine.routes.draw do
  resources :static_blocks do
    collection do
      get 'export'
      get 'export_translations'
    end
  end
  root to: 'static_blocks#index'
end
