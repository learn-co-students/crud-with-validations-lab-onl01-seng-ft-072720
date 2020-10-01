class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {
        scope: [:release_year, :artist_name],
        message: "Cannot release the same song twice in a year."
      }
      validates :released, inclusion: { in: [true, false] }
      validate :release_year_presence
      validates :artist_name, presence: true
      validates :release_year, presence: true, if: :released?

      def release_year_presence
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release year can't be in the future")
        end
    end


end
