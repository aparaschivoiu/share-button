module.exports = ->
  @Given /^I create a Reddit Share Button$/, () ->
    @driver.get(@Helpers.fixture('reddit'))

  @When /^I click the Reddit Share Button$/, () ->
    new @Widgets.ShareButton().clickButton()

  @Then /^I should see the Reddit button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('reddit')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Reddit button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('reddit')
    )
    .then (list) ->
      list[0].click()

  @Then /^I should see a new Reddit window$/, () ->
    # express the regexp above with the code you wish you had
