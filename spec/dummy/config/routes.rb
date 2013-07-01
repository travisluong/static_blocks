Rails.application.routes.draw do

  mount StaticBlocks::Engine => "/static_blocks"

  root to: redirect("/#{I18n.default_locale}/info/index")

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    get "info/index"
  end

  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/#{I18n.default_locale}")

end
