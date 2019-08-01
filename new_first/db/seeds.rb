# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all

  fue = User.create!(username: 'fue')
  aaron = User.create!(username: 'ayron')
  mike = User.create!(username: 'coolboi420')

  art1 = Artwork.create!(title: 'Mona Lisa', image_url: 'www.fue_mona_lisa.com', artist_id: fue.id )
  art2 = Artwork.create!(title: 'Mona Lisa', image_url: 'www.aaron_mona_lisa.com', artist_id: aaron.id )
  art3 = Artwork.create!(title: 'Superman', image_url: 'www.Superman.com', artist_id: fue.id )
  art4 = Artwork.create!(title: 'Dr. Manhatten', image_url: 'www.BlueMan.com', artist_id: aaron.id )
  art5 = Artwork.create!(title: 'Mars', image_url: 'www.Mars.com', artist_id: mike.id )

  share1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: aaron.id )
  share2 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: fue.id )
  share3 = ArtworkShare.create!(artwork_id: art3.id, viewer_id: mike.id )
  share4 = ArtworkShare.create!(artwork_id: art3.id, viewer_id: aaron.id )
  share5 = ArtworkShare.create!(artwork_id: art4.id, viewer_id: fue.id )
  share6 = ArtworkShare.create!(artwork_id: art4.id, viewer_id: aaron.id )
  share7 = ArtworkShare.create!(artwork_id: art5.id, viewer_id: fue.id )

end
