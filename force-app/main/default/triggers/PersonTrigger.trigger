trigger PersonTrigger on Person__c (after insert, after update, after delete, after undelete, before insert, before update, before delete) {

    switch on Trigger.operationType {
        when AFTER_INSERT {
            
        }
        when AFTER_UPDATE {
            PersonTriggerHandler.onAfterUpdate(Trigger.new, Trigger.oldMap);
        }
        when AFTER_DELETE {

        }
        When AFTER_UNDELETE {

        }
        When BEFORE_INSERT {
            PersonTriggerHandler.onBeforeInsert(Trigger.new);
        }
        When BEFORE_UPDATE {
            PersonTriggerHandler.onBeforeUpdate(Trigger.new, Trigger.oldMap);
        }
        When BEFORE_DELETE {

        }
    }
}