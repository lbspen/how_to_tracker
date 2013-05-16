class Task < ActiveRecord::Base
  validates :title, :presence => true

  attr_accessible :description, :title
end
