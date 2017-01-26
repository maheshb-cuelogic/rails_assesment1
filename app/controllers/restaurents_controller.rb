class RestaurentsController < ApplicationController
  def index
    @restaurents = Restaurent.fetch
  end
end
