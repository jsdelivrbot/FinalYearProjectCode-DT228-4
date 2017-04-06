## Setting up the app
For all of the projects in this repository there is a dependency on a configuration file.
First ensure that the configuration file is present in directory /etc/quick/config.json
as it contains the details to access the MongoDB and Google Map Distance Matrix API.
The configration file can be created using the QuickConfig script else use the following template to store the information
```javascript
{
  "databases": [
    {
      "database": "database-name-goes-here",
      "password": "password-goes-here",
      "port": "port-goes-here",
      "uri": "uri-goes-here",
      "username": "username-goes-here"
    }
  ],
  "gmaps": "google-maps-key-goes-here",
  "token": {
    "secret": "jwt-secret-goes-here"
  }
}
```

Once this has been done the projects can be built and run, each proejct has another README with information on how to run and build.