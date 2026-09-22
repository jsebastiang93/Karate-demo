@APIUsuarios
Feature: Ejemplo automatizacion api reqres in
 
    Background:
        * def baseUrlAPI = baseUrl
        * url baseUrl
 
        * def pathAPI = 'api/users'
 
        @Regresion
    Scenario: obtener lista usuarios
        Given path 'api','users',2
        When method get
        Then status 200
        And match response.data.id == 2
        And match response.data.first_name == 'Janet'
        And match response.data.email == '#string'
 
        @crearUsuarioBody
    Scenario: Crear usuario usando body desde archivo json
        * def body = read('classpath:data/json/bodyUsuario.json')
        Given path 'api','users'
        And request body
        When method post
        Then status 201
        And match response.name == 'Giovanna'
        And match response.job == 'QA'
        And match response.createdAt == '#string'
 
        @ejemploactualizar
    Scenario: Actualizar
        Given path 'api','users', 2
        And request
        """
            {
                "name": "morpheus",
                "job": "zion resident"
            }
        """
        When method put
        Then status 200
        And match response.name == 'morpheus'
        And match response.job == 'zion resident'
        And match response.updatedAt == '#string'