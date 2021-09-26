class HbWorker
  require 'watchcow'
  include Sidekiq::Worker
  sidekiq_options retry: 1, backtrace: true

  def perform
    log = RakeLog.create(title: "HB Job")
    begin
      result = JSON.parse Watchcow::Client.call
      mark = Time.now.to_i
      result.values.flatten.each do |g|
        Coin.create(
          name: g["coin"],
          days_left: g["days"],
          annual_rate: g["margin"],
          landed_rate: g["real_margin_expected"],
          future_price: g["dm_first_bid"],
          spot_price: g["spot_first_bid"],
          gap_rate: g["gap_rate"],
          birth_mark: mark
        )
      end
    rescue Exception => e
      status = false
      message = e
    end
    log.update_attributes(status: status, message: message)
  end
end
