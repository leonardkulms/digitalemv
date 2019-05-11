# frozen_string_literal: true

class AddColumnToMeetings < ActiveRecord::Migration[5.2]
  def change
    t.string :name
    t.text :description
  end
end
