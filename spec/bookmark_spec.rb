require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe ".all" do
    it "returns the whole list of bookmarks" do
      # Add the test data
      Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      google = Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.last.id).to eq google.id
      expect(bookmarks.first.title).to eq "Makers Academy"
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(url: "http://twitter.com", title: 'Twitter')
      persisted_data = persisted_data(table: 'bookmarks', id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first["id"]
      expect(bookmark.url).to eq "http://twitter.com"
      expect(bookmark.title).to eq "Twitter"
    end

    it "does not let an invalid bookmark be created" do 
      Bookmark.create(url: "Not a bookmark", title: "Oops")
      expect(Bookmark.all).to be_empty
    end 
  end

  describe ".delete" do
    it "deletes a bookmark" do
      bookmark = Bookmark.create(title: "Modern House", url: "https://www.themodernhouse.com/")

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe ".update" do
    it "updates a bookmark" do
      bookmark = Bookmark.create(title: "Modern House", url: "https://www.themodernhouse.com/")

      Bookmark.update(id: bookmark.id, url: "https://www.theoldhouse.com", title: "Old House")

      expect(Bookmark.all.last.title).to eq "Old House"
      expect(Bookmark.all.last.url).to eq "https://www.theoldhouse.com"
    end
  end

  describe ".find" do
    it "returns the requested bookmark object" do
      bookmark = Bookmark.create(title: "Modern House", url: "https://www.themodernhouse.com/")

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq "Modern House"
      expect(result.url).to eq "https://www.themodernhouse.com/"
    end
  end

  describe "#comments" do 
    it 'returns a list of comments on a bookmark' do 
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      DatabaseConnection.query("INSERT INTO comments (id, text, bookmark_id) VALUES(1, 'Test comment', #{bookmark.id})")

      comment = bookmark.comments.first

      expect(comment['text']).to eq 'Test comment'
    end 
  end 
end
