class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes=(contents)
    contents.each do |c|
      @notes = self.notes.build(content: c)
    end
    @notes
  end

  def song_notes
    @notes
  end

end
