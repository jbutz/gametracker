class GamePlay < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  belongs_to :win_conditions
  has_many :game_play_roles
  
  accepts_nested_attributes_for :game_play_roles,
    allow_destroy: true,
    reject_if: lambda {|attributes| ((attributes['name'].blank? && attributes['user_id'].blank?) || attributes['game_role_id'].blank?)}
  
  def created_by
    self.user
  end
end
