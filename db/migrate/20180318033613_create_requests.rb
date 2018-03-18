class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :amount_requested
      t.integer :amount_paid
      t.date :date_processed
      t.boolean :documents_submitted
      t.string :processing_status
      t.text :notes
      t.boolean :request_approved
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
