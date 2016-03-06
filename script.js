var form = document.getElementById('ta-form');
var wholeForm = $("#whole-form");
var newFormButton = document.getElementById('new-form');
var pdfButton  = $("#pdf");
var questions = ["personal-appearance","appearance-others","likes","dislikes","strengths"];

var score = 0;

document.getElementsByClassName('button')[0].addEventListener('click', function(e){
    console.log('clicked');
    document.getElementsByClassName('q1')[0].classList.add('hidden');
    document.getElementsByClassName('q2')[0].classList.remove('hidden');
    if(allFilled()){
        getAnswers(form);
    }
});

document.getElementsByClassName('button')[1].addEventListener('click', function(e){
    console.log('clicked');
    document.getElementsByClassName('q2')[0].classList.add('hidden');
    document.getElementsByClassName('q3')[0].classList.remove('hidden');
    if(allFilled()){
        getAnswers(form);
    }
});

document.getElementsByClassName('button')[2].addEventListener('click', function(e){
    console.log('clicked');
    document.getElementsByClassName('q3')[0].classList.add('hidden');
    document.getElementsByClassName('q4')[0].classList.remove('hidden');
    if(allFilled()){
        getAnswers(form);
    }
});

document.getElementsByClassName('button')[3].addEventListener('click', function(e){
    console.log('clicked');
    document.getElementsByClassName('q4')[0].classList.add('hidden');
    document.getElementsByClassName('q5')[0].classList.remove('hidden');
    if(allFilled()){
        getAnswers(form);
    }
});

document.getElementsByClassName('button')[3].addEventListener('click', function(e){
    console.log('clicked');
    document.getElementsByClassName('q4')[0].classList.add('hidden');
    document.getElementsByClassName('q5')[0].classList.remove('hidden');
    if(allFilled()){
        getAnswers(form);
    }
});

document.getElementsByClassName('button')[4].addEventListener('click', function(e){
    console.log('clicked');
    document.getElementsByClassName('q5')[0].classList.add('hidden');
    getAnswers(form);
});

newFormButton.addEventListener("click", function(e){
  wholeForm.removeClass("hidden");
  pdfButton.addClass("hidden inactive");
  $("#new-form").addClass("hidden");
  $("#wheel-svg").remove();
  $("#detail-text").remove();
  form.reset();
});

function getAnswers(form) {
  var formAnswers = $(form).serializeArray().reduce(function(array ,element){
    var obj = {
      question:element.name,
      answer:element.value
    };
    array.push(obj);
    return array;
  },[]);
  var textNode = document.createTextNode('Your Results');
  var node = document.createElement('h1');
  node.appendChild(textNode);
  document.getElementById('qanda').appendChild(node);
  formAnswers.forEach(function(x){
      var textNode = document.createTextNode(x.question + ': ' + x.answer);
      var node = document.createElement('li');
      node.appendChild(textNode);
      document.getElementById('qanda').appendChild(node);
  });
  console.log(formAnswers);
  return formAnswers;
}


function allFilled(){

  var detailsFilled = Array.prototype.slice.call(document.getElementsByClassName('student-details'));
  var answeredDetails = detailsFilled.filter(function(el){
      console.log(el.value);
    return el.value;
  });
  var unansweredDetails = detailsFilled.filter(function(el){
    return !el.value;
  }).map(function(el){
    return el.name;
  });

  var questionsAnswered = questions.map(function(el){
    var answered =  Array.prototype.slice.call(document.getElementsByName(el)).filter(function(el, i){
        console.log('answered ---- ', el, i);
        // console.log(el);
      return el.checked;
    });
    return answered.length || el;
  });

  var allQuestions = questionsAnswered.filter(function(el){
    return typeof el !== 'string';
  });
  console.log(allQuestions.length === 5, 'questions is 5!!!');
  if(allQuestions.length === 5){
    return true;
  } else {
    return false;
  }
}
