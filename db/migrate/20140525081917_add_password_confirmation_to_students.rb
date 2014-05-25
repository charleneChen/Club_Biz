class AddPasswordConfirmationToStudents < ActiveRecord::Migration
  def change
    add_column :students, :password_confirmation, :string
  end
end
