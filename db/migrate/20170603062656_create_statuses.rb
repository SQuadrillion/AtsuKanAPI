class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer :hot
      t.integer :cold

      t.timestamps
    end
  end
end
