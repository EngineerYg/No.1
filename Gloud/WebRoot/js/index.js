$(function(){

	function slide(){
		var aBtn=document.getElementById('j_slide_btn').children;
		var oUl=document.getElementById('j_slide');
		var aLi	=oUl.children;
		var timer = null;
		var now=0;
		var aniTime=3000;
		if(aLi.length<=1){
			$('.j_slide_pre').hide();
			$('.j_slide_next').hide();
			return;
		}
		setStyle3(oUl,'transition','all 1s ease');
		oUl.innerHTML+=oUl.innerHTML;

		oUl.style.width=aLi[0].offsetWidth*aLi.length+'px';

		var w=oUl.offsetWidth/2;

		for(var i=0;i<aBtn.length;i++)
		{
			(function (index){
				aBtn[i].onclick=function ()
				{
					//now=index;
				
					tab(index);
				};
			})(i);
		}
		// //上一个、下一个
		$('.j_slide_pre').on('click',function(){
			now--;

		    tab(now);
		})
		$('.j_slide_next').on('click',function(){
			now++;

			tab(now);
		})

		function tab(index)
		{
			
			if(index!=undefined){
				now=index;
			}
			else{
				now ++ ;
			}
			if(now == -1){
				now = 0;
			}
			console.log(now);
			oUl.style.left=-aLi[0].offsetWidth*now+'px';
			setTimeout(function(){
				if(now==0){

					setStyle3(oUl,'transition',null);
					oUl.style.left=-aLi[0].offsetWidth*now+'px';
					setTimeout(function(){
						setStyle3(oUl,'transition','all 1s ease');
					},30);
					
				}
				

			},1000)
			if(now==aBtn.length)now=0;
			for(var i=0;i<aBtn.length;i++)
			{
				aBtn[i].className='';
			}
			if(now>0)
			{
				aBtn[now%aBtn.length].className='on';
			}
			else
			{
				aBtn[(now%aBtn.length+aBtn.length)%aBtn.length].className='on';
			}
			
		}
		
		oUl.addEventListener("webkitAnimationend", function(){
			console.log('end:'+now);
		},false); //动画结束时事件 
		var left=0;

			 //自动播放
		
		timer=setInterval(tab,aniTime);   
		 
		
		   //移入停止
		   oUl.parentNode.onmouseover=function()
		   {
				clearInterval(timer);  
		   }; 
		   // 移出定时器接着开始
		   oUl.parentNode.onmouseout=function()
		   {
			timer=setInterval(tab,aniTime); 
		   };

	  
		
	}

	function gameList(){
		var aList = $('#j_game_list').children();
		aList.each(function(){
			$(this).on('mouseover',function(){
				$(this).find('.pics_cover').show();
			})
			$(this).on('mouseout',function(){
				$(this).find('.pics_cover').hide();
			})
		
		})
	}

	function gameImg(){
		var aList = $('#j_game_Img').children();
		aList.each(function(){
			$(this).on('mouseover',function(){
				console.log(111);
				$(this).find('p').show();
			})
			$(this).on('mouseout',function(){
				$(this).find('p').hide();
			})
		
		})
	}


	
	setTimeout(function(){
		slide();
		gameList();
		gameImg();
	},300)
})