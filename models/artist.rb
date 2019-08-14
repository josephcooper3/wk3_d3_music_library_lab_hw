require_relative('../db/sql_runner')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save
    sql = "
    INSERT INTO artists (name)
    VALUES ($1)
    RETURNING id
    "

    values = [@name]
    result  = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def Artist.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def Artist.all
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new(artist) }
  end

  def  all_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values =[@id]
    albums_data = SqlRunner.run(sql, values)
    albums = albums_data.map { |album_data| Album.new(album_data)}
    return albums

  end
  
end
