require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]


  Selenium::WebDriver::Chrome.path = '/mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'
  Selenium::WebDriver::Chrome.path = '/usr/local/bin/chrome'
end
