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
end
