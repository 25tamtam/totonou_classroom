class AddSymptomsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :symptoms, :string
  end
end
