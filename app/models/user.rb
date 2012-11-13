class User < ActiveRecord::Base
  attr_accessible :email, :number, :subway_id
  belongs_to :subway_line
end
