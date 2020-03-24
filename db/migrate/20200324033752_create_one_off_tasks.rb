# frozen_string_literal: true

class CreateOneOffTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :one_off_tasks do |t|
      t.string :version
    end

    add_index :one_off_tasks, :version, unique: true
  end
end
