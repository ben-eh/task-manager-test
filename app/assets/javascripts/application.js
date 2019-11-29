//= require rails-ujs
//= require_tree .

function ShowPicture(id,show, img) {
  if (show=="1"){
    document.getElementById(id).style.visibility = "visible"
    document.getElementById(id).childNodes[1].src = img;
  }
  else if (show=="0"){
    document.getElementById(id).style.visibility = "hidden"
  }
}
