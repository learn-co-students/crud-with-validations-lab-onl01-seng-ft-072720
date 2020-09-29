class SongsController < ApplicationController

    def index
        @songs = Song.all
    end
    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to @song
        else
            render :new
        end
    end

    def show
        find_song
    end

    def edit
        find_song
    end

    def update
        find_song
        if @song.update(song_params)
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        find_song.destroy
        redirect_to "/songs"
    end

  

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def find_song
        @song = Song.find_by(id: params[:id])
    end
end
