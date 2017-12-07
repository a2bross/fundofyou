// function progress() {
//   var prg = document.getElementById('progress');
//   var percent = document.getElementById('percent-count');
//   var counter = 5;
//   var progress = 25;
//   var id = setInterval(frame, 50);

//   function frame() {
//     if (progress == 500 && counter == 100) {
//       clearInterval(id);
//     } else {
//       progress += 5;
//       counter +=1;
//       prg.style.width = progress + 'px';
//       percent.innerHTML = counter + '%';
//     }
//   }
// }

// progress();


function progress() {
  var prg = document.getElementById('progress');
  var percent = document.getElementById('percent-count');
  var counter = 5;
  var progress = 25;
  var id = setInterval(frame, 50);

  function frame() {
    if (progress == 330 && counter == 66) {
      clearInterval(id);
    } else {
      progress += 5;
      counter +=1;
      prg.style.width = progress + 'px';
      percent.innerHTML = counter + '%';
    }
  }
}

if (document.getElementById('progress')) {
  progress();
}
