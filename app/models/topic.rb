class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  validates :title, presence: true
  validates_length_of :title, :minimum => 3, :message => "Minimum topic length is 3 characters."

  belongs_to :user
   has_many :bookmarks

  #  def should_generate_new_friendly_id?
  #   new_record?
  #  end
  
end
