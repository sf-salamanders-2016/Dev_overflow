$(document).ready(function() {
  questionVoteListener();
  answerVoteListener();

});

// Ajax request for voting on a Question
var questionVoteListener = function(){
  $(".qVoteBtn").on("click", function(event){
    // prevent button from submitting POST request
    event.preventDefault();
    var form = $(this).parent().parent();
    var questionID = form.attr("id");
    var vote = $(this).val(); // true or false translate to key:value

    console.log(this);
    $.ajax({
      method: "post",
      url: "/questions/" + questionID + "/votes",
      data: { upVote: vote } // pass true or false value into controller
    })

    .done(function(response){
    // console.log(response);
      $("#votePopularity").html(response);
      form.find(".qVoteBtn").prop("disabled", true);
      // .attr("disabled", "disabled");
    });
  });
};

// Ajax request for voting on an Answer
var answerVoteListener = function(){
  $(".aVoteBtn").on("click", function(event){
    // prevent button from submitting POST request
    event.preventDefault();
    // this is the button that was clicked
    var form = $(this).parent().parent();
    var answerID = form.attr("id"); // id = "<%=answer.id%>"
    var vote = $(this).val(); // true or false translate to key:value
    // what question is this page for? (to put it in the url route)
    // way to look up the question ID
    // (attr returns first id)
    var questionID = $(".voteform").attr("id");
    // console.log(vote);

    $.ajax({
      method: "post",
      url: "/questions/" + questionID + "/answers/" + answerID + "/votes",
      data: { upVote: vote } // pass true or false value into controller
    })

    .done(function(response){
      $("#a" + answerID).html(response);
      form.find(".aVoteBtn").prop("disabled", true);
    });
  });
};
