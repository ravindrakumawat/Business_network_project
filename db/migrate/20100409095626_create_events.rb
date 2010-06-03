class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :user_id
      t.string :title
      t.datetime :from_datentime
      t.datetime :to_datentime
      t.boolean :virtual
      t.string :venue
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :postalcode
      t.string :website
      t.text :description
      t.integer :eventtype_id
      t.integer :industry_id
      t.text :keywords
      t.text :attender
      t.string :organization
      t.string :attending
      t.boolean :organizing
      t.boolean :free
      t.integer :price
      t.string :repeat
      t.string :edit

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
