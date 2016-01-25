class CircleCIResponse

  constructor: (res) ->
    @body = res.body or {}
    @statusCode = res.statusCode

  success: () ->
    @statusCode >= 200 and @statusCode <= 299

  clientError: () ->
    if @statusCode >= 400 and @statusCode <= 499
      new Error "HTTP client error #{@statusCode}: #{@body.message}"

  serverError: () ->
    if @statusCode >= 500 and @statusCode <= 599
      new Error "HTTP server error #{@statusCode}: #{@body.message}"

module.exports = CircleCIResponse
