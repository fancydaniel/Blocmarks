class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates_length_of :title, :minimum => 3, :message => "Minimum topic length is 3 characters."

  belongs_to :user
   has_many :bookmarks

end
