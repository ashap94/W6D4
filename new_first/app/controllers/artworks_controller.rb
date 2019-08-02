class ArtworksController < ApplicationController

  # artist_id: params[:user_id], viewer_id: params[:]

   def index
    if params.has_key?(:user_id)
      artworks = Artwork.joins(:artwork_shares)
      .where("artist_id = #{params[:user_id]} OR viewer_id = #{params[:user_id]}")
      .distinct
    else
      artworks = Artwork.all
    end
    render json: artworks
  end

  def show 
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end

  end

  def destroy 

    artwork = Artwork.destroy(params[:id])
    render json: artwork

  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
