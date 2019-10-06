class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_validation :adjust_email, on: :create
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]       

  has_many :results, dependent: :destroy
  has_many :goals, dependent: :destroy
  
  has_many :be_accepted_relationships, ->{where(accepted: true)}, class_name: "Friend",
    foreign_key: "user_id", dependent: :delete_all
  has_many :be_requested_relationships, ->{where(accepted: true)}, class_name: "Friend",
    foreign_key: "friend_id", dependent: :delete_all
  has_many :be_accepted_friends, through: :be_accepted_relationships, source: :friend
  has_many :be_requested_friends, through: :be_requested_relationships, source: :user

  def learned_word
  	results.learned.count(:word_id)
  end
  
  def status_with friend_id
    if friend = Friend.where(user_id: self.id, friend_id: friend_id).try(:first)
      if friend.accepted
        :be_accepted
      else
        :requested
      end
    elsif friend = Friend.where(user_id: friend_id, friend_id: self.id).try(:first)
      if friend.accepted
        :accepted
      else
        :be_requested
      end
    else
      :nothing
    end
  end
  
  def friendships
    Friend.where("user_id = ? or friend_id = ?",self.id,self.id)
  end

  def friends
    fid1 = be_accepted_friends.ids
    fid2 = be_requested_friends.ids
    User.where(id: fid1+fid2)
  end
  
  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        access_token.provider = 'Google'
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,10],
        )
      end
    end
  end
  
  private

    def adjust_email
      self.email = "fake+#{generate_token}" if email.blank?
      true
    end

    def generate_token
      rand(36**8).to_s(36)
    end
end
