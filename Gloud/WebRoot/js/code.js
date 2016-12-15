function changeCode(){

	    var $captcha_img = $('#yzm').find('img');
	    var verifyimg = $captcha_img.attr("src");
	    
			var ram=Math.ceil(Math.random()*10+1);
			verifyimg="code/code"+ram.toString()+".png";
			  $captcha_img.attr("src",verifyimg);
			//alert(123);
	}

	function getverifycode(){
		var $img =$('#yzm').find('img');
		var $src =$img.attr("src");
		var sr =$src.substring(9,11);
		//alert(sr);
		var yZm ="";
		switch (sr){
			case "1.":
				yZm ="3541";
				break;
			case "2.":
				yZm ="6068";
				break;
			case "3.":
				yZm ="3782";
				break;
			case "4.":
				yZm ="7189";
				break;
			case "5.":
				yZm ="5206";
				break;
			case "6.":
				yZm ="7695";
				break;
			case "7.":
				yZm ="0890";
				break;
			case "8.":
				yZm ="8675";
				break;
			case "9.":
				yZm ="9605";
				break;
			case "10":
				yZm ="9094";
				break;
			case "11":
				yZm ="0662";
				break;
			default:
				yZm ="12";
				break;
		}
		//alert(yZm);
			return yZm;
	}