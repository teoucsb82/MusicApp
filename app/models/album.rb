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
	validates :band_id,				:presence => true
	validates :year,					:presence => true
	validates :studio_album,	:presence => true

	belongs_to	:band,
							:class_name => "Band",
							:foreign_key => :band_id,
							:primary_key => :id
end
