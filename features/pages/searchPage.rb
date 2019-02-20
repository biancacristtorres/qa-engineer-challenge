class SearchPage

    #frase = $driver.find_element(:id, "query")
    frase = {id: "query"}
    searchBtn = {xpath: "//button[@class='btn btn-sm btn-default']"}
    #searchBtn = $driver.find_element(:xpath, "//button[@class='btn btn-sm btn-default']")
    #mensageNotFound = $driver.find_element(:xpath, "//div[@class='alert alert-danger']").text
    mensageNotFound = {xpath: "//div[@class='alert alert-danger']"}
    #categoryBtn = $driver.find_element(:id, "type").find_element(:css,"option[value='#{category}']")
    categoryBtn = {id: "type"}
    questionsList = {tag_name: "tr"}
    # questionsList = $driver.find_elements(:tag_name, "tr")
    # controlPage = $driver.find_element(:xpath, "//center/ul[@class='pagination pagination-lg']")
    controlPage = {xpath: "//center/ul[@class='pagination pagination-lg']"}


    def sendKeysFrase(texto)
        #frase.send_keys texto
        $driver.find_element(frase).send_keys texto
    end
    
    def clickSearch
        # searchBtn.click
        $driver.find_element(searchBtn).click
    end

    def returnMensageNotFound
        # mensageNotFound.texto
        $driver.find_element(mensageNotFound).text
    end

    def clickCategory
        # categoryBtn.click
        $driver.find_element(categoryBtn).find_element(:css,"option[value='#{category}']").click
    end

    def questionsWith
        #questionsList.size - 1
        $driver.find_element(questionsList).size - 1
    end
    
    def controlPageDisplayed
        $driver.find_element(controlPage).displayed?
    end
    
end
