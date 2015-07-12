# Refactored

class BookmarksController < ApplicationController
  # before_action what method is called, only: [put what methods need them]
  before_action :find_bookmark, only: [:show, :edit, :update, :destroy]

  def index
    #1st find all Bookmarks from database
    #Bookmark.all == SELECT * FROM bookmarks;
    # using (class).order(:how you want to sort) == *.all, and sorting
    @bookmarks = Bookmark.order(:title)
  end

  def show
  end

  def new
    #used as placeholder in html/ object.exsist? = no
    @bookmark = Bookmark.new
  end

  def create
    # Creates and Saves to DB
    @bookmark = Bookmark.create(bookmark_params)
    redirect_to action: :index
    # # This way allows for testing
    # @bookmark = Bookmark.new(bookmark_parms)
    # if @bookmark.save
    #   puts "Saved"
    # else
    #   puts "Try again"
    # end
  end

  def edit
  end

  def update
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
    @bookmark.destroy
    redirect_to action: :index
  end





  private

  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:url, :title, :comment, :favorite)
  end




end
