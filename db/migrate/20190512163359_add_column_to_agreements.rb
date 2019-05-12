# frozen_string_literal: true

class AddColumnToAgreements < ActiveRecord::Migration[5.2]
  def change
    add_column :agreements, :status, :integer, default: 0
  end
end
