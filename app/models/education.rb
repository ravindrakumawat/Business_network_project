class Education < ActiveRecord::Base
belongs_to :user

QUESTIONS = %w( skillz schools activities additional_notes address interest groups_and_association honors_and_awards)
# A constant for everything except the bio
FAVORITES = QUESTIONS - %w()
TEXT_ROWS = 10
TEXT_COLS = 40
validates_length_of QUESTIONS,
:maximum => DB_TEXT_MAX_LENGTH
end
