# jamsa-server

Blind helper project (server)

## Overview
This project implements the server side of the Jamsa Project. It provides a REST API to get and store actions.

## Design
An API REST has been implemented because it is very light and it allow us to separate the RFID tags from the content. So updating the "content" of a tag only requires a simple POST request to the API.

* Getting the information from a tag ID only takes one simple GET request:
```
curl http://server/1234
{
   "status" : 0,
   "data" : "This is a sample",
   "id" : "1234",
   "command" : "speech"
}
```
** status: 0 if OK and -1 if ERROR.
** id: tag id (useful for the client to check if the answer matches the request).
** command: action that the client has to execute.
** data: arguments for the command.

Therefore the client will execute the speech command, that is a text to speech action over the data field.

* Store the information of a tag.


## Technology


