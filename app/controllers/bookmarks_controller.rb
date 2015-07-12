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
    @bookmark = Bookmark.create(bookmark_params)

    # # This way allows for testing
    # @bookmark = Bookmark.new(bookmark_parms)
    # if @bookmark.save
    #   puts "Saved"
    # else
    #   puts "Try again"
    # end

    redirect_to action: :index
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update_attributes(bookmark_params)
    redirect_to action: :index
    # if @bookmark.save
    #   puts "Saved"
    # else
    #   puts "Try again"
    # end
  end



  def destroy
    #find object to delete with .find
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to action: :index
  end





  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :title, :comment, :favorite)
  end




end
