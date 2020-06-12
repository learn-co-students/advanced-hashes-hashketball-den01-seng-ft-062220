require "pry"

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

# Write code here

def num_points_scored(player_name)
  points_scored = 0
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = (away_players + home_players)
  
  all_players.each do |element|
    element.each do |key, value|
      if element[key] == player_name
      points_scored = element[:points]
      return points_scored
      end
    end
  end
end

def shoe_size(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = (away_players + home_players)
  
  all_players.each do |element|
    element.each do |key, value|
      if element[key] == player_name
      return element[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, value|
    value.each do |key2, value2|
      if value2 == team_name
        return value[:colors]
      end
    end
  end
end

def team_names()
  team_names_array = []
  game_hash.each do |key, value|
    value.each do |key2, value2|
      if key2 == :team_name
        team_names_array.push(game_hash[key][key2])
      end 
    end 
  end 
  return team_names_array
end 

def player_numbers(team_name)
  player_numbers_array = []
  
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |element|
      element.each do |key, value|
        if key == :number
          player_numbers_array.push(value)
        end
      end
    end
  else
    game_hash[:away][:team_name] == team_name
    game_hash[:away][:players].each do |element|
      element.each do |key, value|
        if key == :number
          player_numbers_array.push(value)
        end
      end
    end
  end
  player_numbers_array
end

def player_stats(player_name)
  player_stats_hash= {}
  
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = (away_players + home_players)
  
  all_players.each do |element|
    element.each do |key, value|
      if element[key] == player_name
        player_stats_hash = element
      return player_stats_hash
      end
    end
  end
end

def big_shoe_rebounds()
  biggest_shoe = 0
  result = ""
  
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = (away_players + home_players)
  
  all_players.each do |element|
    element.each do |key, value|
      if key == :shoe
        if value > biggest_shoe
          biggest_shoe = value
          result = element
        end
      end
    end
  end
  return result[:rebounds]
end
