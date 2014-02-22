# == Schema Information
#
# Table name: tracks
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  album_id     :integer          not null
#  lyrics       :text
#  bonus_track  :boolean          default(FALSE), not null
#  track_number :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Track < ActiveRecord::Base
	validates :title,					:presence => true
	validates :album_id,			:presence => true, numericality: { only_integer: true }
	validates :track_number, 	:presence => true, numericality: { only_integer: true }

	belongs_to	:album,
							:class_name => "Album",
							:foreign_key => :album_id,
							:primary_key => :id

  has_many	:notes,
  					:class_name => "Note",
  					:foreign_key => :track_id,
  					:primary_key => :id,
  					:dependent => :destroy

	has_one		:band,
						:through => :album,
						:source => :band					
end
