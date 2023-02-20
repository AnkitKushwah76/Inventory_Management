# frozen_string_literal: true

class CreateJob < ApplicationJob
  queue_as :default
  def perform(user_email, user_name, item)
    ConfirmationsMailer.create_items(user_email, user_name, item).deliver_later
  end
end
