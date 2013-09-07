jQuery ->

  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $(".excelCreator, .videoCreator, .mcCreator").hide()
  $(".stepRadio").on "ifChecked", (event) ->
    $container = $(@).closest('.stepCreator')
    $container.find(".excelCreator, .videoCreator, .mcCreator").hide()
    if @value is "video"
      $container.find(".videoCreator").show()
    else if @value is "excel" 
      $container.find(".excelCreator").show()
    else if @value is "multiple_choice"
      $container.find(".mcCreator").show()