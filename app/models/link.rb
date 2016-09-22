class Link < ActiveRecord::Base
  def self.all_the_links
    Link.order("id desc").limit(100)
  end
end
