$( document ).ready(function() {
  // $(".accordion").accordion({
  // 	collapsible: true,
  // 	active: false,
  // 	heightStyle: "content"
  // 	// this.show()
  // });

  // Vote buttons for questions
  $('.post-show').on('click', '.upvote', function(event) {
    event.preventDefault();
    event.stopPropagation();
    console.log("clicked");

    var icon = $(this)
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

    $('.post-show').on('click', '.downvote', function(event) {
    event.preventDefault();
    event.stopPropagation();
    console.log("clicked");

    var icon = $(this)
    var url = '/posts/' + icon.data().postId + '/downvote';

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

  $('.comment-list').on('click', '.edit-comment', function(event) {
    event.preventDefault();
    console.log("clicked");

    var editLink = $(this)
    console.log(editLink)
    var url = '/posts/' + icon.data().postId + '/downvote';

    $.ajax({
      url: url,
      type: 'GET',
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