class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
    @song = Song.create(song_params(:title, :release_year, :artist_name, :released, :genre))
    if @song.valid?
        redirect_to song_path(@song)
    else
        render :new
    end
end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params(:title, :release_year, :artist_name, :released, :genre))
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id])
        @song.destroy
        redirect_to songs_path
    end

    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end
