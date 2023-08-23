class Show < ActiveRecord::Base
    def Show.highest_rating
        self.maximum(:rating)
    end

    def self.most_popular_show
        self.where("rating = ?", highest_rating).first
    end

    def Show.lowest_rating
        Show.minimum(:rating)
    end

    def self.least_popular_show
        Show.where("rating = ?", lowest_rating).first
    end

    def Show.ratings_sum
        Show.sum(:rating)
    end

    def self.popular_shows
        self.where("rating > ?", 5)
    end
    
    def Show.shows_by_alphabetical_order
        self.order(:name)
    end
end