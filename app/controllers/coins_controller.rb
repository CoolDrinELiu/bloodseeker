class CoinsController < ApplicationController
  def index
    mark = Coin.last&.birth_mark
    @records = Coin.where(birth_mark: mark)
  end

  def stare
    redirect_to root_path and return unless Watchcow::ApiSymbol.contract_list.include?(params[:coin])
    @records = JSON.parse(Watchcow::Client.call(params[:coin])).values.flatten
  end
end