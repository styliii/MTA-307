class User < ActiveRecord::Base
  attr_accessible :email, :number, :subway_line_id
  belongs_to :subway_line

  def self.authenticate(email)
    user = find_by_email(email)
    if user
      user
    else
      nil
    end
  end
end
