class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :inflatable
  enum status: { rejected: 2, accepted: 1, pending: 0 }
end
