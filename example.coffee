bitlyClient = require 'bitly2' 


bitly = new bitlyClient process.env.bitly_user, process.env.bitly_password, (error) ->
  if !error
    bitly.get 'highvalue', {'limit': 2}, (error, result) ->
      if !error then console.log result else console.log error