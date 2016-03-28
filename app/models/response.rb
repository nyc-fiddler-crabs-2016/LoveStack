class Response < ActiveRecord::Base
  belongs_to :responsible, polymorphic: true
  belongs_to :user

end
