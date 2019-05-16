public class CountNumberOfSegments {
    public static Double CountSegments(string value){
        Double count=0;
        try{
            if (value==null){
                return null;
            }
            else{
                Pattern numberFormat= Pattern.compile('[0-9]*');
                Matcher numberMatch = numberFormat.matcher(value);
                Boolean status=numberMatch.matches();
                if (status==false){
                   System.debug('Enter only numeric values');
                }
                else{
        			String[] stringCharacters= value.split('');
        			System.debug(stringCharacters);
        			for(String s:stringCharacters){
                        switch on s{
                            when '0'{
                                count += 6;
                            }
                            when '1'{
                                count += 2;
                            }
                            when '2'{
                                count += 5;
                            }
                            when '3'{
                                count += 5;
                            }
                            when '4'{
                                count += 4;
                            }
                            when '5'{
                                count += 5;
                            }
                            when '6'{
                                count += 6;
                            }
                            when '7'{
                                count += 3;
                            }
                            when '8'{
                                count += 7;
                            }
                            when '9'{
                                count += 6;
                            }
                        }
        			} 
            	}
        	}
            
        }
        Catch(NullPointerException ex)
        {
            System.debug('Please give input');
        }
       return count;
    }

}