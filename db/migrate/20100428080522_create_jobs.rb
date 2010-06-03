class CreateJobs < ActiveRecord::Migration
 def self.up
    create_table :jobs do |t|
      t.string :title
      t.string :company_name
      t.integer :location_id
      t.integer :country_id
      t.string :pincode
      t.string :company_url
      t.integer :job_type
      t.integer :experience
      t.string :industry_ids
      t.string :function_ids
      t.integer :user_id
      t.integer :currency_id
      t.float :compensation
      t.integer :schema
      t.string :add_information
      t.float :bonus
      t.string :bonus_description
      t.text :job_description
      t.text :skills
      t.text :company_description
      t.boolean :local_candidate_only
      t.boolean :third_party_not_accepted
      t.string :email
      t.string :website
      t.integer :language_id
      t.integer :employer_job_id
      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end

