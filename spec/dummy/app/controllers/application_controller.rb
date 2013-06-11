class ApplicationController < ActionController::Base
  protect_from_forgery
  helper StaticBlocks::Engine.helpers
end
