jQuery ->
	alert "Please work"

	$('document').on 'click', '.execute', (event) ->
    execute()

    $("#mongoid").on "click", ->
      alert "howdy ho, there neighbor"
      event.preventDefault()