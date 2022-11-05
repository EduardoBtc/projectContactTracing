@isTest
public class FitneesTest {
    
    @isTest
    static void calculateBMITes1() {
    
        Test.startTest();
        Decimal resultado = Fitnees.calculateBMI(100, 1.70);
        Test.stopTest();
            
        System.assertEquals(34.60, resultado);
    }
    
    @isTest
    static void calculateBMITest2() {
        
        Test.startTest();
        Decimal result = Fitnees.calculateBMI(-1, 1.70);
        Test.stopTest();
        
        System.assertEquals(-1, result);
    }
    
    @isTest
    static void calculateBMITest3() {
        
        Test.startTest();
        Decimal result = Fitnees.calculateBMI(100, -1.70);
        Test.stopTest();
        
        System.assertEquals(-1, result);
    }
    
    @isTest
    static void calculateBMITest4() {
        
        Test.startTest();
        Decimal result = Fitnees.calculateBMI(0, 1.70);
        Test.stopTest();
        
        System.assertEquals(0, result);
    }
    
    @isTest
    static void calculateBMITest5() {
        
        Test.startTest();
        Decimal result = Fitnees.calculateBMI(100, 0);
        Test.stopTest();
        
        System.assertEquals(-1, result);
    }

    
    @isTest
    static void calculatePaceTest1() {
        
        Test.startTest();
        Decimal result = Fitnees.calculatePace(10, 40);
        Test.stopTest();
        
        System.assertEquals(15.0, result);
    }
    
    @isTest
    static void calculatePaceTest2() {
        
        Test.startTest();
        Decimal result = Fitnees.calculatePace(-10, 40);
        Test.stopTest();
        
        System.assertEquals(-1, result);
    }
    
    @isTest
    static void calculatePaceTest3() {
        
        Test.startTest();
        Decimal result = Fitnees.calculatePace(10, -40);
        Test.stopTest();
        
        System.assertEquals(-1, result);
    }
    
    @isTest
    static void calculatePaceTest4() {
        
        Test.startTest();
        Decimal result = Fitnees.calculatePace(0, 40);
        Test.stopTest();
        
        System.assertEquals(0, result);
    }
    
    @isTest
    static void calculatePaceTest5() {
        
        Test.startTest();
        Decimal result = Fitnees.calculatePace(111, 0);
        Test.stopTest();
        
        System.assertEquals(-1, result);
    }
    
    
    
    

}