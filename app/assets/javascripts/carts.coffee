$(window).load ->
  $('a[data-target]').click (e) ->
    e.preventDefault()
    $this = $(this)
    if $this.data('target') == 'Add to'
      url = $this.data('addUrl')
      new_target = 'Remove from'
    else
      url = $this.data('removeUrl')
      new_target = 'Add to'
    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.find('span').html(new_target)
      $this.data('target', new_target)

  $('#mycart .fi-x').click (e) ->
    e.preventDefault()
    $this = $(this).closest('a')
    url = $this.data('target')
    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.closest('.cart-movie').slideUp()
