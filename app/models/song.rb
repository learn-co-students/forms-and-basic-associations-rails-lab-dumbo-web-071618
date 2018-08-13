class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def note_contents=(notes)
    notes.each do |n|
      if n != ""
        new_note = Note.new(content: n)
        self.notes << new_note
      end
    end
  end

  def notes=(contents)
    contents.each do |c|
      self.notes << Note.new(content: c)
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end
  end

end

