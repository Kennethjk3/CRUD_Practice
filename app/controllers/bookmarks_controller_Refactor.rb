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
    @bookmark = Bookmark.new(bookmark_params)
    # Exsists but isn't saved to Database
    if bookmark.save
      redirect_to action: :index
      # this does create a HTTP request
    else
      render :new
      #doesnt create a new HTTP request, so no need to create new objects
      # render looks for template with same name
    end
  end

  def edit
  end

  def update
    if @bookmark.update_attributes(bookmark_params)
      redirect_to action: :index
    else
      render :edit
    end
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
