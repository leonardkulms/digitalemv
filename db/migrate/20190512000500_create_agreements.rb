# frozen_string_literal: true

class CreateAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :agreements do |t|
      t.integer :Meeting_id
      t.integer :User_id

      t.timestamps
    end
  end
end
