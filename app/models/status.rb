class Status < ActiveRecord::Base
  attr_accessible :name, :posted_date, :status, :description
end
