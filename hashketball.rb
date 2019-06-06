require "pry"

def game_hash
{
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      "Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      "Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 12,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    }
  },
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      "Bismack Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10
      },
      "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      "Kemba Walker" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12
      }
    }
  }
}
end


def num_points_scored (name)
  if game_hash[:home][:players].include?(name)
    game_hash[:home][:players][name][:points]
  elsif game_hash[:away][:players].include?(name)
    game_hash[:away][:players][name][:points]
  else
    "none found"
  end
end

def shoe_size (name)
  if game_hash[:home][:players].include?(name)
    game_hash[:home][:players][name][:shoe]
  elsif game_hash[:away][:players].include?(name)
    game_hash[:away][:players][name][:shoe]
  else
    "none found"
  end
end

def team_colors(teams_name)
  if game_hash[:home][:team_name] == teams_name
    game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == teams_name
    game_hash[:away][:colors]
  else
    "none found"
  end
end

def team_names
  result = []
  result << game_hash[:home][:team_name]
  result << game_hash[:away][:team_name]
  result
end

def player_numbers(teams_name)
  numbers_ar = []
  game_hash.each do |team_pos, team_data|
    if team_data[:team_name] == teams_name
      team_data[:players].each do |player_name, player_n|
        numbers_ar << player_n[:number]
      end
    end
  end
  numbers_ar
end

def player_stats(name)
  game_hash.each do |team_pos, team_data|
    team_data[:players].each do |player_name, player_stats|
      return team_data[:players][name] if player_name == name
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  biggest_shoe_rebounds = 0
  game_hash.each do |team_pos, team_data|
    team_data[:players].each do |player_name, player_stats|
      if team_data[:players][player_name][:shoe] > biggest_shoe
        biggest_shoe = team_data[:players][player_name][:shoe]
        biggest_shoe_rebounds = team_data[:players][player_name][:rebounds]
      end
    end
  end
  biggest_shoe_rebounds
end

def most_points_scored
  most_points = 0
  most_points_name = ""
  game_hash.each do |team_pos, team_data|
    team_data[:players].each do |player_name, player_stats|
      if team_data[:players][player_name][:points] > most_points
        most_points = team_data[:players][player_name][:points]
        most_points_name = player_name
      end
    end
  end
  most_points_name
end

def winning_team
  brooklyn_points = 0
  charlotte_points = 0
  game_hash.each do |team_pos, team_data|
    team_data[:players].each do |player_name, player_stats|
      if team_pos == :home
        brooklyn_points += team_data[:players][player_name][:points]
      else
        charlotte_points += team_data[:players][player_name][:points]
      end
    end
  end
  return "Brooklyn Nets" if brooklyn_points > charlotte_points
end

def player_with_longest_name
  longest_name_count = 0
  longest_name = ""

  game_hash.each do |team_pos, team_data|
    team_data[:players].each_key do |player_name|
      if player_name.size > longest_name_count
        longest_name_count = player_name.size
        longest_name = player_name
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  most_steals_name = ""
  game_hash.each do |team_pos, team_data|
    team_data[:players].each_key do |player_name, player_stats|
      if team_data[:players][player_name][:steals] > most_steals
        most_steals = team_data[:players][player_name][:steals]
        most_steals_name = player_name
      end
    end
  end
  player_with_longest_name == most_steals_name
end
