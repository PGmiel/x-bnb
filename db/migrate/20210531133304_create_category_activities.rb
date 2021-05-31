class CreateCategoryActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :category_activities do |t|
      t.references :categories, null: false, foreign_key: true
      t.references :activities, null: false, foreign_key: true

      t.timestamps
    end
  end
end
