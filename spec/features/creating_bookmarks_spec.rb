feature "Adding new bookmarks" do
  scenario "A user can add a bookmark to Bookmark Manager" do
    visit('/bookmarks')
    fill_in("url", with: "http://twitter.com")
    fill_in("title", with: "Twitter")
    click_button('ADD')

    expect(page).to have_link("Twitter", href: "http://twitter.com")
  end

  scenario "User cannot add invalid bookmark" do 
    visit('/bookmarks')
    fill_in("url", with: "Not a bookmark")
    fill_in("title", with: "Oops")
    click_button('ADD')

    expect(page).not_to have_content("Not a bookmark")
    expect(page).to have_content("You must submit a valid URL")
  end 
end
