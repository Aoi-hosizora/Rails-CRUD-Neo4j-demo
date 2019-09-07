module Api
  class DefaultController < ApplicationController

    # GET /api/test
    def test
      render json: {
               "msg": "Hello world",
             }
    end
  end
end
