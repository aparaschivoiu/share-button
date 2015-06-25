module.exports = ->
  @Given /^I create a Google Plus Share Button$/, () ->
    @driver.get(@Widgets.fixture('googleplus'))

  @When /^I click the Google Plus Share Button$/, () ->
    new @Widgets.ShareButton().clickButton()

  @Then /^I should see the Google Plus button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('gplus')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Google Plus button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('gplus')
    )
    .then (list) ->
      list[0].click()

  @Then /^I should see a new Google Plus window$/, () ->
    # express the regexp above with the code you wish you had
