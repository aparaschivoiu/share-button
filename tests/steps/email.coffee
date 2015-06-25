module.exports = ->
  @Given /^I create an Email Share Button$/, () ->
    @driver.get(@Helpers.fixture('email'))

  @When /^I click the Email Share Button$/, () ->
    new @Widgets.ShareButton().clickButton()

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
