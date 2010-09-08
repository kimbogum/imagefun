class PhotosController < ApplicationController
  
  respond_to :html, :xml, :json
  
  # GET /photos
  # GET /photos.xml
  def index
    respond_with(@photos = Photo.all)
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
    respond_with(@photo = Photo.find(params[:id]))
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    respond_with(@photo = Photo.new)
  end

  # GET /photos/1/edit
  def edit
    respond_with(@photo = Photo.find(params[:id]))
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.create(params[:photo])
    respond_with(@photo, :location => @photo) do |format|
      format.html { redirect_to photos_url }
      format.xml { render :template => "photos/show", :locals => {:photo  => @photo } }
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(params[:photo])
    respond_with(@photo)
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    respond_with(Photo.find(params[:id]).destroy)
  end
end