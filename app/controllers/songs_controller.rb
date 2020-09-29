class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :delete]

    def index
      @song = Song.all 
    end 

    def show
    end 

    def new
      @song = Song.new 
    end 

    def create
      @song = Song.new(songs_params)
      if @song.save
         redirect_to @song
      else 
        render :new
      end 
    end 

    def edit
    end 

    def update
      if @song.update(songs_params)
         redirect_to @song
      else 
         render :edit
      end 
    end 

    def delete
      @song.destroy
      redirect_to songs_path 
    end 

private 

    def songs_params
      params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end 

    def set_song
        @song = Song.find_by(id: params[:id])
    end 
end
