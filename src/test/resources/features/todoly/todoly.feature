Feature: API todoLy

    Background:
        * def auth = call read('classpath:features/common/auth.feature')
        * url baseUrlTodoLy
        * def bodyCrearProyecto = read('classpath:data/json/bodyCrearProyecto.json')
        * def bodyCrearProyectoCSV = read('classpath:data/json/bodyCrearPoryectoCSV.json')

        @todoLy
    Scenario: Obtener todos los proyectos TodoLy
        
        Given path 'api', 'projects.json'
        And header Authorization = auth.authHeader
        When method get
        Then status 200
        And match response != []
        And assert response.length > 0
        And match response[0].Id == 4555384
        And match response[0].Content == 'Work'
        
        @crearProyectoBody
    Scenario: Crear un nuevo proyecto en TodoLy basado en un archivo JSON
        
        Given path 'api', 'projects.json'
        And header Authorization = auth.authHeader
        And request bodyCrearProyecto
        When method post
        Then status 200
        
        @crearProyectoCSV
    Scenario Outline: Crear un nuevo proyecto en TodoLy basado en un archivo CSV
        
        Given path 'api', 'projects.json'
        And header Authorization = auth.authHeader
        And request bodyCrearProyectoCSV
        When method post
        Then status 200

        Examples:
        |read('classpath:data/csv/data-proyectos.csv')|