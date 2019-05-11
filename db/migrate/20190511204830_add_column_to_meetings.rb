# frozen_string_literal: true

class AddColumnToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :name, :string
    add_column :meetings, :description, :text
  end
end
