# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Room < ApplicationRecord
  has_many :messages
  
  validates :name, presence: true
end
