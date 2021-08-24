class HomeController < ApplicationController
  def index
    mark = Coin.last&.birth_mark
    @records = Coin.where(birth_mark: mark)
  end
end
