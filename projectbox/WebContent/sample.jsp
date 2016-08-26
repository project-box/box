<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="js/jquery.js"></script>
  <script>
  function getRequest() {
	    if(location.search.length > 1) {
	        var get = new Object();
	        var ret = location.search.substr(1).split('&');
	        for(var i = 0; i < ret.length; i++) {
	            var r = ret[i].split('=');
	            get[r[0]] = r[1];
	        }
	        return get;
	    }else{
	        return false;
	    }
	}
  
  $(document).ready(function() {
	  var get = getRequest();
	  var param = get['param'];
	  
	  alert(param);
	  
	  if(param == '123'){
		  $("#second").attr('class','active');
		  $("#menu1").attr('class', 'tab-pane fade in active');
	  } else {
		  $("#first").attr('class','active');
		  $("#home").attr('class', 'tab-pane fade in active');
	  }
	  
  });
  </script>
</head>
<body>

<div class="container">
  <h2>Dynamic Tabs</h2>
  <ul class="nav nav-tabs">
    <li id="first"><a data-toggle="tab" href="#home">Home</a></li>
    <!-- <li id="second" class="active"><a data-toggle="tab" href="#menu1">Menu 1</a></li> -->
    <li id="second"><a data-toggle="tab" href="#menu1">Menu 1</a></li>
    <li id="third"><a data-toggle="tab" href="#menu2">Menu 2</a></li>
    <li id="fourth"><a data-toggle="tab" href="#menu3">Menu 3</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade">
      <h3>HOME</h3>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
    <!-- <div id="menu1" class="tab-pane fade in active">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div> -->
    <div id="menu1" class="tab-pane fade">
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    <div id="menu2" class="tab-pane fade">
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
    <div id="menu3" class="tab-pane fade">
      <h3>Menu 3</h3>
      <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
    </div>
  </div>
</div>

</body>
</html>

