class EateriesProject::CLI
    def start 

        reap = EateriesProject::APIAdapter.get_eatery
        main_menu
    end  
    
    def main_menu
        puts ""
        puts "Welcome to the Ft. Worth Eatery Database or F.W.E.D."
        list_eateries 
    end

    def user_prompt
        puts ""
        puts "Please pick a Eatery : "
        puts "Type exit to exit the program."
    end

    def list_eateries
        EateriesProject::Eateries.all.each.with_index(1) do |eatery, index|
            puts ""
            puts "#{index}. #{eatery.name}"
        end
        user_prompt
        get_user_input
    end

    def get_user_input 
        input = gets.chomp
        validaie_input(input) 
        eatery = get_eatery(input.to_i - 1) 
        show_info(eatery)
        continue_prompt
    end

    def continue_prompt
        puts "Would you like to continue?? (y / n)"
        puts ""
        if gets.chomp.downcase == "n"
            exit_database
        else 
            list_eateries
        end
    end

    def validaie_input(input)
        if input.downcase == "exit"
            exit_database
        elsif !input.to_i.between?(1, EateriesProject::Eateries.all.length)
            puts "Not valid - Please choose a number given within the database."
            get_user_input
        end 
    end 

    def exit_database
        puts ""
        puts "Thank you for using F.W.E.D!"
        puts ""
        exit
    end

    def get_eatery(index)
        EateriesProject::Eateries.all[index]
    end

    def show_info(e) 
        puts ""
        puts "-------------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts ""
        puts "Details for #{e.name}"
        puts ""
        puts ""
        puts "Cuisines : #{e.cuisines}"
        puts ""
        puts "Price Range : #{e.price_range}"
        puts ""
        puts ""
        print location_hash(e.location)
        puts ""
        puts ""  
        print rating_hash(e.user_rating)
        puts ""
        puts ""
        puts "URL : #{e.url}"
        puts ""
        puts "-------------------------------------------------------------------------------------------------------------------------------------------------------------"
        puts ""
    end

    def location_hash(location) 
        puts "Location Details : "
        puts ""
        puts "  Address : #{location["address"]}"
        puts ""
        puts "  Locality : #{location["locality"]}"
    end

    def rating_hash(rating)
        puts "Aggeregate Rating : #{rating["aggregate_rating"]}"
        puts ""
        puts "  Votes : #{rating["votes"]}"
        puts ""
        puts "  Overall Rating : #{rating["rating_text"]}"
    end
end
