require 'pry'

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
          rebounds: 11,
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
        "Bismack Biyombo" => { #different spelling from solution
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22, #different from solution
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
        "Kemba Walker" => { #different from solution
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

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    #location = home
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
      #attribute = :team_name

      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def num_points_scored(name)
  #return number of points scored by that players
  #iterate down to where in hash will find a player's points
  points_scored = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      #check if attribute is equal to players
      if attribute == :players
      #if so, do other iteration
        data.each do |player, player_data| #data is a hash of keys of player names and their data
          #bismack not passing or hitting pry inside here...
          #...pryed to where being called and access with key
          #biz = data["Bismak Biyombo"]
          #realized not working b/c test is passing in bismack with different name as solution hash
          #check if player is equal to name
          if player == name
            points_scored = player_data[:points]
          end
        end
      end
    end
  end
points_scored
end

def shoe_size(name)
  #used same iteration as points scored/pretty much same code
  size = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      #check if attribute is equal to players
      if attribute == :players
      #if so, do other iteration
        data.each do |player, player_data| #data is a hash of keys of player names and their data
          if player == name
            size = player_data[:shoe]
          end
        end
      end
    end
  end
  size
end

def team_colors(name)
  #return array of that team's colors
  team_colors = nil
  game_hash.each do |location, team_data|
    #binding.pry
    if team_data[:team_name] == name
      #store colors-using team_data
      team_colors = team_data[:colors]
    end
  end
  team_colors
end

def team_names
  names = []
  game_hash.each do |location, team_data|
    names << team_data[:team_name]
  end
  names
end

def player_numbers(name)
  #takes in argument of team name and return array of each players numbers
  #can use similar iteration as shoe_size method
  jersey_numbers = []
  game_hash.each do |location, team_data|
    #binding.pry
    if team_data[:team_name] == name
      team_data.each do |attribute, data|
        if attribute == :players
        #if so, do other iteration
          data.each do |player, player_data| #data is a hash of keys of player names and their data
            jersey_numbers << player_data[:number]
              #binding.pry
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
  stats = nil
  #use same iteration as num_points_scored
  #had issue b/c bismack steals and mason plumlee rebounds different from solution
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      #check if attribute is equal to players
      if attribute == :players
      #if so, do other iteration
        data.each do |player, player_data| #data is a hash of keys of player names and their data
          #check if player is equal to name
          if player == name
            stats = player_data
          end
        end
      end
    end
  end
stats
end

def big_shoe_rebounds
  largest_size = nil
  associated_player = nil
  associated_player_rebounds = nil
  #First, find the player with the largest shoe size
  #Then, return that player's number of rebounds
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      #check if attribute is equal to players
      if attribute == :players
      #if so, do other iteration
        data.each do |player, player_data| #data is a hash of keys of player names and their data
          #binding.pry
          if !largest_size
            largest_size = player_data[:shoe]
            associated_player = player
            associated_player_rebounds = player_data[:rebounds]
          elsif largest_size < player_data[:shoe]
            largest_size = player_data[:shoe]
            associated_player = player
            associated_player_rebounds = player_data[:rebounds]
          end
        end
      end
    end
  end
  associated_player_rebounds
end

def most_points_scored
  #player with most points
  #can do same thing as shoe rebounds
  most_points = nil
  associated_player = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      #check if attribute is equal to players
      if attribute == :players
      #if so, do other iteration
        data.each do |player, player_data| #data is a hash of keys of player names and their data
          #binding.pry
          if !most_points
            most_points = player_data[:points]
            associated_player = player
          elsif most_points < player_data[:points]
            most_points = player_data[:points]
            associated_player = player
          end
        end
      end
    end
  end
  associated_player
end

def winning_team
  #need to add up all player points from each team then compare
  home_points = 0
  away_points = 0
  winner = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      #check if attribute is equal to players
      if attribute == :players
      #if so, do other iteration
        data.each do |player, player_data| #data is a hash of keys of player names and their data
          if location == :home
            home_points += player_data[:points]
          else
            away_points += player_data[:points]
          end
        end
      end
    end
  end
#make comparison
  if home_points > away_points
    winner = game_hash[:home][:team_name]
  else
    winner = game_hash[:away][:team_name]
  end
winner
end

def player_with_longest_name
  #can do same thing as shoe rebounds
  longest_name = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      #check if attribute is equal to players
      if attribute == :players
      #if so, do other iteration
        data.each do |player, player_data| #data is a hash of keys of player names and their data
          #binding.pry
          if !longest_name
            longest_name = player
          elsif longest_name.length < player.length
            longest_name = player
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  #see who has most steals
  #then compare to return value of player_with_longest_name
  #can do same thing as shoe rebounds
  most_steals = nil
  associated_player = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      #check if attribute is equal to players
      if attribute == :players
      #if so, do other iteration
        data.each do |player, player_data| #data is a hash of keys of player names and their data
          #binding.pry
          if !most_steals
            most_steals = player_data[:steals]
            associated_player = player
          elsif most_steals < player_data[:steals]
            most_steals = player_data[:steals]
            associated_player = player
          end
        end
      end
    end
  end
  associated_player == player_with_longest_name
end
