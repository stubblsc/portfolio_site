class Admin::AdminController < ApplicationController
	layout "admin"

	before_filter :authenticate
  before_action :set_home, only: [:show_home, :edit_home, :update_home]
  before_action :set_about, only: [:show_about, :edit_about, :update_about]


	helper_method :authenticate

  def index
  	@home = Home.first
  	@about = About.first
  end

  def show_home	
    @home = Home.first
  	@about = About.first
  end

  def edit_home
    @home = Home.first
  	@about = About.first
  end

  def update_home
    @home = Home.first
  	@about = About.first

    if @home.update(home_params)
      redirect_to admin_home_path(@home), notice: 'Home successfully updated.'
    else
    	render action: 'edit_home'
    end
  end

  def delete_home_background
    home = Home.first
    home.background.destroy
    home.background.clear
    home.save

    redirect_to admin_root_path
  end

  def delete_about_background
    about = About.first
    about.background.destroy
    about.background.clear
    about.save

    redirect_to admin_root_path
  end

  def show_about
    @home = Home.first
  	@about = About.first
  end

  def edit_about
    @home = Home.first
  	@about = About.first
  end

  def update_about
    @home = Home.first
  	@about = About.first

    if @about.update(about_params)
      redirect_to admin_about_path(@about), notice: 'About was successfully updated.'
    else
    	render action: 'edit_about'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.require(:home).permit(:text, :background, :header)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_about
      @about = About.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def about_params
      params.require(:about).permit(:text, :background, :header)
    end
end