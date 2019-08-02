class User < ApplicationRecord
  
  validates :username, presence: true, uniqueness: true

  has_many :artworks, 
    dependent: :destroy,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :artwork_shares, #returns list of artwork that this use shared
    dependent: :destroy,  
    foreign_key: :viewer_id,
    class_name: :ArtworkShare
    
  has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment,
    dependent: :destroy

  #has many throughs
  has_many :shared_artworks, #returns list of artwork shared with this user
    through: :artwork_shares,
    source: :artwork

end
