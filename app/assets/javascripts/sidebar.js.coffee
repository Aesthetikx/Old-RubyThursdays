jQuery ->
  $(document).scroll (event) ->
    scrollOffset = $(document).scrollTop()
    rubyOpacity = (scrollOffset / 100)
    thursdaysOpacity = (scrollOffset / 500)

    if rubyOpacity > 1.0
      rubyOpacity = 1.0

    if thursdaysOpacity > 1.0
      thursdaysOpacity = 1.0

    ruby = $('header div.title span#ruby')
    thursdays = $('header div.title span#thursdays')

    ruby.css({opacity: rubyOpacity})
    thursdays.css({opacity: thursdaysOpacity})
