bitlyClient = require './index' 


bitly = new bitlyClient process.env.user, process.env.pwd, (error) ->
  if !error
    bitly.get 'highvalue', {limit:3}, (error, result) ->
      console.log if !error then result else error
  else 
    console.log error