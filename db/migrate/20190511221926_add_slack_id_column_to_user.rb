# frozen_string_literal: true

class AddSlackIdColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :slack_id, :string
  end
end
