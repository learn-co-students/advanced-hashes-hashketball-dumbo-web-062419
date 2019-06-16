# Write your code here!
require "pry"

def game_hash
    hash = {
        home: {
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
            players: [
                { name: "Alan Anderson",
                    number: 0,
                    shoe: 16,
                    points: 22,
                    rebounds: 12,
                    assists: 12,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 1,
                },
                { name: "Reggie Evans",
                    number: 30,
                    shoe: 14,
                    points: 12,
                    rebounds: 12,
                    assists: 12,
                    steals: 12,
                    blocks: 12,
                    slam_dunks: 7,
                },
                { name: "Brook Lopez",
                    number: 11,
                    shoe: 17,
                    points: 17,
                    rebounds: 19,
                    assists: 10,
                    steals: 3,
                    blocks: 1,
                    slam_dunks: 15,
                },
                { name: "Mason Plumlee",
                    number: 1,
                    shoe: 19,
                    points: 26,
                    rebounds: 11,
                    assists: 6,
                    steals: 3,
                    blocks: 8,
                    slam_dunks: 5,
                },
                { name: "Jason Terry",
                    number: 31,
                    shoe: 15,
                    points: 19,
                    rebounds: 2,
                    assists: 2,
                    steals: 4,
                    blocks: 11,
                    slam_dunks: 1,
                }
            ]
        },
        away: {
            team_name: "Charlotte Hornets",
            colors: ["Turquoise", "Purple"],
            players: [
                { name: "Jeff Adrien",
                    number: 4,
                    shoe: 18,
                    points: 10,
                    rebounds: 1,
                    assists: 1,
                    steals: 2,
                    blocks: 7,
                    slam_dunks: 2,
                },
                { name: "Bismack Biyombo",
                    number: 0,
                    shoe: 16,
                    points: 12,
                    rebounds: 4,
                    assists: 7,
                    steals: 22,
                    blocks: 15,
                    slam_dunks: 10,
                },
                { name: "DeSagna Diop",
                    number: 2,
                    shoe: 14,
                    points: 24,
                    rebounds: 12,
                    assists: 12,
                    steals: 4,
                    blocks: 5,
                    slam_dunks: 5,
                },
                { name: "Ben Gordon",
                    number: 8,
                    shoe: 15,
                    points: 33,
                    rebounds: 3,
                    assists: 2,
                    steals: 1,
                    blocks: 1,
                    slam_dunks: 0,
                },
                { name: "Kemba Walker",
                    number: 33,
                    shoe: 15,
                    points: 6,
                    rebounds: 12,
                    assists: 12,
                    steals: 7,
                    blocks: 5,
                    slam_dunks: 12
                }
            ]
        }
    }
end

def num_points_scored(name)

    game_hash.each do |location, location_data|
        location_data[:players].each do |stat|
            if stat[:name] == name 
            return stat[:points]
            end
        end
    end
end


def shoe_size(name)
    game_hash.each do |location, location_data|
        location_data[:players].each do |stat|
            if stat[:name] == name 
            return stat[:shoe]
            end
        end
    end
end

def team_colors(team_name)
    game_hash.each do |location, location_data|
        if location_data[:team_name] == team_name
           return location_data[:colors]
        end
    end
end

def team_names
    team_names_array = []
    game_hash.each do |location, location_data|
        team_names_array << location_data[:team_name]
    end
    return team_names_array
end

def player_numbers(team_name)

    jerseys = []

    game_hash.each do |location, location_data|
        if location_data[:team_name] == team_name
            location_data[:players].each do |stat|
                jerseys << stat[:number]
            end
        end
    end
    return jerseys
end

def player_stats(player)
    #returns a HASH of that players stats
    game_hash.each do |location, location_data|
        location_data[:players].each do |stat|
            if stat[:name] == player
             stat.delete(:name)
             return stat
            end
        end
    end
end



def big_shoe_rebounds
    all_players = game_hash[:home][:players] + game_hash[:away][:players]
    largest_shoe = all_players.max {|player1, player2| player1[:shoe] <=> player2[:shoe]}
    return largest_shoe[:rebounds]
end


def most_points_scored
    all_players = game_hash[:home][:players] + game_hash[:away][:players]
    most_points = all_players.max {|player1, player2| player1[:points] <=> player2[:points]}
    return most_points[:name]
end

def winning_team
   home_team = game_hash[:home][:players]
   away_team = game_hash[:away][:players]

    home_points = []
    away_points = []

    home_team.collect {|stat| home_points << stat[:points]}
    away_team.collect {|stat| away_points << stat[:points]}

   home_final = home_points.inject(:+)
   away_final = away_points.inject(:+)

    if home_final > away_final
        return game_hash[:home][:team_name]
     else
        return game_hash[:away][:team_name]
    end

end

def player_with_longest_name
    all_players = game_hash[:home][:players] + game_hash[:away][:players]
    largest_name = all_players.max {|player1, player2| player1[:name].size <=> player2[:name].size}
    return largest_name[:name]
end

def long_name_steals_a_ton?
    #returns true if the longest name player also had the most steals
    all_players = game_hash[:home][:players] + game_hash[:away][:players]
    most_steals = all_players.max {|player1, player2| player1[:steals] <=> player2[:steals]}

    if most_steals[:name] == player_with_longest_name
        return true
    end

end






=begin

def good_practices
    game_hash.each do |location, team_data|
      #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
      binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
   
        #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
        end
      end
   end
end

good_practices

  good_practices run 'ruby hashketball.rb' in console to work with pr
=end
