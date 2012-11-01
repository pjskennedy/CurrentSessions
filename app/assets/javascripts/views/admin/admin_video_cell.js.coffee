class CurrentSessions.Views.AdminVideoCell extends Backbone.View

  template: JST['admin/video_cell']

  events: 
    'click #delete-video-button' : 'deleteVideo'

  render: () ->
    @model = this.model
    $(@el).html(@template({model: @model}))
    this

  deleteVideo: (event) =>
    event.preventDefault()
    cell = $(event.currentTarget).parent().parent().parent()
    video_id = cell.data("id")
    confirm_delete = confirm('You are about to delete the video "' + this.model.attributes.title + '"');
    @model.destroy( data: $.param({ vimeo_id: @model.attributes.vimeo_id }), success: () ->
      cell.animate({ height: '+= 50' }, "fast", () ->
        cell.animate({ opacity: 'toggle', height: 'toggle' }, "fast", () -> 
          cell.parent().remove()
        )
      )
    )
    # if confirm_delete
    #   $.ajax({
    #     type: "DELETE",
    #     url: "/admin/video/delete"
    #     data: "id=#{video_id}",
    #     success: (msg) ->
    #         cell.animate({ height: '+= 50' }, "fast", () ->
    #           cell.animate({ opacity: 'toggle', height: 'toggle' }, "fast", () -> 
    #             cell.parent().remove()
    #           )
    #         )
    #   })
      

