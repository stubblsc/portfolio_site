class Admin::SectionsController < ApplicationController
  layout "admin"

  before_filter :authenticate
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  helper_method :authenticate

  # GET /sections
  # GET /sections.json
  def index
    @home = Home.first
    @about = About.first

    @sections = Section.order(:order)
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @home = Home.first
    @about = About.first

    @section = Section.find(params[:id])
  end

  # GET /sections/new
  def new
    @home = Home.first
    @about = About.first

    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
    @home = Home.first
    @about = About.first

    @section = Section.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create
    @home = Home.first
    @about = About.first

    @section = Section.new(section_params)
    @section.order = Section.all.count+1

    respond_to do |format|
      if @section.save
        format.html { redirect_to [:admin, @section], notice: 'Section was successfully created.' }
        format.json { render action: 'show', status: :created, location: @section }
      else
        format.html { render action: 'new' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    @home = Home.first
    @about = About.first

    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to admin_section_path(@section), notice: 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @home = Home.first
    @about = About.first
    
    @section = Section.find(params[:id])
    
    @section.destroy
    respond_to do |format|
      format.html { redirect_to admin_sections_url }
      format.json { head :no_content }
    end
  end

  def order_sections
    params['sections'].keys.each do |id|
      @section = Section.find(id.to_i)
      @section.update_attributes(sections_params(id))
    end

    redirect_to admin_root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sections_params(id)
      params.require(:sections).fetch(id).permit( :order )
    end

    def section_params
      params.require(:section).permit(:title, :order, :arts_attributes => [:title, :medium, :description, :piece, :section_id, :order])
    end
end
