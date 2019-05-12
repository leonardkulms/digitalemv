# frozen_string_literal: true

class AddMeetingToAgreement < ActiveRecord::Migration[5.2]
  def change
    add_reference :agreements, :meeting, foreign_key: true
  end
end
