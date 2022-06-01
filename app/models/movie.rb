class Movie < ApplicationRecord
    before_create :set_slug
    has_many :ratings
    belongs_to :category
    has_one_attached :preview do |attachable|
        attachable.variant :thumb, resize_to_fill: [150, 150]
        attachable.variant :medium, resize_to_fill: [450, 450]
      end
    def avg_rating
        self.ratings.average(:rating) 
    end
    def to_param
        slug
    end
    private
    def set_slug
        slug = self.title.parameterize
        count = Movie.where("slug LIKE '#{slug}'").count
        self.slug = count.positive? ? "#{slug}-#{count + 1}" : slug
    end
end
