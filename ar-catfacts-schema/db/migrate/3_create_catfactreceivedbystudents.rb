require_relative '../config'

class CreateCatfactreceivedbystudents < ActiveRecord::Migration

  def change
    create_table :catfactreceivedbystudents do |column|
      column.integer :catfact_id
      column.integer :student_id

      column.timestamps
    end
  end
end
