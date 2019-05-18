# frozen_string_literal: true

class CreateMutations < ActiveRecord::Migration[5.2]
  def change
    create_table :mutations do |t|
      t.text :description

      t.timestamps
    end
  end
end
