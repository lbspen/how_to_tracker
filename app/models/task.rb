class Task < ActiveRecord::Base
  validates :title, :presence => true
  attr_accessible :description, :title

  has_many :steps
end
