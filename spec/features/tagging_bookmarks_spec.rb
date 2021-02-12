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

  feature 'A user can filter bookmarks by tags' do 
    scenario 'add the same tag to multiple bookmarks and filter by them' do 
      Bookmark.create(url: 'http://www.bbc.co.uk/news', title: 'BBC News')
      Bookmark.create(url: 'http://www.guardian.co.uk', title: 'Guardian')
      Bookmark.create(url: 'http://www.theconversation.com/uk', title: 'TCUK')

      visit '/bookmarks'

      within page.find('.bookmark:nth-of-type(1)') do
        click_button 'ADD TAG'
      end
      fill_in 'tag', with: 'news'
      click_button 'ADD'

      within page.find('.bookmark:nth-of-type(2)') do
        click_button 'ADD TAG'
      end
      fill_in 'tag', with: 'news'
      click_button 'ADD'

      first('.bookmark').click_link 'news'

      expect(page).to have_link 'BBC News', href: 'http://www.bbc.co.uk/news'
      expect(page).to have_link 'Guardian',  href: 'http://www.guardian.co.uk'
      expect(page).not_to have_link 'TCUK', href: 'http://www.theconversation.com/uk'
    end 
  end 
end 