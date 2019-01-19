Feature: Busca de Banco de Questões
  Cenários relacionados a busca

  Scenario: Busca por termo inexistente
    Given navego para a página de busca do banco de questões
    And digito "Science: Computers" no campo de busca
    When clico no botão de buscar
    Then deve aparecer uma mensagem de erro com o texto "No questions found."

  Scenario: Busca por categoria com paginação
    Given navego para a página de busca do banco de questões
    And digito "Science: Computers" no campo de busca
    And seleciono o valor "Category" no campo do tipo de busca
    When clico no botão de buscar
    Then deve aparecer a listagem de questões com 25 itens
    And deve aparecer o controle de paginação

  Scenario: Busca por categoria sem paginação
    Given navego para a página de busca do banco de questões
    And digito "Harvard" no campo de busca
    When clico no botão de buscar
    Then deve aparecer a listagem de questões com menos de 26 itens
    And não deve aparecer o controle de paginação