class CreateGroupships < ActiveRecord::Migration
  def change
    create_table :groupships do |t|
      t.integer :group_id
      t.integer :society_id

      t.timestamps
    end
  end
end
