jQuery ->
	alert "Please work"

	$('document').on 'click', '.execute', (event) ->
      execute()

    $(".randomclass").on "click", (event) ->
      alert "this is a test"
      event.preventDefault()