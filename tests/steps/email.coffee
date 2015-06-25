path = require 'path'

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create an Email Share Button$/, () ->
    @driver.get(fixture('email'))

  @When /^I click the Email Share Button$/, () ->
    new @Widget
      root: 'label'
    .click()

  @Then /^I should see the Email button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('paper-plane')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Email button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('paper-plane')
    )
    .then (list) ->
      list[0].click()

  @Then /^I should see a new Email window$/, () ->
    # express the regexp above with the code you wish you had
