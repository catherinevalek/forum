$( document ).ready(function() {
  $(".accordion").accordion({
  	collapsible: true,
  	active: false,
  	heightStyle: "content"
  	// this.show()
  });

  // Vote buttons for questions
  $('.post-show').on('click', '.upvote', function(event) {
    event.preventDefault();
    console.log("clicked");
    var icon = $(this);
    var url = '/posts/' + icon.data().postId + '/upvote';

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json'
    })

    .done(function(responseData) {
      $('#post-vote-count').text(responseData["votes"])
      console.log(responseData);
    })

    .fail(function() {
      alert("You've already voted on this.");
    });
  });
});