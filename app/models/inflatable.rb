class Inflatable < ApplicationRecord
  def self.cat_array
    ['Air dancer', 'Air mattress' 'laser maze', 'climbing wall', 'Exercise ball', 'airscreen', 'Inflatable boat', 'Inflatable castle', 'Inflatable pool', 'Sex doll', 'Water ball', 'Zeppelin']
  end

  def self.condition_array
    ['like new', 'new', 'uesd', 'save', 'aged', 'frail', 'weak', 'shabby', 'run-down', 'old', 'fragile', 'weather-beaten', 'acceptable', 'exellent', 'bad', 'marvelous', 'satisfying', 'superb', 'wonderfull', 'nice', 'pleasing', 'prime', 'sound', 'super', 'worthy', 'dirty', 'admirable', 'OK', 'poor', 'unacceptable', 'worthless', 'inadequate', 'rotten', 'usable', 'wicked', 'all right', 'good enouugh', 'fine', 'adequate', 'good', 'great', 'neat', 'solid', 'clean', 'comfortable']
  end

  belongs_to :user
  has_one_attached :photo
  has_many :bookings
end
