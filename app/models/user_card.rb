class UserCard < ApplicationRecord
  belongs_to :user
  belongs_to :club_card
end
