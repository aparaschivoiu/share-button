path = require 'path'

fixture = (name) ->
  fixtureBase = path.join(path.resolve(__dirname, "../", "fixtures"), name)
  return "file:///" + fixtureBase + '.html'

module.exports = ->
  @Given /^I create a Linkedin Share Button$/, () ->
    @driver.get(fixture('linkedin'))

  @When /^I click the Linkedin Share Button$/, () ->
    new @Widget
      root: 'label'
    .click()

  @Then /^I should see the Linkedin button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('linkedin')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Linkedin button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('linkedin')
    )
    .then (list) ->
      list[0].click()

  @Then /^I should see a new Linkedin window$/, () ->
    # express the regexp above with the code you wish you had
