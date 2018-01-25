class User < ApplicationRecord
  has_many :event_invites, :foreign_key => :invitee_id
  has_many :events, :through => :event_invites
  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"

  has_secure_password


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(string)
    BCrypt::Password.new(password_digest).is_password?(string)
  end

  def correct_user
    id == params[:id]
  end
end
