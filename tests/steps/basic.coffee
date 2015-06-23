path = require 'path'

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create a Share Button$/, ->
    @driver.get(fixture('basic'))
    @driver.wait()
    @driver.getTitle()
      .then (res) -> console.log(res)

  @When /^I click the Share Button$/, ->
    # express the regexp above with the code you wish you had

  @Then /^I should see all Social Networks$/, ->
    # express the regexp above with the code you wish you had
