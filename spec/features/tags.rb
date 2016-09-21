describe "Tag mangement", type: :feature do 
  it 'can go to new tag' do
    visit '/tags'
    click_link('New Tag')
    expect(page).to have_content('New Tag')
  end

  it 'can create a new tag' do
    visit '/tags/new'
    fill_in 'tag[name]', with: 'Heavy'
    click_button 'Create Tag'
    expect(page).to have_content('Tag was successfully created')
  end
end
