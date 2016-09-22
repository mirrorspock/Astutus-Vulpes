namespace :links do
  
  desc  "list all the links"
  task list: :environment do
    Link.all_the_links.each { |link| puts links.href }
  end
  
end
