StaticBlocks::Engine.routes.draw do
  scope ":locale", locale: /#{StaticBlocks.config.locales.join("|")}/ do
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
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/static_blocks/#{I18n.default_locale}/snippets")
end
