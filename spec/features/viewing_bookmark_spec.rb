require 'pg'

feature "Viewing bookmarks" do
  scenario "homepage has bookmark manager" do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  scenario "View our list of bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    Bookmark.create(url: 'http://www.makersacademy.com')
    Bookmark.create(url: 'http://www.destroyallsoftware.com')
    Bookmark.create(url: 'http://www.google.com')

    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
