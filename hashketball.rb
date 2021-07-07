# Write your code below game_hash
require 'pry'
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

def num_points_scored(player_of_interest)
  score = 0  
  game_hash.each do |team, team_data|
    team_data.each do |attribute, info|
      if info.is_a?(Array) && info[0].is_a?(Hash)
        info.each do |player|
          if player[:player_name] == player_of_interest
            score = player[:points] 
          end
        end
      end
    end
  end
  p score 
end

def shoe_size(player_of_interest)
    shoe = 0  
  game_hash.each do |team, team_data|
    team_data.each do |attribute, info|
      if info.is_a?(Array) && info[0].is_a?(Hash)
        info.each do |player|
          if player[:player_name] == player_of_interest
            shoe = player[:shoe] 
          end
        end
      end
    end
  end
  p shoe
end

def team_colors(team_of_interest)
  colors_output = nil 
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_of_interest
      colors_output = team_data[:colors] 
    end
  end
  p colors_output
end


def team_names
  name_array = []
  game_hash.each do |team, team_data|
    name_array << team_data[:team_name]
  end
  p name_array
end

def player_numbers(team_of_interest)
  numbers_array = [] 
  game_hash.each do |team, team_data|
    if team_data[:team_name] == team_of_interest
      team_data.each do |attribute, info|
        if info.is_a?(Array) && info[0].is_a?(Hash)
          info.each do |player| 
            numbers_array << player[:number]
          end
        end
      end 
    end
  end
  p numbers_array
end

 def player_stats(player_of_interest)
    stat_arry = []  
  game_hash.each do |team, team_data|
    team_data.each do |attribute, info|
      if info.is_a?(Array) && info[0].is_a?(Hash)
        info.each do |player|
          if player[:player_name] == player_of_interest
            stat_arry = player 
          end
        end
      end
    end
  end
  p stat_arry
end

def big_shoe_rebounds
    shoe = 0
    rebounds = 0
  game_hash.each do |team, team_data|
    team_data.each do |attribute, info|
      if info.is_a?(Array) && info[0].is_a?(Hash)
        info.each do |player|
          if player[:shoe] > shoe   
            shoe = player[:shoe]
           end
           if player[:shoe] >= shoe
              rebounds = player[:rebounds]
          end
        end
      end
    end
  end
  p rebounds 
end