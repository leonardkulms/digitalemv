# frozen_string_literal: true

class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings, &:timestamps
  end
end
