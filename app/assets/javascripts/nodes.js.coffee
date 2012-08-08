# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
TechRadar = {}

TechRadar.observeHottness = ->
  console.log "observeHottness"

  names = ['Hold', 'Assess', 'Trial', 'Adopt']
  descriptions = [ 'Proceed with caution.',
    'Worth exploring with the goal of understanding how it will affect your enterprise.',
    'Worth pursuing. It is important to understand how to build up this capability. Enterprises should try this technology on a project that can handle the risk.',
    'We feel strongly that the industry should be adopting these items. We use them when appropriate on our projects.'
  ]
  updateHottness = ->
    $el = $(this)
    hot = $el.val()
    level = Math.floor(hot/100)
    name = names[level]
    description = descriptions[level]
    $('#hotness-status').html "<strong>#{$('#node_name').val()}</strong> should be <strong>#{name}</strong>, so #{description}"

  $('#node_hotness').on 'change', updateHottness

class SquareCanvas
  constructor: (@width) ->
    @middleOffset = [@width/2, @width/2]

class Node
  @nodeRadius: 8
  constructor: (@data, @canvas) ->
    console.log "@data", @data

  level: ->
    console.log "hottness", @data.hottness
    Math.floor(@data.hottness/100)

  reverseLevel: ->
    4 - @level()

  layout: (@angle) ->
    # Angle is 0 -> 360
    levelDifference = @canvas.width / 8
    radius = @reverseLevel() * levelDifference
    agnelValue = 0.017453293 * angle
    @left = @canvas.middleOffset[0] + (4 * levelDifference * (1 - @data.hottness / 400) * Math.sin(agnelValue)) - @constructor.nodeRadius
    @top =  @canvas.middleOffset[1] + (4 * levelDifference * (1 - @data.hottness / 400) * Math.cos(agnelValue)) - @constructor.nodeRadius

  html: ->
    style = "left: #{@left}px; top: #{@top}px"
    html = """<a class="node" href="#{@data.url}" data-category="#{@data.category}" data-name="#{@data.name}" data-hottness="#{@data.hottness}" style="#{style}" title="#{@data.name}, #{@data.hottness/100}, #{@angle}"><span class="node-name">#{@data.name}</span></a>
"""


TechRadar.drawRadar = (nodes) ->
  canvas = new SquareCanvas 600
  _nodes = []

  layout = (nodes) ->
    all_nodes = {"l0": [], "l1": [], "l2": [], "l3": []}
    for node_data in nodes
      node = new Node node_data, canvas
      console.log "l#{node.level()}"
      all_nodes["l#{node.level()}"].push node
      _nodes.push node

    for own l, neighbors of all_nodes
      neighborsSize = neighbors.length
      for node, index in neighbors
        node.layout(360 * index / neighborsSize)

    return _nodes

  nodes = layout(nodes)

  $canvas = $('#canvas')

  htmls = ""
  for node in nodes
    htmls += node.html()
  console.log htmls
  $canvas.append htmls

TechRadar.observeHottness();

window.TechRadar = TechRadar;
