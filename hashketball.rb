require "pry"
# Write your code here!
def game_hash {
  home: { 
  team_name: "Brooklyn Nets",
  colors: ["Black", "White"],
  players:  [{ "Alan Anderson"
  number: 0,
  shoe: 16,
  points: 22,
  rebounds: 12,
  assists: 12,
  steals: 3,
  blocks: 1,
  slam_dunks: 1
    },{
  players:  [{ "Reggie Evans",
  number: 30,
  shoe: 14,
  points: 12,
  rebounds: 12,
  assists: 12,
  steals: 12,
  blocks: 12,
  slam_dunks: 7
    },{
  players:  [{ "Brook Lopez",
  number: 11,
  shoe: 17,
  points: 17,
  rebounds: 19,
  assists: 10,
  steals: 3,
  blocks: 1,
  slam_dunks: 15
    },{
  players:  [{ "Mason Plumlee",
  number: 1,
  shoe: 19,
  points: 26,
  rebounds: 11,
  assists: 6,
  steals: 3,
  blocks: 8,
  slam_dunks: 5
    },{
  players:  [{ "Jason Terry",
  number: 31,
  shoe: 15,
  points: 19,
  rebounds: 2,
  assists: 2,
  steals: 4,
  blocks: 11,
  slam_dunks: 1
    }],
    away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: [{ "Jeff Adrien",
    number: 4,
    shoe: 18,
    points: 10,
    rebounds: 1,
    assists: 1,
    steals: 2,
    blocks: 7,
    slam_dunks: 2
    },{
    players: [{ "Bismack Biyombo",
    number: 0,
    shoe: 16,
    points: 12,
    rebounds: 4,
    assists: 7,
    steals: 22,
    blocks: 15,
    slam_dunks: 10
    },{ 
    players: [{ "DeSagna Diop",
    number: 2,
    shoe: 14,
    points: 24,
    rebounds: 12,
    assists: 12,
    steals: 4,
    blocks: 5,
    slam_dunks: 5
    },{
    players: [{ "Ben Gordon",
    number: 8,
    shoe: 15,
    points: 33,
    rebounds: 3,
    assists: 2,
    steals: 1,
    blocks: 1,
    slam_dunks: 0
    },{
    players: [{ "Kemba Walker",
    number: 33,
    shoe: 15,
    points: 6,
    rebounds: 12,
    assists: 12,
    steals: 7,
    blocks: 5,
    slam_dunks: 12
        }]
      {
    }
  }
}
      end
    end
  end
end

def game_hash
  return game_hash
end 

def home_team_name
  return "Brooklyn Nets"
end
game_hash

def home_team_name
  game_hash[:home][:team_name]
end
 
puts home_team_name
# => "Brooklyn Nets"

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

def good_practices
end 
good_practices

def num_points_scored(plyer_name)
  player_name.each do |scored, nums|
    puts nums 
  end
  
  def shoe_size(player_name)
    player_name.collect do |shoe_size, name|
      puts name 
    end 
    
    def team_colors(team_name)
      team_name.each do |colors|
        puts colors 
      end
      
      def team_name
        team_name.each do |game_hash|
          puts game_hash
        end 
        
        def players_numbers(player_name)
          player_name.each do |player, numbers|
            puts numbers
          end 
          
          def players_stats(player_name)
            player_name.each do |player, stats|
              puts stats
            end 
            
        player_stats("Alan Anderson")
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
      
      def big_shoe_rebounds
        shoe.each do |player|
          if player_shoe_size > rebounds
            return rebounds 
            binding.pry 
          end 
          
              
            
    







