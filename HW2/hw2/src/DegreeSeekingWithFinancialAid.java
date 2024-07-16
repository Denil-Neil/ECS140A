
public class DegreeSeekingWithFinancialAid extends DegreeSeekingStudent{
	
	protected double financialAidAmount;
	
	
	public DegreeSeekingWithFinancialAid(String ID, String fname, String lname, 
										int years, int hours, String majorIn, 
										String academicStandingIn, double aidAmount) {
		super(ID, fname, lname, years, hours, majorIn, academicStandingIn);
		financialAidAmount = aidAmount;
	}
	
	@Override
	public void printData() {
		super.printBasicData();
		System.out.println(first_name + " is a degree-seeking student enrolled in " + creditHours + " credits");
		System.out.println(first_name + "'s major is " + major);
		System.out.println(first_name + "'s academic standing is " + academicStanding);
		System.out.println(first_name + " receives $" + financialAidAmount + " in financial assistance per term");
		System.out.println("");
	}
	
	@Override
	public double computeFees() {
		if (creditHours <= 12) {
			int temp = (100 + 50 + (275 * creditHours));
			if ((temp - financialAidAmount) <= 0) {
				return 0.0;
			}
			else {
				return (temp - financialAidAmount);
			}
		}
		else {
			if ((3450 - financialAidAmount) <= 0) {
				return 0.0;
			}
			else {
				return (3450 - financialAidAmount);
			}
		}
	}
}