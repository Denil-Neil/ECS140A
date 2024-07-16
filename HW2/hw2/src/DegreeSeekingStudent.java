
public class DegreeSeekingStudent extends Student{
	protected String major;
	protected String academicStanding;
	final public int MAX_CREDITS = 12;

	public DegreeSeekingStudent(String ID, String fname, String lname, 
								int years, int hours, String majorIn, 
								String academicStandingIn) {
		super(ID, fname, lname, years, hours);
		major = majorIn;
		academicStanding = academicStandingIn;

	}
	
	@Override
	public void printData() {
		super.printBasicData();
		System.out.println(first_name + " is a degree-seeking student enrolled in " + creditHours + " credits");
		System.out.println(first_name + "'s major is " + major);
		System.out.println(first_name + "'s academic standing is " + academicStanding);
		System.out.println("");
	}
	
	@Override
	public double computeFees() {
		if (creditHours <= 12) {
		return (100 + 50 + (275 * creditHours));
		}
		else {
			return (3450);
		}
	}
}
