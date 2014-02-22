# == Schema Information
#
# Table name: notes
#
#  id          :integer          not null, primary key
#  description :text             not null
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  track_id    :integer
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
