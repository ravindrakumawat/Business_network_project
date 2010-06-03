require 'test_helper'
require File.dirname(__FILE__) + '/../test_helper'
require 'user_mailer'
class UserMailerTest < ActionMailer::TestCase
 fixtures :users
FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'
CHARSET = "utf-8"
include ActionMailer::Quoting
def setup
@user = users(:valid_user)
@expected = TMail::Mail.new
@expected.set_content_type "text", "plain", { "charset" => CHARSET }
end
def test_reminder
reminder = UserMailer.create_reminder(@user)
assert_equal 'do-not-reply@railsspace.com', reminder.from.first
assert_equal "Your login information at RailsSpace.com", reminder.subject
assert_equal @user.email, reminder.to.first
assert_match /Screen name: #{@user.screen_name}/, reminder.body
assert_match /Password: #{@user.password}/, reminder.body
end

private
def read_fixture(action)
IO.readlines("#{FIXTURES_PATH}/user_mailer/#{action}")
end
def encode(subject)
quoted_printable(subject, CHARSET)
end
end
