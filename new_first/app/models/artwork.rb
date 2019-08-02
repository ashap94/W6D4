class Artwork < ApplicationRecord

  validates :title, presence: true, uniqueness: { scope: :artist_id, message: "Artwork title has to be unique to the artist" }
  validates :image_url, presence: true


  belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    dependent: :destroy,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

  #has many throughs
  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
end
