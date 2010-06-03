module FriendshipHelper
# Return an appropriate friendship status message.
def friendship_status(user, friend)
friendship = Friendship.find_by_user_id_and_friend_id(user,friend)
return "#{friend.login} is not your friend (yet)." if friendship.nil?
case friendship.status
when 'requested'
"#{friend.login} would like to be your friend."
when 'pending'
"You have requested friendship from #{friend.login}."
when 'accepted'
"#{friend.login} is your friend."
end
end
end
