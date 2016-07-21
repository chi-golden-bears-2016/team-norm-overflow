$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $("#new-answer").on("submit", function(event){
    event.preventDefault();
    var url = this.attr("action");
    var data = this.serialize();
    var method = this.attr("method");
    $.ajax({
      url: url + "?" + data,
      method: "post"
    })
  })
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
