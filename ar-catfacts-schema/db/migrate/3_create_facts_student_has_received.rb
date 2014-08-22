require_relative '../config'

class CreateFactsStudentHasReceived < ActiveRecord::Migration

  def change
    create_table :facts_student_has_received do |column|
      column.integer :catfact_id
      column.string :student_id

      column.timestamps
    end
  end
end
