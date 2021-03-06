$(document).ready(function() {
  $("#new-answer").on("submit", function(event){
    event.preventDefault();
    var url = $(this).attr("action");
    var answerBody = $(this).serialize();
    var method = $(this).attr("method");
    var id = $(this).parent().attr("id");
    $.ajax({
      url: url + "?" + answerBody,
      method: method
    }).done(function(response){
      var a = $(".answer.list").append(response);
    })
  });

  $(".new-comment").on("submit", function(event){
    event.preventDefault();
    var url = $(this).attr("action");
    var commentBody = $(this).serialize();
    var method = $(this).attr("method");
    $.ajax({
      url: url + "?" + commentBody,
      method: method
    }).done(function(response){
      var commentPartial= `<li class='comment' id=${response[0].id}>${response[0].body} - <a href='/users/${response[0].author_id}'>${response[1].username}</a> <span class='status'>0 minutes ago</span></li>`
      var id = response[0].commentable_id
      var a = $("#" + id + ".comments.list").append(commentPartial);
    })
  })

  $(".best-answer-form").on("submit", function(event){
    event.preventDefault();
    var url =$(this).attr("action");
    var commentBody = $(this).serialize();
    var method = $(this).attr("method");
    $.ajax({
      url: url,
      method: method
    }).done(function(response){
      $(this).hide();
    })
  })

  $(".answer.list").on("submit", function(event){
    console.log();
    event.preventDefault();
    var url = event.originalEvent.srcElement.action;
    var method = event.originalEvent.srcElement.method;
    $.ajax({
      url:url,
      method:method
    }).done(function(response){
      $(".best-answer-form").html("<img src='../../images/best_answer.png'>");
    })
  })
    $(".votebuttons").on("click", function(event){
      event.preventDefault()
      var voteableType = $(this).parent().attr("name")
      var voteableId = $(this).parent().attr("id")
      var voteValue = $(this).attr("value")
      var url = $(this).parent().attr("action")
      var method = $(this).parent().attr("method")

      $.ajax({
        method: method,
        url: url,
        data: {voteable_type: voteableType, voteable_id: voteableId, vote: voteValue}
      })
        .done(function(response){
          $("."+response.voteable_type+"."+response.voteable_id).text(response.points)
          console.log("done")

        });
    });
});
