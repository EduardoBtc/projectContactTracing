trigger AccountTrigger on Account (after update, after insert) {
    
    switch on Trigger.operationType {
        When AFTER_UPDATE{
            
        }
        When AFTER_INSERT{
            
        }
    }
    
}