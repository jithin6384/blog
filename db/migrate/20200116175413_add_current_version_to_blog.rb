class AddCurrentVersionToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :current_version, :boolean,  default: false
  end
end
