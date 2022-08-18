class AddCamParamToMobilecameras < ActiveRecord::Migration[6.0]
  def change
    add_column :mobilecameras, :connect, :string
    add_column :mobilecameras, :rec, :boolean
    add_column :mobilecameras, :batt, :int
    add_column :mobilecameras, :chg, :boolean
  end
end
