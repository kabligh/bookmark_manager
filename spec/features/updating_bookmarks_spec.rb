feature "Updating bookmarks" do
  scenario "User can see edit option" do
    Bookmark.create(url: "https://www.themodernhouse.com/", title: 'Modern House')
    visit('/bookmarks')
    expect(page).to have_link("Modern House", href: "https://www.themodernhouse.com/")

    expect(page).to have_button('Edit')
  end

  scenario "User can edit specific bookmark" do
    bookmark = Bookmark.create(url: "https://www.themodernhouse.com/", title: 'Modern House')
    visit('/bookmarks')
    expect(page).to have_link("Modern House", href: "https://www.themodernhouse.com/")

    first('.bookmark').click_button('Edit')
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in('url', with: "https://theoldhouse.com/")
    fill_in('title', with: "Old House")
    click_button('Submit')
    expect(page).to have_link("Old House", href: "https://theoldhouse.com/")
  end
end
