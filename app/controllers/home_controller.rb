class HomeController < ApplicationController
	def index
	  @home = Home.first
	  @sections_list = Section.order(:order)
	end

	def about
    @about = About.first
	  @sections_list = Section.order(:order)
  end

	def contact
		@sections_list = Section.order(:order)
	end

	def sendmail
		render 'index'
	end

	def sections
		@sections_list = Section.order(:order)
		@section = Section.where(id: params[:id]).first
		@arts = Art.where(section_id: params[:id]).order(:order)
	end

	def send_message
		ContactMailer.contact(params[:subject], params[:from_email], params[:from_name], params[:message]).deliver
		redirect_to root_path, notice: 'Message was successfully sent.'
	end

	def art_details
		@sections_list = Section.order(:order)
		@art = Art.find(params[:id])
	end
end
