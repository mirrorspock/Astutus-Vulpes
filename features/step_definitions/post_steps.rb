Given(/^I am logged in as "([^"]*)"$/) do |arg1|
  @user = User.create(name: 'hi', email: 'ho@ho.com', password: 'secret')
  visit '/signin'
  fill_in 'user[email]', with: @user.email
  fill_in 'user[password]', with: @user.password
  click_button 'login'

end

When(/^I write a new blog post titled "([^"]*)" $/) do |title|
  visit '/posts/new'
  fill_in 'post[title]', with: title
  fill_in 'post[body]', with: 'A nice story for you and yours'
  click_button 'Create Post'
end

When(/^I go to the home page $/) do
  visit '/'
end

Then(/^I should see "([^"]*)"$/) do |title|
  expect(page).to have_content(title)
end


# remove posts

Given(/^a blog post titled "([^"]*)"$/) do |title|
  @user = User.create(name: 'hi', email: 'ho@ho.com', password: 'secret')
  @post = Post.create(title: title, author: @user)
  visit '/'
  expect(page).to have_content(title)
end

When(/^I remove the post "([^"]*)"$/) do |title|
  #find("tr#post_info_#{@post.id}").find('a[data-method=delete]').click
  find(:xpath, "//a[@data-method='delete'][@href='/posts/#{@post.id}']").click
end

When(/^I go to the home page$/) do
  visit '/'
end

Then(/^I should not see "([^"]*)"$/) do |title|
  expect(page).to_not have_content(title)
end
