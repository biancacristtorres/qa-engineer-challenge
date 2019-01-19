require 'selenium-webdriver'
require 'cucumber'
require 'rspec'
require 'pry'

Selenium::WebDriver::Chrome.driver_path="C:/projetos/anima/qa-engineer-challenge/chromedriver_win32/chromedriver.exe"

Given(/^navego para a página de busca do banco de questões$/) do
  #Declarando a variável @Driver atribuindo o Webdriver do Chrome.
  @driver = Selenium::WebDriver.for :chrome
  @driver.get "https://opentdb.com/browse.php"
  sleep 3
end

Given(/^digito "([^"]*)" no campo de busca$/) do |arg1|
  @driver.find_element(:id, "query").send_keys arg1
  sleep 3
end

When(/^clico no botão de buscar$/) do
  @driver.find_element(:xpath, "//button[@class='btn btn-sm btn-default']").click
end

Then(/^deve aparecer uma mensagem de erro com o texto "([^"]*)"$/) do |arg1|
  mensage =  @driver.find_element(:xpath, "//div[@class='alert alert-danger']").text
  expect(mensage).to eq(arg1)
end


#cenario 2
Given(/^seleciono o valor "([^"]*)" no campo do tipo de busca$/) do |arg1|
  @driver.find_element(:id, "type").find_element(:css,"option[value='Category']").click
  sleep 3
end

Then(/^deve aparecer a listagem de questões com (\d+) itens$/) do |arg1|
  table = @driver.find_elements(:tag_name, "tr").size - 1
  expect(table.to_s).to eq(arg1.to_s)  
end

Then(/^deve aparecer o controle de paginação$/) do
  @driver.find_element(:xpath, "//center/ul[@class='pagination pagination-lg']").displayed?
end

Then(/^deve aparecer a listagem de questões com menos de (\d+) itens$/) do |arg1|
  @driver.find_elements(:tag_name, "tr").size - 1 < 26
end

Then(/^não deve aparecer o controle de paginação$/) do
    begin
      expect(@driver.find_element(:xpath, "//center/ul[@class='pagination pagination-lg']").displayed?).to eql false
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    rescue Selenium::WebDriver::Error::StaleElementReferenceError
      false
    end
end




  