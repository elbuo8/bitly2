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
      if !error #Obtained the token successfully
        @access_token = body 
        callback()
      else #Didn't get the token
        callback(error)
    
    #API Access URL
    @url = 'https://api-ssl.bitly.com/v3/'
    
  #All get methods can be access through this interface
  get: (endpoint, parameters, callback) =>
    parameters.access_token = @access_token
    
    #Build HTTP Request Params
    params = 
      'url' : @url + endpoint + '?' + querystring.stringify(parameters)
      
    request.get params, (error, response, body) ->
      callback(error, body)
    
module.exports = bitly