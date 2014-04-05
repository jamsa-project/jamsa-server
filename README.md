# jamsa-server

Blind helper project (server)

## Overview
This project implements the server side of the Jamsa Project. It provides a REST API to get and store actions.

## Design
An API REST has been implemented because it is very light and it allow us to separate the RFID tags from the content. So updating the "content" of a tag only requires a simple POST request to the API.

The information in the server is stored in YAML files (one per tag).

* Getting the information from a tag ID only takes one simple GET request:
  * status: 0 if OK and -1 if ERROR.
  * id: tag id (useful for the client to check if the answer matches the request).
  * command: action that the client has to execute.
  * data: arguments for the command.
```
curl http://server/id
```
where server is the server where jamsa-server is installed and id is the tag ID.
The following is the request and JSON response from the server for the tag ID 1234:
```
curl http://server/1234
{
   "status" : 0,
   "data" : "This is a sample",
   "id" : "1234",
   "command" : "speech"
}
```

Therefore the client will execute the speech command, that is a text to speech action over the data field.

* Store the information of a tag.
```
curl -X POST -d "tag content" http://server/id/action
```
where id is the tag ID and action is the command associated to that tag.
The following is the request and response from the server for a tag ID 1234 with the command speech:
```
curl -X POST -d "tag content" http://server/1234/speech
{
    "status": 0
} 
```
status is 0 if OK and -1 if ERROR.
The following is the YAML file content in the server for the tag ID 1234.
```
$ cat 1234.yaml 
---
command: speech
data: tag content
```

