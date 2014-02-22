# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Note < ActiveRecord::Base
	belongs_to	:user,
							:class_name => "User",
							:foreign_key => :user_id,
							:primary_key => :id
	
	belongs_to	:track,
							:class_name => "Track",
							:foreign_key => :track_id,
							:primary_key => :id			

	validates		:description, :presence => true

end
