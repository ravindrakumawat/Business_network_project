class Company < ActiveRecord::Base
belongs_to :user
ALL_FIELDS = %w(company_name title time_from time_to)
STRING_FIELDS = %w(company_name title)
START_YEAR = 1900
VALID_DATES = DateTime.new(START_YEAR)..DateTime.now
validates_length_of STRING_FIELDS,
:maximum => DB_STRING_MAX_LENGTH
validates_inclusion_of :time_from, :time_to,
:in => VALID_DATES,
:allow_nil => true,
:message => "is invalid"
end
