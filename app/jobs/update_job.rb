# frozen_string_literal: true

class UpdateJob < ApplicationJob
  queue_as :default
  def perform(item_arr)
    ConfirmationsMailer.update_items(item_arr).deliver_later
  end
end
