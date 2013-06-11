Rails.application.routes.draw do

  get "info/index"

  mount StaticBlocks::Engine => "/static_blocks_admin"
end
