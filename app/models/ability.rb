class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new(role: 0) # guest user (not logged in)
       if user.admin?
         can :manage, :all
       elsif user.basic?
         can [:read, :create], Song
         can [:update, :destroy], UserSong, user_id: user.id
         can :add_song, Song
         can :read, User
         can :read, UserSong
         #can :add_song, Playlist
       else
         can :read, Song
       end
  end
end
