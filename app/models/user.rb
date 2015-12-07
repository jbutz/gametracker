class User < ActiveRecord::Base
  has_many :game_play
  has_many :game_play_role
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || auth['info']['nickname'] || ""
      end
    end
  end


end
