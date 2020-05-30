class Inflatable < ApplicationRecord
  # PgSearch
  #--------------------------------------#

  include PgSearch::Model
  pg_search_scope :global_search, against: [ :category, :name, :description ], associated_against: { user: [ :first_name, :last_name, :username, :email ]}, using: { tsearch: { prefix:true } }

  #--------------------------------------#

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def self.cat_array
    ['Air dancer', 'Air mattress' 'laser maze', 'climbing wall', 'Exercise ball', 'airscreen', 'Inflatable boat', 'Inflatable castle', 'Inflatable pool', 'Sex doll', 'Water ball', 'Zeppelin', 'other']
  end

  def self.condition_array
    ['weather-beaten', 'acceptable', 'marvelous', 'satisfying', 'worthless', 'solid', 'stela', 'orgasmic', 'filthy', 'outrageous']
  end

  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  validates :name, presence: true#, uniqueness: { scope: :category, message: "name should be unique in #{category}"}
  validates :category, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :condition, presence: true
  validates :user_id, presence: true
end
