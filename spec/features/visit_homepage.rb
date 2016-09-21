describe "The homepage", type: :feature do 
  it 'visits the homepage' do
    visit '/'
    expect(page).to have_content('Listing Posts')
  end
end
