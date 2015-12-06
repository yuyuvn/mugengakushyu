class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :results
  has_many :goals
  
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
end
