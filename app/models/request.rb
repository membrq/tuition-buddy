class Request < ApplicationRecord
  belongs_to :user

  default_scope { order('created_at DESC') }

  validates_presence_of :user_id #add more?

end
