Before do
  $driver.manage().window().maximize()
end

at_exit do
  $driver.quit()
end
