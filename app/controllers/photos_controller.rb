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
    @photo = Photo.new
    respond_with(@photo)
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    respond_with(@photo)
  end

  # POST /photos
  # POST /photos.xml
  def create
    @photo = Photo.create(params[:photo])
    respond_with(@photo, :location => @photo) do |format|
      format.xml { render :template => "photos/show", :locals => {:photo  => @photo } }
    end
    # respond_to do |format|
    #   if @photo.save
    #     format.html { redirect_to(@photo, :notice => 'Photo was successfully created.') }
    #     format.xml  { render :xml => @photo, :status => :created, :location => @photo }
    #   else
    #     format.html { render :action => "new" }
    #     format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @photo = Photo.find(params[:id])
    respond_with(@photo.update_attributes(params[:photo]))
    # respond_to do |format|
    #   if 
    #     format.html { redirect_to(@photo, :notice => 'Photo was successfully updated.') }
    #     format.xml  { head :ok }
    #   else
    #     format.html { render :action => "edit" }
    #     format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    respond_with(@photo)
    # respond_to do |format|
    #   format.html { redirect_to(photos_url) }
    #   format.xml  { head :ok }
    # end
  end
end
