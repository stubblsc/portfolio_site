class Section < ActiveRecord::Base
	has_many :art, :dependent => :destroy
	validates :title, presence: true
end
