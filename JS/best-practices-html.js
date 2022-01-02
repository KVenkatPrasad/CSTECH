
// Function to show and hide references for a requirement

function toggleRefs( id ) {

  var refsID = "ref" + id;
  var tID = "t" + id;

  var  refsNode = document.getElementById(refsID);
  var  tNode = document.getElementById(tID);

  if( refsNode ) {

    if( refsNode.style.display == "none" ) {
      refsNode.style.display = "block";
      tNode.innerHTML = "Hide";
    } else {
      refsNode.style.display = "none";
      tNode.innerHTML = "Show";
    }

  }
    
}

// Creates hover effects for IE

function ieHover(flag, id ) {

  var aID = "a" + id;

  var  aNode = document.getElementById(aID);

  if( aNode )
    if( flag ) {
      aNode.style.textDecoration = "underline";
    } else {
      aNode.style.textDecoration = "none";
    }

}

