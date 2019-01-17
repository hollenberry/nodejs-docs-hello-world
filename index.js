var http = require('http');
require('dotenv').config()
const octokit = require('@octokit/rest')()

var server = http.createServer(async function(request, response) {

    response.writeHead(200, {"Content-Type": "text/plain"});

    octokit.authenticate({
      type: 'token',
      token: process.env.GITHUB_TOKEN
    })
    
  try {
      const user = await octokit.users.getAuthenticated({})
      response.end(`Hi there, ${user.data.login}`)
    } catch (err) {
      response.end(`I don't know who you are.`)
      console.log(err)
    }


});

var port = process.env.PORT || 1337;
server.listen(port);

console.log("Server running at http://localhost:%d", port);
