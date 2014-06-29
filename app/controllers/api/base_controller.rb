module Api
  class BaseController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found
      render :not_found, status: 404
    end

  end
end
