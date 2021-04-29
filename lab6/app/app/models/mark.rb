class Mark < ActiveRecord::Base
  belongs_to :report
  validates_numericality_of :points, less_than: 101, greater_than_or_equal_to: 0

end
