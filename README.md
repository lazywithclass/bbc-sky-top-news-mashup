### Requirements

 * Display top 10 headlines from the BBC and SKY on a webpage
 * Use a node.js server
 * All data should go through the nodejs server

### Howto

Run the server and open `mashup.html`.

### Features

The server exposes two endpoints

 * /sky
 * /bbc

it does not scrape each time a request is made, it scrapes every n seconds, keeping 
the received html and serving that, this way it doesn't flood and it's faster to answer.


### Scripts

To run the server 

    make run

while to run the tests and see the specs

    make test