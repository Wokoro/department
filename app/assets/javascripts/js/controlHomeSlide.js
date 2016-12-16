			var image=['/slideImgs/car.png', '/slideImgs/note1.jpg', '/slideImgs/project1.jpeg', '/slideImgs/note2.jpeg', '/slideImgs/project2.jpg','/slideImgs/index.gif'];
			var arrayIndex = 0;
			var timmer;
			$(document).on('turbolinks:load', function(){
				controlSliding();
			});

			//Do slide in
			function slide(arg){
				$(arg).animate({right:'0%'},'slow');
				$(arg).delay(12000).animate({right:'-100%'});
			}

			function controlSliding(){
				if(arrayIndex>=image.length){
					arrayIndex=0;
				}
				timmer=setTimeout('controlSliding();', 13000);
				document.getElementById("slidingImage").src = image[arrayIndex];
				//document.getElementById("slidingImage").title = ""+index;
				slide("#slidingImage");
			//document.getElementById("slide").style.left = -100;
			arrayIndex++;
			}

			$("#slidingImage").hover(function(){
				clearTimeout(timmer);
				$("#slidingImage").stop(true, true);
			}, 
			function(){
				arrayIndex--;
				controlSliding();
			});