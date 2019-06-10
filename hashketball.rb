require 'pry'

def game_hash
game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players =>
    [
      {
      "Alan Anderson" =>
      {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
      }
    },
      {
      "Reggie Evans" =>
      {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
      }
      },
      {
        "Brook Lopez" =>
      {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
      }
      },
      {
        "Mason Plumlee" =>
      {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
      }
      },
      {
          "Jason Terry" =>
      {
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
      }
      }
    ]
  },
  :away =>
    {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players =>
     [
        {
          "Jeff Adrien" =>
        {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
        }
        },
        {
          "Bismack Biyombo" =>
        {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
        }
        },
        {
          "DeSagna Diop" =>
        {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
        }
        },
        {
          "Ben Gordon" =>
        {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
        }
        },
        {
          "Kemba Walker" =>
        {
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
        }
        }
    ]
   }
  }
end

def num_points_scored(name)
  i = 0
  game_hash.each do |location, team_data|
    team_data.each do |key, value|
       if key == :players
         value.each do |player|
            player.each do |player_name, stats|
               if player_name == name
                 i = stats[:points]
               end
            end
          end
        end
      end
  end
  i
end

def shoe_size(name)
  i = 0
  game_hash.each do |location, team_data|
    team_data.each do |key, value|
       if key == :players
         value.each do |player|
            player.each do |player_name, stats|
               if player_name == name
                 i = stats[:shoe]
               end
            end
          end
        end
      end
   end
  i
end

def team_colors(team)
  game_hash.each do |location, team_data|
      if team_data[:team_name] == team
        return team_data[:colors]
    end
  end
end

def team_names
  name_array = []
    game_hash.each do |location, team_data|
      name_array << team_data[:team_name]
    end
  name_array
end

def player_numbers(team)
  jersey_num_array = []
    game_hash.each do |location, team_data|
      if team_data[:team_name] == team
        #binding.pry
         team_data.each do |key, value|
          if key == :players
           #binding.pry
            value.each do |player|
             player.each do |player_name, stats|
            jersey_num_array << stats[:number]
              end
            end
          end
        end
      end
   end
  jersey_num_array
end


def player_stats(name)
  game_hash.each do |location, team_data|
     team_data.each do |key, value|
       if key == :players
         value.each do |player|
           player.each do |player_name, stats|
             if player_name == name
               return stats
             end
           end
         end
       end
     end
  end
end

def big_shoe_rebounds
  game_hash.each do |location, team_data|
    team_data.each do |key, value|
      if key == :players
        value.each do |player|

          #binding.pry
            greatest_key = !nil
            greatest_value = !nil
            player.each do |player_name, stats|
            if greatest_value == !nil || stats[:shoe_size] > greatest_value
              binding.pry
              greatest_key = a
              greatest_value = b
            end
          end
        end
      end
    end
  end
  return stats[:rebounds]
end

def most_points_scored

end
