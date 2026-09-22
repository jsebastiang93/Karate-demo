Feature: Autorización básica oauth

    Scenario: Autenticación base64
    * def base64 = Java.type('java.util.Base64')
    * def encoded = base64.getEncoder().encodeToString('juan.gutierrez02@unicatolica.edu.co:JMWQVmv8r2gRQd9'.getBytes())
    * def authHeader = 'Basic ' + encoded 
    * def result = {authHeader: '#(authHeader)'}