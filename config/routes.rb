StaticBlocks::Engine.routes.draw do
  resources :snippets do
    collection do
      get 'export'
      get 'export_translations'
      post :import
      post :import_translations
    end
  end
  root to: 'snippets#index'
end
