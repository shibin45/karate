Feature: User API Tests

  Background:
    * url baseUrl
    * header x-api-key = token


    Scenario: Get the users
      Given path '/api/users/2'
      When method GET
     # * print 'Headers:', responseHeaders
      * print 'Full_Response:', response
      * print 'email', response.data.email
      Then status 200
      And match response.data.email == '#notnull'


      Scenario: create a user
        * def payload = read('classpath:user-details.json')
        * def expectedSchema = read('classpath:expectedSchema.json')
        Given path '/api/users'
        And request payload
        When method POST
        * def fetchKey = responseHeaders['x-api-key']
        * print "expectedSchema is:", expectedSchema
        * print "fetchKey is:", fetchKey
        * print "responseHeaders:", responseHeaders
        * print 'Full_Response:', response
        * print 'email', response.email
        Then status 201
        And match response == expectedSchema

        @smoke
        Scenario: get all the users
        Given path '/api/users'
        When method GET
        * print 'Full_Response:', response
        Then status 200
        And match each response.data == { id: '#notnull', email: '#notnull', first_name: '#notnull', last_name: '#notnull', avatar: '#notnull' }
