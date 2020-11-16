feature "Testing infrastructure" do
  scenario "homepage has bookmark manager" do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario "View our list of bookmarks" do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.github.com"
    expect(page).to have_content "http://www.google.com"
  end
end
