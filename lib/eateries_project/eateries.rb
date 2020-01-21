class EateriesProject::Eateries
    attr_accessor :name, :url, :location, :address, :cuisines, :price_range, :highlights, :user_rating, :aggregate_rating

    @@all = []

    def initialize(attr_hash)
        attr_hash.each do |k, v| 
            self.send("#{k}=", v) if self.respond_to? k 
        end
        @@all << self
    end

    def self.all
        @@all
    end
end
