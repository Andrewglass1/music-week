class Signup < ActiveRecord::Base
  attr_accessible :user_id, :date, :album_id
  belongs_to :user
  belongs_to :album
  

  # def self.selectable(user_id)
  #   user= User.find(user_id)
  #   selectable = []
  #   date = Date.today
  #   7.times do
  #     if user.signups.where(date: date).blank? 
  #       selectable << date
  #     end
  #     date += 1
  #   end
  #   selectable
  # end


end
