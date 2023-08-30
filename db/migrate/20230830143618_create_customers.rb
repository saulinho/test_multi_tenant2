class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
