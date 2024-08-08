class AddDeletedAtToModels < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :companies, :deleted_at, :datetime
    add_index :companies, :deleted_at

    add_column :jobs, :deleted_at, :datetime
    add_index :jobs, :deleted_at

    add_column :assessments, :deleted_at, :datetime
    add_index :assessments, :deleted_at

    add_column :questions, :deleted_at, :datetime
    add_index :questions, :deleted_at

    add_column :answers, :deleted_at, :datetime
    add_index :answers, :deleted_at

    add_column :applications, :deleted_at, :datetime
    add_index :applications, :deleted_at

    add_column :participations, :deleted_at, :datetime
    add_index :participations, :deleted_at

    add_column :submissions, :deleted_at, :datetime
    add_index :submissions, :deleted_at

    add_column :responses, :deleted_at, :datetime
    add_index :responses, :deleted_at
  end

  def down
    remove_index :users, :deleted_at
    remove_column :users, :deleted_at, :datetime

    remove_index :companies, :deleted_at
    remove_column :companies, :deleted_at, :datetime

    remove_index :jobs, :deleted_at
    remove_column :jobs, :deleted_at, :datetime

    remove_index :assessments, :deleted_at
    remove_column :assessments, :deleted_at, :datetime

    remove_index :questions, :deleted_at
    remove_column :questions, :deleted_at, :datetime

    remove_index :answers, :deleted_at
    remove_column :answers, :deleted_at, :datetime

    remove_index :applications, :deleted_at
    remove_column :applications, :deleted_at, :datetime

    remove_index :participations, :deleted_at
    remove_column :participations, :deleted_at, :datetime

    remove_index :submissions, :deleted_at
    remove_column :submissions, :deleted_at, :datetime

    remove_index :responses, :deleted_at
    remove_column :responses, :deleted_at, :datetime
  end
end
