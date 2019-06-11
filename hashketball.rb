# Write your code here!

require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 12,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ]
    },

    away: { team_name: 'Charlotte Hornets',
            colors: ["Turquoise", "Purple"],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] }
}
end

# def home_team_name
#   puts game_hash[:home][:team_name]
# end
#
# home_team_name


def num_points_scored(player_name)
  points = nil
  game_hash.each do |location, team_data|
    team_data.each do |data, values|
        if data == :players
          values.each do |value, stat|
            if value[:player_name] == player_name
              points  = value[:points]
            end
          end
        end
      end
  end
  points
end


def shoe_size(player_name)
  shoe_size = nil

  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      if data == :players
        #binding.pry
        values.each do |value, stat|
          if value[:player_name] == player_name
            shoe_size = value[:shoe]
          end
        end
      end
    end
  end
  shoe_size
end



def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      if values == team_name
        return team_data[:colors]
      end
    end
  end
end



def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end


def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |data, values|
        if data == :players
          values.each do |value|
            #binding.pry
            numbers << value[:number]
          end
        end
      end
    end
  end
  numbers
end

# def player_stats(player_name)
#   final_hash = {}
#   game_hash.each do |location, team_data|
#     team_data.each do |data|
#       binding.pry
#       if team_data[:players] == player_name
#
#       end
#     end
#     binding.pry
#   end
# end


def big_shoe_rebounds
  biggest_shoe = 0

  game_hash.each do |location, team_data|
    team_data.each do |data, values|
      while data == :players
        values.each do |value|
          #binding.pry
          if value[:shoe] == 0 || value[:shoe] > biggest_shoe
            biggest_shoe = value[:shoe]
            return value[:rebounds]
          end
          #binding.pry
        end
      end
    end
  end
end


def most_points_scored
  most_points = 0
  player = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:points] > most_points
        most_points = data[:points]
        player = data[:player_name]
      end
    end
  end

  return player
end


def winning_team
  winning_team = nil
  most_team_points = 0
  team_points = 0

  game_hash.each do |location, team_data|
    team_data.each do |data, values|
        #binding.pry
      team_data[:players].each do |data|
          team_points += data[:points]
        #binding.pry
      end
    end

    if team_points > most_team_points
      most_team_points = team_points
      winning_team = team_data[:team_name]
    end
  end

  winning_team
end


def player_with_longest_name
  longest_name = ""
  player = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |data|
      if data[:player_name].length > longest_name
        longest_name = data[:player_name]
        player = data[:player_name]
      end
      #binding.pry
    end
  end
  player
end
