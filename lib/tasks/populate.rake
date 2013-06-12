namespace :db do
  desc "Fill database"
  task :populate => :environment do
    require 'populator'
    StaticBlocks::StaticBlock.populate 20 do |sb|
      sb.title = Populator.words(1..3).titleize
      sb.content = Populator.sentences(1..10)
      sb.status = ['draft', 'published']
      sb.created_at = 2.years.from_now..Time.now
    end
  end
end
