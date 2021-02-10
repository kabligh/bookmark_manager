feature 'Adding and viewing bookmark tags' do 
  feature 'A user can add then view tag' do 
    scenario 'a tag is added to a bookmark' do 
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

      visit '/bookmarks'
      first('.bookmark').click_button 'ADD TAG'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"

      fill_in 'tag', with: 'Coding'
      click_button 'ADD'

      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content 'Coding'
    end 
  end 
end 