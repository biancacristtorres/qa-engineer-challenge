require 'selenium-webdriver'

# Store command line argument
$browser_type = 'firefox'

begin
  $driver = Selenium::WebDriver.for(:"#{$browser_type}")
rescue Exception => e
  puts e.message
  Process.exit(0)
end
