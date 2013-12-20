jQuery ->


# executes the excel sheet checking formula contained within the excel.erb
	$(document).on 'click', '.execute', (event) ->
      execute()


   
# multiple choice answer checking script
    $(document).on 'click', '.mcSubmit', (event) ->
        userAnswer = parseInt($('.mcRadio:checked').val())
        actualAnswer = gon.mc_answer
        if userAnswer is actualAnswer
          $("#modal-simple-success").modal "show"
        else
          $("#modal-simple-failure").modal "show"
      






