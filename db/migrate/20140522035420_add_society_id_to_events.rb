class AddSocietyIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :society_id, :integer
  end
end
