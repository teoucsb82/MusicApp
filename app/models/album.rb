# == Schema Information
#
# Table name: albums
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  band_id      :integer          not null
#  year         :integer          not null
#  studio_album :boolean          default(TRUE), not null
#  created_at   :datetime
#  updated_at   :datetime
#  image_url    :string(255)
#

class Album < ActiveRecord::Base
	validates :title,					:presence => true
	validates :band_id,				:presence => true, numericality: { only_integer: true }
	validates :year,					:presence => true, numericality: { only_integer: true }
	validates :studio_album,	:presence => true

	has_many		:tracks,
							:class_name => "Track",
							:foreign_key => :album_id,
							:primary_key => :id,
							:dependent => :destroy, 
							:order => 'track_number'
							
	belongs_to	:band,
							:class_name => "Band",
							:foreign_key => :band_id,
							:primary_key => :id
end
