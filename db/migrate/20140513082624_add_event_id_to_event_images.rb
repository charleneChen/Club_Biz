class AddEventIdToEventImages < ActiveRecord::Migration
  def change
    add_column :event_images, :event_id, :integer
  end
end
