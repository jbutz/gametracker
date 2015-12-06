class Game::StatsController < ApplicationController
  def index
    @games = Game.all
  end
  
  def stats
    @game = Game.find(params[:id])
    @games = @game.game_plays
    
    @game_players = @games.flat_map do |game|
      game.game_play_roles.map do |player|
        player
      end
    end
    
    @player_win_count = [['Player', 'Wins']]
    
    @player_win_groups = @game_players.select{ |player| player.won == true}.group_by{|player| player.player_name}
    @player_win_groups.each do |name,wins|
      @player_win_count << [name, wins.count]
    end
  end
end
