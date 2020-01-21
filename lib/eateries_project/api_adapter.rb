class EateriesProject::APIAdapter
    ENV['API_KEY']
    URL = "https://developers.zomato.com/api/v2.1/search?entity_id=10978&entity_type=city"
    def self.get_eatery
        response = RestClient.get(URL, {"user-key": ENV['API_KEY']})
        resp_hash = JSON.parse(response.body)

        resp_hash["restaurants"].each do |restaurant|
            EateriesProject::Eateries.new(restaurant["restaurant"])
        end 
    end
end