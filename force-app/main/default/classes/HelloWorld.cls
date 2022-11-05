public class HelloWorld {
    /*
    private String greeting = 'Hello World';
    public String publicGreeting = 'Hello World';
    
    private String goodMorning = 'Good Morning';
    private String goodAfternoon  = 'Good Afternoon';
    private String goodNight = 'Good Night';
    
    public void printGreeting() {
        System.debug(greeting);
    }
    
    public void printgoodMorning() {
        System.debug(goodMorning);
    }
    
    public void printgoodAfternoon() {
        System.debug(goodAfternoon);
    }
    
    public void printgoodNight() {
        System.debug(goodNight);
    }*/
    
    public void setMessege(String msg) {
        System.debug(msg);
    }
    
    public void setDayOfNumber(Integer num){
        if(num == 1 ){
            System.debug('Monday');
        }else if (num == 2) {
            System.debug('Tuesday');
        }else if(num == 3) {
            System.debug('Wednesday');
        }else if (num == 4) {
            System.debug('Thursday');
        }else if (num == 5){
            System.debug('Friday');
        }else {
            System.debug('Number don´t corresponde of days');
        }
    }
    
    public String getDay(Integer dayNumber){
        String dayString = '';
        
        switch on dayNumber {
            when 0 {
                dayString = 'sunday';
                
            }
            when 1 {
                dayString = 'Monday';
                
            }
            when 2 {
                dayString = 'Tuesday';
                
            }
            when 3 {
                dayString = 'Wednesday';
                
            }
            when 4 {
                dayString = 'Thursday';
                
            }
            when 5 {
                dayString = 'Friday';
                
            }
            when 6 {
               dayString = 'Saturday';
                
            }
            when else {
                dayString = 'Number Invalid';
            }
        }
        
        return dayString;
    }
    
    public String getDay(String abbrevieteNumber){
        String dayString = '';
        
        switch on abbrevieteNumber{
            when 'sun' {
                dayString = 'sunday';
                
            }
            when 'mon' {
                dayString = 'Monday';
                
            }
            when 'tue' {
                dayString = 'Tuesday';
                
            }
            when 'wed' {
                dayString = 'Wednesday';
                
            }
            when 'thu' {
                dayString = 'Thursday';
                
            }
            when 'fri' {
                dayString = 'Friday';
                
            }
            when 'sat' {
               dayString = 'Saturday';
                
            }
            when else {
                dayString = 'abbreviate Invalid';
            }
        }
        
        return dayString;
    }



}