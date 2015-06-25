module.exports = ->
  @Given /^I create a Twitter Share Button$/, () ->
    @driver.get(@Helpers.fixture('twitter'))

  @When /^I click the Twitter Share Button$/, () ->
    new @Widgets.ShareButton().clickButton()

  @Then /^I should see the Twitter button$/, () ->
    new @Widgets
      .ShareButtonNetworks()
      .filter( (item) ->
        item.getAttribute('style')
          .then (style) ->
            style is 'display: block;'
          .then (itemStyle) ->
            item.hasClass('twitter')
              .then (itemClass) ->
                return itemStyle && itemClass
      )
      .should.eventually.have.length(1)

  @When /^I click the Twitter button$/, () ->
    new @Widgets
    .ShareButtonNetworks()
    .filter( (item) ->
      item.hasClass('twitter')
    )
    .then (list) ->
      list[0].click()

  @Then /^I should see a new Twitter window$/, () ->
    new @Widgets.ShareButton().switchToPopup()
    @driver.getTitle().should.eventually.eql("Post a Tweet on Twitter")

  @Then /^I should have a Twitter share url$/, () ->
    @driver.getCurrentUrl().should.eventually.eql("https://twitter.com/intent/tweet?text=A%20simple,%20light,%20flexible,%20and%20good-looking%20share%20button&url="+ @Helpers.fixture('twitter'))
