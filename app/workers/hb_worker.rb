class HbWorker
  require 'watchcow'
  include Sidekiq::Worker
  sidekiq_options retry: 1, backtrace: true

  def perform
    result = JSON.parse Watchcow::Client.call
    mark = Time.now.to_i
    result.values.flatten.each do |g|
      Coin.create(
        name: g["coin"],
        days_left: g["days"],
        annual_rate: g["expected_margin"],
        landed_rate: g["real_margin_expected"],
        future_price: g["dm_first_bid"],
        spot_price: g["spot_first_bid"],
        gap_rate: g["gap_rate"],
        birth_mark: mark
      )
    end
  end
end
