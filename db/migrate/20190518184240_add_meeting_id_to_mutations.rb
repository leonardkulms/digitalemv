class AddMeetingIdToMutations < ActiveRecord::Migration[5.2]
  def change
    add_reference :mutations, :meeting, foreign_key: true
  end
end
