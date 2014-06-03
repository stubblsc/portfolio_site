class Art < ActiveRecord::Base
	belongs_to :section

	has_attached_file :piece, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :piece, :content_type => /\Aimage\/.*\Z/

	#validates :title, :section_id, :medium, :description, presence: true
 	validates_attachment_presence :piece
end
