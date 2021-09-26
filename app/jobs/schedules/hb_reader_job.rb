# frozen_string_literal: true

module Schedules
  class HbReaderJob < ApplicationJob
    def perform
      HbWorker.perform_async
    end
  end
end
