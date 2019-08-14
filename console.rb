require('pry')
require_relative('./models/artist')
require_relative('./models/album')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'Rolling Stones'})

artist1.save()

album1 = Album.new({
  'title' => 'Greatest Hits',
  'genre' => 'rock',
  'artist_id' => artist1.id()
  })

  album1.save()






binding.pry
nil
