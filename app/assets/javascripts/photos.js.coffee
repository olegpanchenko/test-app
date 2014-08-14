class window.PhotosUploader
  constructor: (options)->
    @url = options.url

    # Initialize the jQuery File Upload widget
    $("#fileupload").fileupload()
    
    # Enable iframe cross-domain access via redirect option:
    $("#fileupload").fileupload "option", "redirect", window.location.href.replace(/\/[^\/]*$/, "/cors/result.html?%s")
      
    # Demo settings:
    $("#fileupload").fileupload "option",
      url: @url
      method: 'POST'
      # Enable image resizing, except for Android and Opera,
      # which actually support image resizing, but fail to
      # send Blob objects via XHR requests:
      disableImageResize: /Android(?!.*Chrome)|Opera/.test(window.navigator.userAgent)
      maxFileSize: 5000000
      acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i

    
    $("#fileupload").addClass "fileupload-processing"
    $.ajax(
      url: $("#fileupload").fileupload("option", "url")
      dataType: "json"
      context: $("#fileupload")[0]
    ).always(->
      $(this).removeClass "fileupload-processing"
    ).done (result) ->
      $(this).fileupload("option", "done").call this, $.Event("done"),
        result: result
