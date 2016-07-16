class Order < ActiveRecord::Base
	  belongs_to :user
      belongs_to :post

  validates_presence_of :phone_number
  validates_presence_of :color
  validates_presence_of :body


end