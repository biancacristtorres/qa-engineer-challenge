require 'cucumber'
require 'rspec'
require './features/pages/SearchPage'

page = SearchPage.new
Given(/^navego para a página de busca do banco de questões$/) do
  $driver.get "https://opentdb.com/browse.php"
end

Given(/^digito "([^"]*)" no campo de busca$/) do |frasePesquisa|
  page.preencherCampo(frasePesquisa)
end

When(/^clico no botão de buscar$/) do
  page.clickPesquisar
end

Then(/^deve aparecer uma mensagem de erro com o texto "([^"]*)"$/) do |notFound|
  expect(page.mensagemNEntrontrado).to eq(notFound.to_s) 
end

Given(/^seleciono o valor "([^"]*)" no campo do tipo de busca$/) do |category|
  page.clickCategoria(category)
end

Then(/^deve aparecer a listagem de questões com (\d+) itens$/) do |qtdQuest|
  expect(page.countDeQuestoes).to eq(qtdQuest.to_i)  
end

Then(/^deve aparecer o controle de paginação$/) do
  page.exibePaginacao
end

Then(/^deve aparecer a listagem de questões com menos de (\d+) itens$/) do |qtdQuest|
  expect(page.countDeQuestoes).to be < qtdQuest.to_i
end

Then(/^não deve aparecer o controle de paginação$/) do
	  begin
      expect(page.exibePaginacao).to eql false
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    rescue Selenium::WebDriver::Error::StaleElementReferenceError
      false
    end
    
end  