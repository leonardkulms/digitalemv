# frozen_string_literal: true

class DeleteUserColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :email
  end
end
