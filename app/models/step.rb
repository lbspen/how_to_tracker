class Step < ActiveRecord::Base
  belongs_to :task
  validates :number, :summary, :presence => true
  validates :number, :numericality => { :only_integer => true, :greater_than => 0 }
  attr_accessible :description, :number, :summary
end
