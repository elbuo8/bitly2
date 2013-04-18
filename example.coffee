bitlyClient = require './index' 


bitly = new bitlyClient process.env.user, process.env.password, (error) ->
  if !error
    bitly.get 'highvalue', {'limit': 2}, (error, result) ->
      console.log if !error then result else error