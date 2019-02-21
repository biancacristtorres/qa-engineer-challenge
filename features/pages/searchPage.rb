class SearchPage

    #mapeia os elementos
    def campoBusca
        $driver.find_element(:id, "query")
    end
    
    def botaoSearch
        $driver.find_element(:xpath, "//button[@class='btn btn-sm btn-default']")
    end

    def mensageNotFound
        $driver.find_element(:xpath, "//div[@class='alert alert-danger']")
    end

    def campoValor(category)
        $driver.find_element(:id, "type").find_element(:css,"option[value='#{category}']")
    end

    def listaQuestoes
        $driver.find_elements(:tag_name, "tr")
    end
    
    def paginacao
        $driver.find_element(:xpath, "//center/ul[@class='pagination pagination-lg']")
    end


    #realiza as ações
    def preencherCampo(texto)
        campoBusca.send_keys texto
    end

    def clickPesquisar
        botaoSearch.click
    end

    def mensagemNEntrontrado
        mensageNotFound.text
    end

    def clickCategoria(category)
        campoValor(category).click
    end

    def countDeQuestoes
        listaQuestoes.size - 1
    end

    def exibePaginacao
        paginacao.displayed?
    end

end
