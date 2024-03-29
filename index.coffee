request = require 'request'
querystring = require 'querystring'

class bitly
  constructor: (username, password, callback) ->
    
    #Build headers to obtain access_token
    headers = 
      'authorization': "Basic " + new Buffer(username + ":" + password).toString('base64'),
    #Auth Endpoint
    OAuthurl = "https://api-ssl.bitly.com/oauth/access_token"
    #HTTP Request Params
    params = 
      'url' : OAuthurl,
      'headers': headers
      
    #Perform request
    request.post params, (error, response, body) =>

      if response.statusCode == 200 #Obtained the token successfully
        @access_token = body 
        callback()
      else #Didn't get the token
        callback(body)
    
    #API Access URL
    @url = 'https://api-ssl.bitly.com/v3/'
    
  #All get methods can be access through this interface
  get: (endpoint, parameters, callback) =>
    if arguments.length == 2 
      callback = parameters
      parameters = {}
    parameters.access_token = @access_token
    
    #Build HTTP Request Params
    params = 
      'url' : @url + endpoint + '?' + querystring.stringify(parameters)
          
    request.get params, (error, response, body) ->
      if response.statusCode == 200 then callback(error, JSON.parse body) else callback(JSON.parse body, null)
    
module.exports = bitly