class AddMutationIdToAgreements < ActiveRecord::Migration[5.2]
  def change
    add_reference :agreements, :mutation, foreign_key: true
  end
end
