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
    // console.log("clicked");
    var button = $(this);
    var url = '/questions/' + button.data().questionId + '/upvote';

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'json'
    })

    .done(function(responseData) {
      button.siblings('h3').children().children().text(responseData)
      // console.log(responseData);
    })

    .fail(function() {
      alert("You've already voted on this.");
    });
  });
});