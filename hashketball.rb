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

class Team
  attr_accessor :name, :location, :colors, :players

  @@all = []

  def initialize name
    @name = name
    @players = []
    @colors = []
    @@all << self
  end

  def self.all
    @@all
  end

  def add_player player
    new_player = Player.new(player, self)
    @players << new_player
    new_player
  end

  def self.get_team_by_name team_name
    all.find { |team| team.name == team_name }
  end

end

class Player
  attr_accessor :name, :number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks, :team

  @@all = []

  def initialize name, team
    @name = name
    @team = team
    @@all << self
  end

  def self.all
    @@all
  end

  def self.get_player_by_name player_name
    all.find { |player| player.name == player_name }
  end

  def player_stats_hash
    player = {}
    new_player = self
    player[:player_name] = new_player.name
    player[:number] = new_player.number
    player[:shoe] = new_player.shoe
    player[:points] = new_player.points
    player[:rebounds] = new_player.rebounds
    player[:assists] = new_player.assists
    player[:steals] = new_player.steals
    player[:blocks] = new_player.blocks
    player[:slam_dunks] = new_player.slam_dunks
    player
  end
end

def player_array
  game_hash.map do |_, team|
    team[:players]
  end.flatten
end

def hash_to_class
  game_hash.each do |location|
    new_team = Team.new(location[1][:team_name])
    new_team.location = location[0]
    new_team.colors = location[1][:colors]
    location[1][:players].each do |player|
      new_player = new_team.add_player player[:player_name]
      new_player.number = player[:number]
      new_player.shoe = player[:shoe]
      new_player.points = player[:points]
      new_player.rebounds = player[:rebounds]
      new_player.assists = player[:assists]
      new_player.steals = player[:steals]
      new_player.blocks = player[:blocks]
      new_player.slam_dunks = player[:slam_dunks]
    end
  end
end

hash_to_class

def num_points_scored player_name
  Player.get_player_by_name(player_name).points
end

def shoe_size player_name
  Player.get_player_by_name(player_name).shoe
end

def team_colors team_name
  Team.get_team_by_name(team_name).colors
end

def team_names
  Team.all.map(&:name)
end

def player_numbers team_name
  Team.get_team_by_name(team_name).players.map(&:number)
end

def player_stats player_name
  Player.get_player_by_name(player_name).player_stats_hash
end

def big_shoe_rebounds
  Player.all.max_by(&:shoe).rebounds
end

# def get_player_by_name player_name
#   player_array.find do |player|
#     player[:player_name] == player_name
#   end
# end

# def num_points_scored player_name
#   get_player_by_name(player_name)[:points]
# end

# def shoe_size player_name
#   get_player_by_name(player_name)[:shoe]
# end

# def team_colors(team_name)
#   game_hash.each do |_location, team_data|
#     return team_data[:colors] if team_data[:team_name] == team_name
#   end
# end

# def team_names
#   result_array = []
#   game_hash.each do |_location,team_data|
#     result_array << team_data[:team_name]
#   end
#   result_array
# end

# def player_numbers(team)
#   result_array = []
#   count = 0
#   game_hash.each do |_location,team_data|
#     if team_data[:team_name] == team
#       team_data.each do |attribute, _data|
#         if attribute == :players
#           while count < 5 do
#             result_array << team_data[:players][count][:number]
#             count += 1
#         end
#       end
#     end
#   end
#  end
#   result_array
# end

# def player_stats(name)
#   game = game_hash
#   count = 0
#   while count < 6 do
#     if game[:home][:players][count][:player_name] == name
#       result = game[:home][:players][count]
#       return result
#     end
#     if game[:away][:players][count][:player_name] == name
#       result = game[:away][:players][count]
#       return result
#     end
#     count += 1
#   end
# end

# def big_shoe_rebounds
#   game = game_hash
#   count = 0
#   max_size = 0
#   result = 0
#   while count < 5 do
#     if game[:home][:players][count][:shoe] > max_size
#       max_size = game[:home][:players][count][:shoe]
#       result = game[:home][:players][count][:rebounds]
#     end
#     if game[:away][:players][count][:shoe] > max_size
#       max_size = game[:away][:players][count][:shoe]
#       result = game[:away][:players][count][:rebounds]
#     end
#     count += 1
#   end
#   result
# end
