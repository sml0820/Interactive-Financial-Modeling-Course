jQuery ->

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    $(".excelCreator, .videoCreator, .mcCreator").hide()
    $('.stepRadio:checked').change()
    event.preventDefault()

  $(document).on 'change', '.stepRadio', ->
    $container = $(@).closest('.stepCreator')
    $container.find(".excelCreator, .videoCreator, .mcCreator").hide()
    if @value is "video"
      $container.find(".videoCreator").show()
    else if @value is "excel"
      $container.find(".excelCreator").show()
    else if @value is "multiple_choice"
      $container.find(".mcCreator").show()
  $('.stepRadio:checked').change() 
