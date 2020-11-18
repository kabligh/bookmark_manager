feature "Deleting bookmarks" do
  scenario "User can delete a bookmark" do
    Bookmark.create(url: "https://www.themodernhouse.com/", title: 'Modern House')
    visit('/bookmarks')
    expect(page).to have_link("Modern House", href: "https://www.themodernhouse.com/")

    first('.bookmark').click_button('Delete')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Modern House", href: "https://www.themodernhouse.com/")
  end
end
