class Song < ApplicationRecord
    validates :title, presence: true #must not be blank
    validates :title, uniqueness: {
        scope: [:release_year, :artist_name],
        message: "cannot be repeated by the same artist in the same year"} #cannot repeat title in the same year
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true #must not be blank

    with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
end

def released?
  released
end
end