# Coffeescript intro.

# Arrays and variables.
items = ['beer1', 'beer2', 'beer3', 'beer4']
fridge = 'full of beer'

# Inline if statements.
beer_lover = true if fridge == 'full of beer'

# Englishy conditional logic.
if fridge == 'full of beer' and items.length > 0
  beer_lover = true

# Single line loops.
while items.length > 0 then drinkBeer()

# Comprehensions.
for item in items
  console.log item

# Ranges.
for i in [5..0]
  alert i

# Clever comprehensions.
for item in items when item isnt 'beer2'
  console.log item

# Functions.
drinkbeer = ->
  beer = items.pop
  console.log beer

# Functions with arguments.
hello = (name) ->
  console.log "Hello " + name

fridge =
  beer: items
  chips: ["potato", "bbq", "human skin"]
  consume: (item) ->
    item.pop()
  drinkBeer: ->
    @beer.pop()

$(document).ready ->
  console.log 'hello world, document is ready'

  $('div').on 'click', ->
    console.log 'there was a click'

  $('p').click ->
    console.log 'someone clicked a paragraph'







