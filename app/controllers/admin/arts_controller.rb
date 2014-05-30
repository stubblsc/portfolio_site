class Admin::ArtsController < ApplicationController
  layout "admin"

  before_filter :authenticate
  before_action :set_art, only: [:show, :edit, :update, :destroy]

  helper_method :authenticate

  # GET /arts
  # GET /arts.json
  def index
    @home = Home.first
    @about = About.first

    @arts = Art.order(:section_id, :order)
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    @home = Home.first
    @about = About.first

    @art = Art.find(params[:id])
  end

  # GET /arts/new
  def new
    @home = Home.first
    @about = About.first

    @art = Art.new
  end

  # GET /arts/1/edit
  def edit
    @home = Home.first
    @about = About.first

    @art = Art.find(params[:id])
  end

  # POST /arts
  # POST /arts.json
  def create
    @home = Home.first
    @about = About.first

    section = Section.find(art_params[:section_id])
    @art = section.art.build(art_params)
    @art.order = section.art.count+1

    respond_to do |format|
      if @art.save
        format.html { redirect_to admin_art_path(@art), notice: 'Art was successfully created.' }
        format.json { render action: 'show', status: :created, location: @art }
      else
        format.html { render action: 'new' }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    @home = Home.first
    @about = About.first

    @art = Art.find(params[:id])

    respond_to do |format|
      if @art.update(art_params)
        format.html { redirect_to admin_art_path(@art), notice: 'Art was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy_by_section
    @home = Home.first
    @about = About.first

    @art = Art.find(params[:id])
    @art.destroy
    respond_to do |format|
      format.html { redirect_to admin_arts_path }
      format.json { head :no_content }
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @home = Home.first
    @about = About.first

    @art = Art.find(params[:id])
    @art.destroy
    respond_to do |format|
      format.html { redirect_to admin_arts_path }
      format.json { head :no_content }
    end
  end

  def select_section
    @home = Home.first
    @about = About.first

    @sections = Section.order(:order)
  end

  def view_by_section
    @home = Home.first
    @about = About.first

    @section = Section.find(params[:section_id])
    @arts = @section.art.order(:order)
  end

  def order_by_section
    params['arts'].keys.each do |id|
      @art = Art.find(id.to_i)
      @art.update_attributes(arts_params(id))
    end

    redirect_to admin_root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      @art = Art.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def arts_params(id)
      params.require(:arts).fetch(id).permit( :order )
    end

    def art_params
      params.require(:art).permit(:title, :section_id, :medium, :description, :piece, :order)
    end
end
