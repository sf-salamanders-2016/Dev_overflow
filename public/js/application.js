$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()


});

// Ajax request for voting
var upVoteListener = function(){
  $(".vote-button").on('submit', '.voteform', function(event){
    // var clicked_button = $(this)

    // prevent button from submitting POST request
    event.preventDefault();
    alert($(this));
  });
};


