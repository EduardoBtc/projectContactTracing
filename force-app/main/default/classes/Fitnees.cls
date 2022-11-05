public class Fitnees {
    
    
    public static Decimal calculateBMI(Decimal peso, Decimal altura) {
        if (peso < 0 || altura <= 0)
            return -1;
        Decimal calc = peso/(altura*altura); 
        return calc.setScale(2);  
    }
    
    public static Decimal calculatePace(Decimal distancia, Decimal tempo) {
        if (distancia < 0 || tempo <= 0)
            return -1;
        Decimal calc = distancia/(tempo/60);
        return calc.setScale(2);
    }
}