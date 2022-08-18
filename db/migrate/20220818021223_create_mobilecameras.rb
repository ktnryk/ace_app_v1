class CreateMobilecameras < ActiveRecord::Migration[6.0]
  def change
    create_table :mobilecameras do |t|
      t.string :cam_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mobilecameras, [:user_id, :created_at]
  end
end
