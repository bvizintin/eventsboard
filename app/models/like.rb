class Like < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :event         # ovom linijom dozvoljavamo samo jedan like/dislike po useru po eventu
end
