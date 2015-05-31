class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :filter_zipcode
      t.string :filter_language
      t.string :filter_area
      t.string :filter_service
      t.string :question_localization
      t.string :question_1
      t.string :question_1_sub_1
      t.string :question_2
      t.string :question_2_sub_1
      t.string :question_3
      t.string :question_4
      t.string :question_5
      t.string :question_6
      t.string :question_7
      t.string :question_8
      t.string :question_9

      t.timestamps null: false
    end
  end
end
