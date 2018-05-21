class CreateRegulars < ActiveRecord::Migration[5.2]
  def change
    create_table :regulars do |t|
      t.references :tender, index: true, foreign_key: {to_table: :users}
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
