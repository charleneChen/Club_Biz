class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :student_id
      t.integer :society_id

      t.timestamps
    end
    add_index :memberships, :student_id
    add_index :memberships, :society_id
    add_index :memberships, [:student_id, :society_id], unique: true
  end
end
