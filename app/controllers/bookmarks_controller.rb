class BookmarksController < ApplicationController

  def index
    #1st find all Bookmarks from database
    #Bookmark.all == SELECT * FROM bookmarks;
    @bookmarks = Bookmark.all
  end
end
