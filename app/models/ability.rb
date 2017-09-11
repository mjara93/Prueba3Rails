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
         can :manage, UserSong, user_id: user.id
         can :read, User
         #can :add_song, Playlist
       else
         can :read, Song
       end
  end
end
