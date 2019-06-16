# Write your code here!
def game_hash
	game_hash = {
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: [{player_name: "Alan Anderson",
								number: 0,
								shoe: 16,
								points: 22,
								rebounds: 12,
								assists: 12,
								steals: 3,
								blocks: 1,
								slam_dunks: 1},
								{player_name: "Reggie Evans",
								number:	30,
								shoe:	14,
								points:	12,
								rebounds:	12,
								assists: 12,
								steals:	12,
								blocks:	12,
								slam_dunks:	7},
								{player_name: "Brook Lopez",
									number: 11,
									shoe: 17,
									points: 17,
									rebounds: 19,
									assists: 10,
									steals: 3,
									blocks: 1,
									slam_dunks: 15},
								{player_name: "Mason Plumlee",
									number: 1,
									shoe: 19,
									points: 26,
									rebounds: 11,
									assists: 6,
									steals: 3,
									blocks: 8,
									slam_dunks: 5},
								{player_name: "Jason Terry",
									number: 31,
									shoe: 15,
									points: 19,
									rebounds: 2,
									assists: 2,
									steals: 4,
									blocks: 11,
									slam_dunks: 1}]
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
				slam_dunks: 10,
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
			}]
		}
	}
end

def num_points_scored(player_name)
	points = 0
	found = false
	game_hash[:home][:players].each do |player|
		if player[:player_name] == player_name
			points = player[:points]
			found = true
			break
		end
	end
	unless found == true
		game_hash[:away][:players].each do |player|
			if player[:player_name] == player_name
				points = player[:points]
				break
			end
		end
	end
	points
end

def shoe_size(player_name)
	points = 0
	found = false
	game_hash[:home][:players].each do |player|
		if player[:player_name] == player_name
			points = player[:shoe]
			found = true
			break
		end
	end
	unless found == true
		game_hash[:away][:players].each do |player|
			if player[:player_name] == player_name
				points = player[:shoe]
				break
			end
		end
	end
	points
end

def team_colors(team)
	gameh = game_hash
	if gameh[:home][:team_name] == team
		gameh[:home][:colors]
	else
		gameh[:away][:colors]
	end
end

def team_names
	game_hash.map{|k, v| v[:team_name]}
end

def player_numbers(team)

	gameh = game_hash
	if gameh[:home][:team_name] == team
		gameh[:home][:players].map{|player| player[:number]}
	else
		gameh[:away][:players].map{|player| player[:number]}
	end
end

def player_stats(player_name)
	stats = 0
	found = false
	game_hash[:home][:players].each do |player|
		if player[:player_name] == player_name
			stats = player
			found = true
			break
		end
	end
	unless found == true
		game_hash[:away][:players].each do |player|
			if player[:player_name] == player_name
				stats = player
				break
			end
		end
	end
	stats.delete(:player_name)
	stats
end

def big_shoe_rebounds
	max = game_hash[:home][:players][0][:shoe]
	player_pos = ""
	team = ""
	game_hash[:home][:players].each_with_index do |player, i|
		if player[:shoe] > max
			max = player[:shoe]
			player_pos = i
			team = :home
		end
	end
	game_hash[:away][:players].each_with_index do |player, i|
		if player[:shoe] > max
			max = player[:shoe]
			player_pos = i
			team = :away
		end						
	end
	game_hash[team][:players][player_pos][:rebounds]
end

def most_points_scored
	max = game_hash[:home][:players][0][:points]
	player_name = ""
	game_hash[:home][:players].each_with_index do |player, i|
		if player[:points] > max
			max = player[:points]
			player_name = player[:player_name]
		end
	end
	game_hash[:away][:players].each_with_index do |player, i|
		if player[:points] > max
			max = player[:points]
			player_name = player[:player_name]
		end						
	end
	player_name
end

def winning_team
	home_points = 0
	away_points = 0
	game_hash[:home][:players].each_with_index do |player, i|
		home_points += player[:points]
	end
	game_hash[:away][:players].each_with_index do |player, i|
		away_points += player[:points]		
	end
	
	home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
	max = game_hash[:home][:players][0][:player_name].length
	player_name = ""
	game_hash[:home][:players].each_with_index do |player, i|
		if player[:player_name].length > max
			max = player[:player_name].length
			player_name = player[:player_name]
		end
	end
	game_hash[:away][:players].each_with_index do |player, i|
		if player[:player_name].length > max
			max = player[:player_name].length
			player_name = player[:player_name]
		end						
	end
	player_name
end

def long_name_steals_a_ton?
	long_name = player_with_longest_name
	num_steals = 0
	is_max = true
	# get the number of steals for that player
	game_hash.each do |key,loc|
		loc[:players].each do |player|
			if player[:player_name] == long_name
				num_steals = player[:steals]
			end
		end
	end

		# test if this number of steals is max
	game_hash[:home][:players].each do |player|
		if player[:steals] > num_steals
			is_max = false
		end
	end
	unless is_max
		game_hash[:away][:players].each do |player|
			if player[:steals] > num_steals
				is_max = false
			end						
		end
	end
	is_max
end