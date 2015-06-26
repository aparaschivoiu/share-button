fs = require 'fs'

module.exports = ->

  @Given /^I create am Animation Share Button$/, () ->
    @driver.get(@Helpers.fixture('animation'))

  @Then /^The classes will be correct at middle center$/, () ->
    social = new @Widgets.ShareButtonSocial()
    social.hasClass('top').should.eventually.be.true
    social.hasClass('center').should.eventually.be.true

  @Then /^The classes will be correct at bottom left$/, () ->
    social = new @Widgets.ShareButtonSocial()
    social.getAttribute('class')
    social.hasClass('right').should.eventually.be.true

  @Then /^The classes will be correct at middle left$/, () ->
    social = new @Widgets.ShareButtonSocial()
    social.getAttribute('class')
    social.hasClass('middle').should.eventually.be.true

  @Then /^The classes will be correct at top left$/, () ->
    social = new @Widgets.ShareButtonSocial()
    social.getAttribute('class')
    social.hasClass('bottom').should.eventually.be.true

  @Then /^The classes will be correct at top center$/, () ->
    social = new @Widgets.ShareButtonSocial()
    social.getAttribute('class')
    social.hasClass('center').should.eventually.be.true

  @Then /^The classes will be correct at top right$/, () ->
    social = new @Widgets.ShareButtonSocial()
    social.getAttribute('class')
    social.hasClass('left').should.eventually.be.true

  @Then /^The classes will be correct at middle right$/, () ->
    social = new @Widgets.ShareButtonSocial()
    social.getAttribute('class')
    social.hasClass('middle').should.eventually.be.true

  @Then /^The classes will be correct at bottom right$/, () ->
    social = new @Widgets.ShareButtonSocial()
    social.getAttribute('class')
    social.hasClass('top').should.eventually.be.true

  @Then /^The classes will be correct at bottom center$/, () ->
    social = new @Widgets.ShareButtonSocial()
    social.getAttribute('class')
    social.hasClass('center').should.eventually.be.true
