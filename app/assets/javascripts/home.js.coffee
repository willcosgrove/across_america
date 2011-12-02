# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

root = exports ? this

class root.DonationBar
  constructor: (@donated) ->
    @total = 5000
    @paper = Raphael('donation_bar', 960, 200)
    @barBG = @paper.rect(10,10,940,100,50)
    @barBG.attr({'fill': '#333', 'stroke-width': 0})
    @bar = @paper.rect(10,10,100,100,50)
    @bar.attr({ 'stroke-width': 0, 'fill': "url('/assets/bar_pattern.png')", 'fill-opacity': 1.0})
    text_x = (@donated/@total)*470
    if text_x < 70
      text_x = 70
    @donatedText = @paper.text(text_x,140,$("#donation_bar").data("donated-formatted"))
    @donatedText.attr({'font-family': 'calluna', 'fill': '#fff', 'font-size': 72})
    
    @growBar()

  growBar: ->
    bar_width = (@donated/@total)*940
    if bar_width < 100
      bar_width = 100
    anim = Raphael.animation({'width': bar_width}, 500)
    @bar.animate(anim.delay(10))

  addMoney: (money) ->
    @donated += money
    @growBar()

jQuery ->
  donation_bar = new DonationBar($("#donation_bar").data("donated"))
  $("#donate_now_tab").click ->
    $('#new_donation').slideToggle()
    $('#donate_now_tab span').toggle()
  $('.alert-message close').click =>
    $(self).parent.fadeOut()