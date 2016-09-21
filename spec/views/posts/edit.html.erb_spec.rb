require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @author = assign(:author, User.create(name: 'Jan', email: 'jan@example.com', password: 'secret'))
    @post = assign(:post, Post.create!(title: 'Hi ho', author_id: @author.id))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do
    end
  end
end
