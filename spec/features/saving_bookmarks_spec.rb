require 'pg'

feature "Adding new bookmarks" do
  scenario "adding bookmark to Bookmark Manager" do
    visit('/bookmarks/new')
    fill_in("url", with: "http://twitter.com")
    click_button('Add bookmark')
    expect(page).to have_content("http://twitter.com")
  end
end
