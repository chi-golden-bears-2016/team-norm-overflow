$(document).ready(function() {
  $("#new-answer").on("submit", function(event){
    event.preventDefault();
    var url = $(this).attr("action");
    var answerBody = $(this).serialize();
    var method = $(this).attr("method");
    var id = $(this).parent().attr("id");
    console.log(answerBody)
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
      console.log(response)
      var commentPartial= `<li class='comment' id=${response[0].id}>${response[0].body} - <a href='/users/${response[0].author_id}'>${response[1].username}</a> <span class='status'>0 minutes ago</span></li>`
      var id = response[0].commentable_id
      var a = $("#" + id + ".comments.list").append(commentPartial);
    })
  })
});
