Feature: api obtener token
 
@TokenPorBody
    Scenario: obtener token mediante body request
 
        Given url 'https://ejemploToken.com'
        And path 'api/gas/token'
        And request
        """
            {
                "user": "usuario",
                "password": "password"
            }
        """
 
        And param usuario = "usuario"
        And param password = "password"
        And header
        """
            {
                "apikey": "aplikey",
                "suscriptionkey": "suscriptionkey"
            }
        """
 
        When method post
        Then status 200
 
        * def token = response.data.token