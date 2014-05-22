ready = ->
  $('pre code').each (i, e) ->
    hljs.highlightBlock(e)

$(document).ready(ready)
$(document).on('page:load', ready)
