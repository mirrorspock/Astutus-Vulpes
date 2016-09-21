require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:author) { User.create(name: 'Jan', email: 'jan@example.com', password: 'secret') }

  before(:each) do
    assign(:posts, [
      Post.create!(title: 'Hi ho', author_id: author.id),
      Post.create!(title: 'Hi ho, hi ho', author_id: author.id)
    ])
  end

  it "renders a list of posts" do
    render
  end
end
