 $(document).ajaxComplete (event, request) ->
  msg = request.getResponseHeader("X-Message")
  alert_type = request.getResponseHeader("X-Message-Type")

  unless request.getResponseHeader("X-Message-Type").indexOf("keep") is 0
    #add flash message if there is any text to display
    $("#flash_hook").replaceWith("<div id='flash_hook'></div>
      <div class='alert #{alert_type}' role='alert'>
        <button type='button' class='close' data-dismiss='alert'>
          <span aria-hidden='true'>&times;</span><span class='sr-only'>Close</span>
        </button>
        #{msg}
      </div>") if msg
    #delete the flash message (if it was there before) when an ajax request returns no flash message
    $("#flash_hook").replaceWith("<div id='flash_hook'></div>") unless msg