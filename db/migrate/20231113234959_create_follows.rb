class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.references :followable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :follows, [:user_id, :followable_id, :followable_type], unique: true, name: 'index_follows_on_user_and_followable'
  end
end
