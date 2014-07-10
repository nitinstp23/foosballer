module Api
  class TournamentsController < BaseController

    def index
      @tournaments = Tournament.all.limit(INDEX_LIMIT)
    end

    def create
      tournament = Tournament.new(tournament_params)

      if tournament.save!
        render json: { id: tournament.id }
      else
        render json: { error: tournament.errors.full_messages }, status: 500
      end
    end

    def create_teams
      builder = TeamBuilder.new(params[:player_ids])

      if builder.valid?
        @teams = builder.teams
      else
        render json: { error: builder.errors }, status: 500
      end
    end

    private

    INDEX_LIMIT = 15

    def tournament_params
      params.require(:tournament).permit!
    end
  end
end
