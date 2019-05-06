public class DistanceCalculator {
    public  Double distance(Decimal lat1, Decimal lon1, Decimal lat2, Decimal lon2,String unit ){
        if ((lat1==lat2 )&&(lon1==lon2)){
            return 0;
        }
        else{
            Location loc1= Location.newInstance(lat1, lon1);
            Location loc2=Location.newInstance(lat2, lon2);
            Double dist=Location.getDistance(loc1, loc2, unit);
            return dist;
        }
    }

}