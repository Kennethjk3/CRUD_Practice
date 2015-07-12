class BookmarksController < ApplicationController

  def index
    #1st find all Bookmarks from database
    #Bookmark.all == SELECT * FROM bookmarks;
    @bookmarks = Bookmark.all
  end

  def new
    #used as placeholder in html/ object.exsist? = no
    @bookmark = Bookmark.new
  end

  def create
    # Saves to DB
    @bookmark = Bookmark.create(bookmark_parms)

    # # This way allows for testing
    # @bookmark = Bookmark.new(bookmark_parms)
    # if @bookmark.save
    #   puts "Saved"
    # else
    #   puts "Try again"
    # end
    redirect_to action: :index
  end





  private

  def bookmark_parms
    params.require(:bookmark).permit(:url,  :title, :comment, :favorite)
  end




end
