# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

root = exports ? this

class root.DonationBar
  constructor: (@donated) ->
    @total = 10000
    @paper = Raphael('donation_bar', 940, 100)
    @barBG = @paper.rect(0,0,940,100,50)
    @barBG.attr({'fill': '#ddd', 'stroke-width': 0})
    @bar = @paper.rect(0,0,100,100,50)
    @bar.attr({ 'stroke-width': 0, 'fill': "url('/assets/bar_pattern.png')", 'fill-opacity': 1.0})
    @growBar()

  growBar: ->
    anim = Raphael.animation({'width': (@donated/@total)*940}, 500)
    @bar.animate(anim.delay(10))

  addMoney: (money) ->
    @donated += money
    @growBar()

jQuery ->
  donation_bar = new DonationBar($("#donation_bar").data("donated"))