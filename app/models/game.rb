class Game < ActiveRecord::Base
  has_many :game_roles
  has_many :game_plays
  
  accepts_nested_attributes_for :game_roles,
    allow_destroy: true,
    reject_if: lambda {|attributes| attributes['name'].blank?}
end
