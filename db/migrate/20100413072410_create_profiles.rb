class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :firstname
      t.string :lastname
      t.string :maidenname
      t.string :headline
      t.integer :country
      t.integer :state
      t.integer :city
      t.integer :zipcode
      t.integer :industry
      t.string :companyname
      t.string :title
      t.date :timefrom
      t.date :timeto
      t.text :description
      t.string :schoolname
      t.string :degree
      t.string :fields
      t.date :dateattend
      t.text :activities
      t.text :addnote
      t.integer :websitetitle
      t.string :website
      t.text :interest
      t.text :awards
      t.integer :phonetype
      t.string :phone
      t.integer :imtype
      t.string :im
      t.text :address
      t.date :birthday
      t.integer :maritalstatus

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
