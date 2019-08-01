class ArtworkSharesController < ApplicationController

  def create
    share = ArtworkShare.new(share_params)
    if share.save
      render json: share
    else
      render json: share.errors.full_messages, status: 422
    end
  end

  def destroy
    destroyed = ArtworkShare.destroy(params[:id])
    render json: destroyed
  end

  private

  def share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end

end
