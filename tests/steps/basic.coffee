path = require 'path'

networks = [
  'pinterest'
  'twitter'
  'facebook'
  'whatsapp'
  'gplus'
  'reddit'
  'linkedin'
  'paper-plane'
]

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create a Share Button$/, ->
    @driver.get(fixture('basic'))

  @When /^I click the Share Button$/, ->
    new @Widget
      root: 'label'
    .click()

  @Then /^I should see all Social Networks$/, ->
    new @Widgets
    .ShareButtonNetworks()
    .each (item, index) ->
      item.isVisible().should.eventually.be.true
