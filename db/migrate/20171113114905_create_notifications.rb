class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :read
      t.references :user, index: true, foreign_key: true
      t.references :comment, index: true, foreign_key: true

      #readは初期設定で既読とする
      t.boolean :read, default: false

      t.timestamps null: false
    end
  end
end
