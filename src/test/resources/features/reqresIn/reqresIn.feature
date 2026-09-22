@APIusuariosReqres
Feature: Ejemplo automatización API reqres.in Listar usuarios específicos.

    Background:
        * url 'https://reqres.in'

        @listarUsuario
    Scenario: Listar usuarios específicos
    #Given url 'https://reqres.in'
        And path 'api/users', 2
        When method get
        Then status 200
        And match response.data.id ==2
        And match response.data.first_name == 'Janet'

        @crearUsuarioManual
    Scenario: Crear Usuario manual

    #Given url 'https://reqres.in'
        And path 'api','users'
        And request
        # JSON BODY manual
        """
            {
                "name": "Jhordin",
                "job": "QA"
            }
        """
        When method post
        Then status 201
        And match response.name == 'Jhordin'
        And match response.job == 'QA'
        And match response.createdAt == '#string'

        @crearUsuarioBody
    Scenario: Crear usuario usando body desde archivo json
        * def body = read('classpath:data/json/bodyUsuario.json')
        Given path 'api','users'
        And request body
        When method post
        Then status 201
        And match response.name == 'morpheus'
        And match response.job == 'leader'

        @actualizarUsuario
    Scenario: actualizar usauarios
    #Given url 'https://reqres.in'
        Given path 'api','users',2
        And request
        """
            {
                "name": "morpheus",
                "job": "zion resident"
            }
        """
        When method post
        Then status 201
        And match response.name == 'morpheus'
        And match response.job == 'zion resident'
        And match response.updatedAt == '#string'

        @eliminarUsuario
    Scenario: eliminar usauario
    #Given url 'https://reqres.in'
        Given path 'api','users',2
        When method delete
        Then status 204
 
        # Comando ejecución con tags | mvn test "-Dkarate.options=--tags @tagUusado"