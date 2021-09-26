# frozen_string_literal: true

module Schedules
  class HbReaderJob < ApplicationJob
    def perform
      log = RakeLog.create(title: "HB Job")
      begin
        HbWorker.perform_async
      rescue Exception => e
        status = false
        message = e
      end
      log.update_attributes(status: status, message: message)
    end
  end
end
