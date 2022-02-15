class CreateMatrices < ActiveRecord::Migration[6.1]
  def change
    create_table :matrices do |t|
      t.text :matrix

      t.timestamps
    end
  end
end
