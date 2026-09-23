Feature: Api con autorizacion por token
 
Background:
* def obtenerToken = call read('classpath:features/common/ejemploToken.feature')
 
Scenario: Ejemplo api obtener usuario
Given url 'https://banco.com'
And path 'user/v1/conulta/'
And param idUsuario = 1
And header Authorization = 'Bearer ' + obtenerToken.token
 
When method post
Then status 200