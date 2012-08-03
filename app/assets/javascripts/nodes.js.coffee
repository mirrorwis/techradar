# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
TechRadar = {}

TechRadar.observeHotness = ->
  console.log "observeHotness"

  names = ['Hold', 'Assess', 'Trial', 'Adopt']
  descriptions = [ 'Proceed with caution.',
    'Worth exploring with the goal of understanding how it will affect your enterprise.',
    'Worth pursuing. It is important to understand how to build up this capability. Enterprises should try this technology on a project that can handle the risk.',
    'We feel strongly that the industry should be adopting these items. We use them when appropriate on our projects.'
  ]
  updateHotness = ->
    $el = $(this)
    hot = $el.val()
    level = Math.floor(hot/100)
    name = names[level]
    description = descriptions[level]
    $('#hotness-status').html "<strong>#{$('#node_name').val()}</strong> should be <strong>#{name}</strong>, so #{description}"

  $('#node_hotness').on 'change', updateHotness

TechRadar.observeHotness();

window.TechRadar = TechRadar;
