Rails.application.routes.draw do

  root to: redirect("/#{I18n.default_locale}/info/index")
  mount StaticBlocks::Engine => "/static_blocks_admin"

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    get "info/index"
  end

  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/#{I18n.default_locale}")


end
