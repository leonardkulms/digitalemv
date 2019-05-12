# frozen_string_literal: true

class DeleteColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :agreements, :Meeting_id
    remove_column :agreements, :User_id
  end
end
