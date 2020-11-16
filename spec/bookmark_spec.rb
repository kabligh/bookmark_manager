require 'bookmark'

describe Bookmark do
  describe ".all" do
    it "it returns all bookmarks" do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.github.com")
      expect(bookmarks).to include("http://www.google.com")
    end
  end
end
