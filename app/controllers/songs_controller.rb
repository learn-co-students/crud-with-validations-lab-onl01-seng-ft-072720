class SongsController < ApplicationController
    def index 
        @songs = Song.all
    end

    def new 
        @song = Song.new 
    end 
    
    def show
        find_song_by_id
    end 

    def create 
        @song = Song.new(song_params)

        if @song.valid?
            @song.save 
            
            redirect_to song_path(@song)
        else 
            render :new 
        end 
    end

    def edit 
        find_song_by_id
    end 

    def update 
        find_song_by_id
        @song.assign_attributes(song_params)

        if @song.valid?
            @song = Song.update(song_params)

            redirect_to song_path(@song)
        else 
            render :edit 
        end 
    end 

    def destroy 
        find_song_by_id.destroy 
        
        redirect_to songs_path
    end

    private 

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

    def find_song_by_id
        @song = Song.find_by(id: params[:id])
    end
end
