    $(document).ready(function(){
        //totalNumberOfUnits($(".first_semester"));
    });
    
    function totalNumberOfUnits(courses, extraUnits){
        totalUnits = 0;
        for (var i = 0; i < courses.length; i++) {
            if (courses[i].checked) {
                totalUnits += parseInt(courses[i].getAttribute("data-unit"));
            }
        }

        return totalUnits;   
    }

     function totalCourseRegistered(courses){
        num = 0;
        for (var i = 0; i < courses.length; i++) {
            if(courses[i].checked){
                num+=1;
            }
        }

        return num;
    }

    function displayTotalUnits(courses, sem){
        if(sem == 1){
            document.getElementById("first-semester-units").innerHTML = totalNumberOfUnits(courses);
            document.getElementById("fs-total-units").innerHTML = totalNumberOfUnits(courses);
            document.getElementById("fs-total-courses").innerHTML = totalCourseRegistered(courses);
        }
        else{
            document.getElementById("second-semester-units").innerHTML = totalNumberOfUnits(courses);
            document.getElementById("ss-total-units").innerHTML = totalNumberOfUnits(courses);
            document.getElementById("ss-total-courses").innerHTML = totalCourseRegistered(courses);
        }
        
        document.getElementById("total-units").innerHTML = totalNumberOfUnits($(".first_semester"))+totalNumberOfUnits($(".second_semester"));
        document.getElementById("total-courses").innerHTML = totalCourseRegistered($(".first_semester"))+totalCourseRegistered($(".second_semester"));
    }

   

    function validateEnrollment(courses, sem, extraUnits){
        totalNumberOfUnits(courses, extraUnits);
        displayTotalUnits(courses, sem);
    }