require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @author = assign(:author, User.create(name: 'Jan', email: 'jan@example.com', password: 'secret'))
    @post = assign(:post, Post.create!(title: 'Hi ho', author_id: @author.id))
  end

  it "renders attributes in <p>" do
    render
  end
end
