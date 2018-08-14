class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name= (name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.present? ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.present? ? self.genre.name : nil
  end

  def note_contents
    self.notes.present? ? self.notes.map(&:content) : []
  end

  def note_contents=(notes)
    notes.each do |content|
      self.notes << Note.create(content: content) if content.present?
    end
  end
  
end

