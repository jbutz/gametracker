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
    
    @player_stats = []
    @player_stats_roles = []
    
    @player = @game_players.select{ |player| !player.user_id.blank?}.sort_by{|p| p.player_name}.group_by{|player| player.player_name}
    @player.each do |name,games|
    
      wins = games.select{|g| g.won }.count
      losses =  games.select{|g| !g.won }.count
      
      @player_stats << {
        :player => name,
        :total_games => games.count,
        :wins => wins,
        :losses => losses,
        :win_percent => ((wins.to_f / games.count.to_f) * 100).to_i
      }
      
      games.sort_by{|p| p.game_role.name}.group_by {|player| player.game_role.name }.each do |role, games|
      
        wins = games.select{|g| g.won }.count
        losses =  games.select{|g| !g.won }.count
      
        @player_stats_roles << {
          :player => name,
          :role => role,
          :total_games => games.count,
          :wins => wins,
          :losses => loses,
          :win_percent => ((wins.to_f / games.count.to_f) * 100).to_i
        }
      end
      
    end
  end
end
