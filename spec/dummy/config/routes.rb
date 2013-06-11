Rails.application.routes.draw do

  mount StaticBlocks::Engine => "/static_blocks_admin"
end
