
namespace :vimeo do
  desc "Updates the vimeo table"
  task :update => :environment do
    Video.update
  end
end