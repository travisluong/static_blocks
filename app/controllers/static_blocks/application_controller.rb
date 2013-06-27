module StaticBlocks
  class ApplicationController < ActionController::Base

    if StaticBlocks.config.http_auth
      http_basic_authenticate_with :name => StaticBlocks.config.username, :password => StaticBlocks.config.password
    end

    before_filter :set_locale

    private

    def set_locale
      I18n.locale = params[:locale] if params[:locale].present?
    end

    def default_url_options(options = {})
      {locale: I18n.locale}
    end
  end
end
