class PlaylistsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @user = User.find(params[:id])
  end

  def add_song
    @song = Song.find(params[:song_id])
    @user = current_user
    @user.songs << @song
    @user.save

    redirect_to songs_path, notice: "La cancion ha sido ingresada a su playlist!"

  end

  def remove_song
    @user = User.find(params[:id])
    song = Song.find(params[:song_id])
    @user.songs.delete(song)
    redirect_to playlists_path(current_user), alert: "cancion borrada con exito!"

  end
end
