request = require 'request'
cheerio = require 'cheerio'

module.exports = (robot) ->
  robot.respond /nonomulish\s*(.*)\s*$/i, (res) ->
    message = res.match[1]
    request
      .post
        url: 'http://www.brownmush.net/kengi'
        form: { message: message }
      , (e, r, body) ->
        $ = cheerio.load body
        res.send $('p.lead').text()
