namespace :pinger do
  desc "This task test all addresses"
  task :test_all => :environment do
    Address.all.each do |a|
      a.test
    end
  end
end
