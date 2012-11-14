class Status < ActiveRecord::Base
  attr_accessible :name, :posted_date, :status, :description, :subway_line_id
  belongs_to :subway_line
end
