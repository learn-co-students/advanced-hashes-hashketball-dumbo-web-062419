####################################
# Try to redo this lab with .select & .map
# #game_hash created below
def game_hash
    game_hash = {
        home: {
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            players: [{
                player_name: "Alan Anderson",
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1
            },
            {
                player_name: "Reggie Evans",
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7
            },
            {
                player_name: "Brook Lopez",
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15
            },
            {
                player_name: "Mason Plumlee",
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5
            },
            {
                player_name: "Jason Terry",
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1
            }
            ]
        },
        away: {
            team_name: "Charlotte Hornets",
            colors: ["Turquoise", "Purple"],
            players: [{
                player_name: "Jeff Adrien",
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2
            },
            {
                player_name: "Bismack Biyombo",
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10
            },
            {
                player_name: "DeSagna Diop",
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5
            },
            {
                player_name: "Ben Gordon",
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0
            },
            {
                player_name: "Kemba Walker",
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12
            },
            ]
        },
    }

end

# Takes in an argument of a player's name and returns the number of points scored for that player
def num_points_scored_select(player_name)

    chosen_player = game_hash[:home][:players].select do |player_data|
        player_data[:player_name] == player_name
    end
    
    if chosen_player.length == 0
        chosen_player = game_hash[:away][:players].select do |player_data|
            player_data[:player_name] == player_name
        end
    end

    chosen_player[0][:points]
end

# Invoking method below to test
puts num_points_scored_select("Alan Anderson")


# Takes in an argument of a player's name and returns the shoe size for that player
def shoe_size(player_name)
    # Stores return value
    shoe_size = nil

    # Iterates through game_hash. Location is :home or :away
    game_hash.each do |location, team_data|
        # Iterates through team data. Attribute is :team_name, :colors or :players
        team_data.each do |attribute, data|
            # Iterates through team_data. Only iterates onto next level if data is a hash or array
            if data.class == Hash || data.class == Array
                data.each do |data_item|
                    # binding.pry
                    # If data_item is a hash and data_item[:player_name] is same as that which is passed as a parameter, assign shoe_size to the corresponding key-pair value
                    if data_item.class == Hash && data_item[:player_name] == player_name
                        shoe_size = data_item[:shoe]

                    end
                end
            end
        end
    end

    # Return value
    shoe_size
end


# #map TRANSFORMS the collection
mystery_variable_1 = [1,2,3,4,5].map do |num|
    num * 2
end
# Returns [2,4,6,8,10]

# #select returns a new array that is FILTERED baed on the logic in the block
mystery_variable_2 = [1,2,3,4,5].select do |num|
    num.even?
end
# => [2,4]
# mystery_variable_2 = [2,4]

# #find will return the first block that returns true in the iteration
mystery_variable_3 = [1,2,3,4,5].find do |num|
    num == 4
end
# Returns => 4