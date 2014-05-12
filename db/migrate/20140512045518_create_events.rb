class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :type
      t.text :content
      t.string :image_url
      t.decimal :ticket_price
      t.integer :ticket_number

      t.timestamps
    end
  end
end
