require 'cucumber'
require 'rspec'

Given(/^navego para a página de busca do banco de questões$/) do
  $driver.get "https://opentdb.com/browse.php"
end

Given(/^digito "([^"]*)" no campo de busca$/) do |frasePesquisa|
  $driver.find_element(:id, "query").send_keys frasePesquisa
end

When(/^clico no botão de buscar$/) do
  $driver.find_element(:xpath, "//button[@class='btn btn-sm btn-default']").click
end

Then(/^deve aparecer uma mensagem de erro com o texto "([^"]*)"$/) do |notFound|
  expect($driver.find_element(:xpath, "//div[@class='alert alert-danger']").text).to eq(notFound.to_s)
end

Given(/^seleciono o valor "([^"]*)" no campo do tipo de busca$/) do |category|
  $driver.find_element(:id, "type").find_element(:css,"option[value='#{category}']").click
end

Then(/^deve aparecer a listagem de questões com (\d+) itens$/) do |qtdQuest|
  expect($driver.find_elements(:tag_name, "tr").size - 1).to eq(qtdQuest.to_i)  
end

Then(/^deve aparecer o controle de paginação$/) do
  $driver.find_element(:xpath, "//center/ul[@class='pagination pagination-lg']").displayed?
end

Then(/^deve aparecer a listagem de questões com menos de (\d+) itens$/) do |qtdQuest|
  expect($driver.find_elements(:tag_name, "tr").size - 1).to be < qtdQuest.to_i
end

Then(/^não deve aparecer o controle de paginação$/) do
	begin
    expect($driver.find_element(:xpath, "//center/ul[@class='pagination pagination-lg']").displayed?).to eql false
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    rescue Selenium::WebDriver::Error::StaleElementReferenceError
      false
    end
end  