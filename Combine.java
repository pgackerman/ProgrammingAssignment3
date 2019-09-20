public class Combine
{
    public static void main(java.lang.String[] args) throws java.lang.Exception
    {
        java.lang.String[] states = new java.lang.String[] { "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY", "GU" };
        java.lang.String[] outcomes = new java.lang.String[] { "heart attack", "heart failure", "pneumonia" };

        for (java.lang.String state : states)
        {
            for (java.lang.String outcome : outcomes)
            {
                System.out.print("best(\"");
                System.out.print(state);
                System.out.print("\", \"");
                System.out.print(outcome);
                System.out.print("\")");
                System.out.println();
            }
        }
    }
}
