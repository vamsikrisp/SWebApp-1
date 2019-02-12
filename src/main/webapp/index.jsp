<html>
<head>
<title>Bitcoin Price Index Watcher in HTML5</title>
<style type="text/css">
  #data {
    width: 400px;
    border: 1px dashed black;
    font-size: 20px;
    text-align: center;
    margin: 0 auto;
    margin-top: 50px;
    padding: 10px;
  }

  #logo {
    width: 320px;
    height: 320px;
    margin: 0 auto;
    margin-top: 50px;
    display: block;
  }
</style>
</head>
<body>
  <img id="logo" src="https://www.ssaurel.com/cryptocoins/screenshots/web_hi_res_512.png" />
  <div id="data" />
  <script type="text/javascript">
    var xmlhttp = new XMLHttpRequest();
    var url = "https://api.coindesk.com/v1/bpi/currentprice.json";

    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4  &&  this.status == 200) {
        var json = JSON.parse(this.responseText);
        parseJson(json);
      }		
    };

    xmlhttp.open("GET", url, true);
    xmlhttp.send();
    function parseJson(json) {
      var time = "<b>Last Updated : " + json["time"]["updated"] + "</b>";
      var usdValue = "1 BTC equals to $" + json["bpi"]["USD"]["rate"];

      document.getElementById("data").innerHTML = time + 
	       "<br /><br />" + usdValue + 
		   "<br />" + gbpValue + 
		   "<br />" + euroValue;
}
</script>
</body>
</html>
