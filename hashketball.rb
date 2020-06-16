require 'pry'

# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
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
      players: [
        {
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
        }
      ]
    }
  }
end

def num_points_scored(name)
game = game_hash
count = 0
while count < 6 do
  #binding.pry
  if game[:home][:players][count][:player_name] == name
    result = game[:home][:players][count][:points] 
    return result
  end
  if game[:away][:players][count][:player_name] == name
    #binding.pry
    result = game[:away][:players][count][:points]
    return result
  end
  count +=1
end
end

def shoe_size(name)
game = game_hash
count = 0
while count < 6 do
  #binding.pry
    if game[:home][:players][count][:player_name] == name
    result = game[:home][:players][count][:shoe] 
    return result
  end
  if game[:away][:players][count][:player_name] == name
    #binding.pry
    result = game[:away][:players][count][:shoe]
    return result
  end
  count +=1
end
end

def team_colors(team)
  game_hash.each do |location,team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  result_array = []
  game_hash.each do |location,team_data|
    result_array << team_data[:team_name]
  end
  result_array
end

def player_numbers(team)
  result_array = []
  count = 0
  game_hash.each do |location,team_data|
    #binding.pry
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
       #binding.pry
        if attribute == :players
         while count < 5 do 
            result_array << team_data[:players][count][:number]
            count += 1
          #binding.pry
         end
       #binding.pry
       end
      end
   end
 end
  #binding.pry
  result_array
end

def player_stats(name)
  game = game_hash
count = 0
while count < 6 do
  #binding.pry
  if game[:home][:players][count][:player_name] == name
    result = game[:home][:players][count] 
    return result
  end
  if game[:away][:players][count][:player_name] == name
    #binding.pry
    result = game[:away][:players][count]
    return result
  end
  count +=1
end
  
end

def big_shoe_rebounds
  game = game_hash
count = 0
max_size = 0
result = 0
while count < 5 do
  #binding.pry
  if game[:home][:players][count][:shoe] > max_size
    max_size = game[:home][:players][count][:shoe]
    #binding.pry
    result = game[:home][:players][count][:rebounds] 
    #binding.pry
  end
  if game[:away][:players][count][:shoe] > max_size
    max_size = game[:away][:players][count][:shoe]
    result = game[:away][:players][count][:rebounds]
  end
  count +=1
  #binding.pry
end
binding.pry
result
end