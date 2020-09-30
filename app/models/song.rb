class Song < ApplicationRecord
    validates :title, presence: true
    validate :unique?
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    validate :from_the_future?
    validates :artist_name, presence: true
end

private

    def unique?
        if Song.all.any? do |song| 
                song.title == title && 
                song.artist_name == artist_name && 
                song.release_year == release_year
            end
                errors.add(:title, "cannot be repeated by the same artist in the same year")
        end
    end

    def from_the_future?
        unless !!release_year == false
            if release_year > Time.now.year
                errors[:release_year] << "cannot be in the future"
            end
        end

    end
