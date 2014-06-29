module Api
  class TournamentsController < BaseController

    def index
      @tournaments = Tournament.all.limit(INDEX_LIMIT)
    end

    private

    INDEX_LIMIT = 15
  end
end
