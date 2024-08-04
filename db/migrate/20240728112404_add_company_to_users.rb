class AddCompanyToUsers < ActiveRecord::Migration[7.1]
  def up
    add_reference :users, :company, null: true, foreign_key: true
  end

  def down
    remove_reference :users, :company
  end
end
