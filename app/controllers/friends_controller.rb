class FriendsController < ApplicationController
    def create
        Friend.create user_id: params[:user_id], friend_id: params[:friend_id]
        redirect_to user_path(id: params[:friend_id])
    end
    
    def destroy
        friend = Friend.find params[:id].to_i
        friend.destroy
        redirect_to user_path(id: params[:friend_id])
    end
    
    def update
        friend = Friend.find params[:id].to_i
        friend.update accepted: true
        redirect_to user_path(id: params[:friend_id])
    end
end