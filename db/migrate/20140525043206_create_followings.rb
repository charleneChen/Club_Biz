class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :student_id
      t.integer :event_id

      t.timestamps
    end
  end
end
