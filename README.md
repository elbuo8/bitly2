# bitly2 #

This minimalistic module will allow you to interface bitly's API using Nodejs. This module works specifically
with OAuth, therefore most endpoints should be accessible.

Bitly's API can be found [here](http://dev.bitly.com/).

Feel more than free to submit pull requests or comments.

## License ##

Licensed under the MIT License.

## Install ##

```
npm install bitly2
```

## Usage ##

```
var bitly, bitlyClient;

bitlyClient = require('bitly2');
// Replace proccess.env.bitly_user & process.env.bitly_password with your own credentials!
bitly = new bitlyClient(process.env.bitly_user, process.env.bitly_password, function(error) {
  if (!error) {
    bitly.get('highvalue', {'limit': 2}, function(error, result) {
      if (!error) {
        console.log(result);
      }
      else {
        console.log(error);
      }
    });
  }
});


## Why?

Why would you build yet another module? After a quick scan all of the current modules I found were using the
deprecated ```apiKey``` method. I figured I might just implement a OAuth one. Keeping it simple :)

Plus this is my cover letter :)

### Todo
* Tests