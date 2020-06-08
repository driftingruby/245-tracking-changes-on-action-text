class CreateVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :versions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.references :item, polymorphic: true, null: false

      t.timestamps
    end
  end
end
