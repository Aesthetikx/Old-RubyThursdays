ready = ->
  if $('.tag-cloud').size() > 0
    $.ajax '/posts/tags',
      type: 'GET',
      success: (data, textStatus, jqXHR) ->
        $('.tag-cloud').hide().html(data).fadeIn(400)

$(document).ready(ready)
$(document).on('page:load', ready)
