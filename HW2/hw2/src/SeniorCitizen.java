
public class SeniorCitizen extends NonDegreeSeekingStudent{
	
	
	public SeniorCitizen(String ID, String fname, String lname, int years, int hours) {
        super(ID, fname, lname, years, hours);
    }
	
	@Override
	public void printData() {
		super.printData();
		System.out.println(first_name + " is a senior citizen");
		System.out.println("");
	}
	
	@Override
	public double computeFees() {
		if (creditHours <= 6) {
			return 100;
		}
		else {
			return (100 + ((creditHours - 6) * 50));
		}
	}
	

}
