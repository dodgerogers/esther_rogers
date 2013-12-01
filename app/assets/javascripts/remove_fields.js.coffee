jQuery ->
	$("form").on "click", ".remove_fields", (event) ->
		$(this).prev("input[type=hidden]").val('1')
		$(this).closest(".field").hide()
		event.preventDefault()
		