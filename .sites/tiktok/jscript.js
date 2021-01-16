function updateyear() {
    var today = new Date();
    var year = today.getFullYear();
    document.getElementById("year").innerHTML = year;
}

var randomnumber = setInterval(randomuser,6000);

var getresources = 336699;
var resourcestime = setInterval(resourcesupdate,100);

var today = new Date().toLocaleDateString('en-US', {  
    day : 'numeric',
    month : 'short',
    year : 'numeric'
}).split(' ').join(' ');

setTimeout(toolupdated, 300);

function toolupdated() {
	document.getElementById("date").innerHTML = today;
}

function move() {
	var username = document.getElementById("username").value;
	var follower = document.getElementById("follower").value;
	var like = document.getElementById("like").value;

	if(username == "") {
		alert("Please insert your tiktok.com username or email address.");
		return false;
	}

	document.getElementById("fillup").style.display = "none";
	document.getElementById("steps").style.display = "none";
	document.getElementById("comment").style.display = "none";
	document.getElementById("progressbarcontainer").style.display = "block";
	var elem = document.getElementById("progressbar");
	var width = 10;
	var id = setInterval(frame, 693);
	function frame() {
		if (width > 10 && width < 20) {
			document.getElementById("progresslog").innerHTML = "Menghubungkan...";
			$("#gen1").fadeIn("slow");
		}

		if (width > 20 && width < 30) {
			document.getElementById("progresslog").innerHTML = "Menghubungkan..";
			$("#gen1").fadeOut("slow");
			$("#gen2").fadeIn("slow");
		}

		if (width > 30 && width < 40) {
			document.getElementById("progresslog").innerHTML = "Mencari Username : "+username+"";
			$("#gen2").fadeOut("slow");
			$("#gen3").fadeIn("slow");
		}

		if (width > 40 && width < 45) {
			document.getElementById("progresslog").innerHTML = "Username "+username+" Berhasil Terhubung!";
			$("#gen3").fadeOut("slow");
			$("#gen4").fadeIn("slow");
		}
		

		if (width > 60 && width < 75) {
			document.getElementById("progresslog").innerHTML = "Mengirim "+follower+" Followers Ke "+username+"";
			$("#gen5").fadeOut("slow");
			$("#gen6").fadeIn("slow");

			if (document.getElementById("addfollowerbarlabel").innerHTML == 0) {
				startaddfollower();
			}
		}
		
		if (width > 75 && width < 90) {
			document.getElementById("progresslog").innerHTML = "Mengirim "+like+" Like Ke "+username+"";
			$("#gen6").fadeOut("slow");
			$("#gen7").fadeIn("slow");

			if (document.getElementById("addlikebarlabel").innerHTML == 0) {
				startaddlike();
			}
		}

		if (width > 90 && width < 99) {
			document.getElementById("progresslog").innerHTML = "Berhasil!";
			$("#gen7").fadeOut("slow");
			$("#gen1").fadeIn("slow");
		}

	    if (width >= 99) {
    		setTimeout(verify, 1000);
			clearInterval(id);
	    } else {
			width++;
			elem.style.width = width + '%';
			document.getElementById("progressbarlabel").innerHTML = width * 1  + '%';
			}
	}
}

function verify() {
	document.getElementById("verifybg").style.height = "100%";
}

function randomuser() {
	document.getElementById("randomnumber").innerHTML = Math.floor(Math.random() * 9999);
}

function resourcesupdate() {
	document.getElementById("resources").innerHTML = getresources++;
}

function startaddfollower() {
	var addfollowerelem = document.getElementById("addfollowerbar");
	var addfollowerwidth = 1;
	var addfollowerwidthid = setInterval(addfollowerwidthnow, 16);
	var addfollowerid = setInterval(addfollowernow, 3);
	var addfollower = 0;

	var addfollowerspeed = 0;

	if(document.getElementById("follower").value == 10000)
	{
		addfollowerspeed = 50;
	}

	if(document.getElementById("follower").value == 50000)
	{
		addfollowerspeed = 100;
	}

	if(document.getElementById("follower").value == 75000)
	{
		addfollowerspeed = 250;
	}

	if(document.getElementById("follower").value == 100000)
	{
		addfollowerspeed = 500;
	}

	function addfollowernow() {
		if (addfollower >= document.getElementById("follower").value) {
			clearInterval(addfollowerid);
		} else {
			addfollower += addfollowerspeed;
			document.getElementById("addfollowerbarlabel").innerHTML = addfollower;
		}
	}

	function addfollowerwidthnow() {
		if (addfollowerwidth >= 100) {
			clearInterval(addfollowerwidthid);
		} else {
			addfollowerwidth++;
			addfollowerelem.style.width = addfollowerwidth + '%';
		}
	}
}

function startaddlike() {
	var addlikeelem = document.getElementById("addlikebar");
	var addlikewidth = 1;
	var addlikewidthid = setInterval(addlikewidthnow, 16);
	var addlikeid = setInterval(addlikenow, 3);
	var addlike = 0;

	var addlikespeed = 0;

	if(document.getElementById("like").value == 10000)
	{
		addlikespeed = 50;
	}

	if(document.getElementById("like").value == 50000)
	{
		addlikespeed = 100;
	}

	if(document.getElementById("like").value == 75000)
	{
		addlikespeed = 250;
	}

	if(document.getElementById("like").value == 100000)
	{
		addlikespeed = 500;
	}

	function addlikenow() {
		if (addlike >= document.getElementById("like").value) {
			clearInterval(addlikeid);
		} else {
			addlike += addlikespeed;
			document.getElementById("addlikebarlabel").innerHTML = addlike;
		}
	}

	function addlikewidthnow() {
		if (addlikewidth >= 100) {
			clearInterval(addlikewidthid);
		} else {
			addlikewidth++;
			addlikeelem.style.width = addlikewidth + '%';
		}
	}
}