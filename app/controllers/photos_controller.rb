class PhotosController < ApplicationController

  def index
    @list_of_all_photos = Photo.all
    render("photos/index.html.erb")
  end

  def new_form
    render("photos/new_form.html.erb")
  end

  def create_row
    src=params[:src]
    caption=params[:caption]
    newphoto=Photo.new
    newphoto.source=src
    newphoto.caption=caption
    newphoto.save
    redirect_to("/photos")
  end

  def show
    @id=params[:id]
    thisphoto = Photo.find(@id)
    @caption = thisphoto.caption
    @source = thisphoto.source
    @utime = thisphoto.updated_at

    render("photos/show.html.erb")
  end

  def edit_form
    @id=params[:id]
    thisphoto=Photo.find(@id)
    @source=thisphoto.source
    @caption=thisphoto.caption
    render("/photos/edit_form.html.erb")
  end

  def update_row
    id=params[:id]
    src=params[:src]
    caption=params[:caption]
    uphoto=Photo.find(id)
    uphoto.source=src
    uphoto.caption=caption
    uphoto.save
    redirect_to("/photos/#{uphoto.id}")
  end

  def destroy_row
    id=params[:id]
    delme=Photo.find(id)
    delme.destroy
    redirect_to("/photos")
  end


end
