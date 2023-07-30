class V1::VotesController < ApplicationController
    def index
        @votes = Vote.all
        render json: @votes
    end

    def create
        @vote = current_user.votes.new(vote_params)
    
        if @vote.save
          render json: @vote, status: :created
        else
          render json: @vote.errors, status: :unprocessable_entity
        end
      end
    
      private
    
      def vote_params
        params.require(:vote).permit(:post_id, :vote_type)
      end

end
