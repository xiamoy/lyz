function leftTimer(year,month,day,hour,minute,second){   
        var newDate = new Date();  
        var newDate1 = new Date(year,month-1,day,hour,minute,second);  
        var leftTime = (new Date(year,month-1,day,hour,minute,second)) - (new Date()); //计算剩余的毫秒数   
        var days = parseInt(leftTime / 1000 / 60 / 60 / 24 , 10); //计算剩余的天数  
        var hours = parseInt(leftTime / 1000 / 60 / 60 % 24 , 10); //计算剩余的小时   
        var minutes = parseInt(leftTime / 1000 / 60 % 60, 10);//计算剩余的分钟   
        var seconds = parseInt(leftTime / 1000 % 60, 10);//计算剩余的秒数   
        if (seconds<0) {  
            $(".tit_right").css('display', 'none');  
            $("#juli").text("开始抢购");  
        }   
        else{  
            days = fix(days,2);   
            hours = fix(hours,2);   
            minutes = fix(minutes,2);   
            seconds = fix(seconds,2);     
            setTimeout("leftTimer(2018,1,13,20,00,00)",1000);    
            document.getElementById("h").innerHTML=hours;  
            document.getElementById("m").innerHTML=minutes;  
            document.getElementById("s").innerHTML=seconds;  
        }  
    }  
    //fix函数：将1~9的1位数转换成01~09的格式  
    function fix(num, length) {  
        return ('' + num).length < length ? ((new Array(length + 1)).join('0') + num).slice(-length) : '' + num;  
    }  
    $(document).ready(function(){
    	leftTimer(2018,1,13,20,00,00);
    })

