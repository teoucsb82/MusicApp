# == Schema Information
#
# Table name: bands
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#  image_url  :string(255)
#

class Band < ActiveRecord::Base
	validates :name,	:presence => true

	has_many	:albums, :dependent => :destroy, :order => 'year'
end
