class VotesController < ApplicationController

  def create

    my_vote = Vote.find_by(voteable_type: params[:voteable_type], voteable_id: params[:voteable_id], user_id: current_user.id)

     if my_vote == nil
        vote = Vote.create(vote_params)
        redirect_to :back
      else
        my_vote.vote_status = params[:vote_status]
        my_vote.save
        redirect_to :back
      end
end

  private

  def vote_params
    params.permit(:voteable_type, :voteable_id, :vote_status).merge(user_id: current_user.id)
  end

end
