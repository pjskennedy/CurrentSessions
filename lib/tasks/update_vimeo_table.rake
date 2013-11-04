
namespace :vimeo do
  desc "Updates the vimeo table"
  task :update => :environment do
    Video.refresh
  end
end