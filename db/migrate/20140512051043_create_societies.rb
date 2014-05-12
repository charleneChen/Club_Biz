class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :club_name
      t.string :username
      t.string :password
      t.string :admin_name
      t.string :admin_phone
      t.string :admin_email
      t.text :description

      t.timestamps
    end
  end
end
