module Api
  class TournamentsController < BaseController

    def index
      @tournaments = Tournament.all.limit(INDEX_LIMIT)
    end

    def create_teams
      builder = TeamBuilder.new(params[:player_ids])

      if builder.valid?
        @teams = builder.teams
      else
        render json: { error: I18n.t('errors.messages.invalid_players_count') }, status: 500
      end
    end

    private

    INDEX_LIMIT = 15

  end
end
