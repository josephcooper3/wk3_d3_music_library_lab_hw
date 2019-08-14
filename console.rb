require('pry')
require_relative('./models/artist')

artist1 = Artist.new({'name' => 'Rolling Stones'})

artist1.save()






binding.pry
nil
