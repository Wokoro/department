			var image=['/slideImgs/car.png', '/slideImgs/note1.jpg', '/slideImgs/project1.jpeg', '/slideImgs/note2.jpeg', '/slideImgs/project2.jpg','/slideImgs/index.gif'];
			var arrayIndex = 0;
			var timmer;
			var count = 1;
			$(document).on('turbolinks:load', function(){
				controlSliding();
			});

			function setAttr(elem, attr, val){
				elem.setAttribute(attr, val);
			}

			 function addrow(){
			     count++;
			     var body = document.getElementById("body");
        		
        		var tr = document.createElement("tr");

        		var td = document.createElement("td");
        		td.innerHTML = count;
        		tr.appendChild(td);

        		var td = document.createElement("td");
        		var matno = document.createElement("input");
        			setAttr(matno, "type", "text");
        			setAttr(matno, "class", "matno");
        			setAttr(matno, "name", "matno"+(count));
        		td.appendChild(matno);
        		tr.appendChild(td);

        		var td = document.createElement("td");
        		var name = document.createElement("input");
        			setAttr(name, "type", "text");
        			setAttr(name, "class", "matno");
        			setAttr(name, "name", "name"+(count));
        		td.appendChild(name);
        		tr.appendChild(td);

        		var td = document.createElement("td");
        		var ctitle = document.createElement("input");
        			setAttr(ctitle, "type", "text");
        			setAttr(ctitle, "class", "matno");
        			setAttr(ctitle, "name", "ctitle"+(count));
        		td.appendChild(ctitle);
        		tr.appendChild(td);

        		var td = document.createElement("td");
        		var ccode = document.createElement("input");
        			setAttr(ccode, "type", "text");
        			setAttr(ccode, "class", "matno");
        			setAttr(ccode, "name", "ccode"+(count));
        		td.appendChild(ccode);
        		tr.appendChild(td);

        		var td = document.createElement("td");
        		var grade = document.createElement("input");
        			setAttr(grade, "type", "text");
        			setAttr(grade, "class", "matno");
        			setAttr(grade, "name", "grade"+(count));
        		td.appendChild(grade);
        		tr.appendChild(td);

        		var td = document.createElement("td");
        		var point = document.createElement("input");
        			setAttr(point, "type", "text");
        			setAttr(point, "class", "matno");
        			setAttr(point, "name", "point"+(count));
        		td.appendChild(point);
        		tr.appendChild(td);

        		body.appendChild(tr);
        		
        	}

        function removerow(){
        	var body = document.getElementById("body");
        	var tr = document.getElementById("thed");
        	var body_last = document.getElementById("body").lastChild;
        	
        	if(tr === body_last){
        		alert("TABLE MUST CONTAIN ATLEAST ONE ROW");
        	}else{
        		count--;
            	body.lastChild.remove();
        	}
        }
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