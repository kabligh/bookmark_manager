require 'database_helpers'
require 'comment'
require 'bookmark'

describe Comment do 
  describe '.create' do 
    it 'creates a new comment' do 
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      comment = Comment.create(text: "Test comment", bookmark_id: bookmark.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id )

      expect(comment).to be_a Comment 
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq "Test comment"
      expect(comment.bookmark_id).to eq bookmark.id 
    end 
  end 

  describe '.where' do 
    it 'gets the relevant comment from the database' do 
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Comment.create(text: "First test comment", bookmark_id: bookmark.id)
      Comment.create(text: "Second test comment", bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      comment1 = comments.first 
      persisted_data = persisted_data(table: 'comments', id: comment1.id)

      expect(comments.length).to eq 2 
      expect(comment1.id).to eq persisted_data.first['id']
      expect(comment1.text).to eq 'First test comment'
      expect(comment1.bookmark_id).to eq bookmark.id
    end 
  end 
end 