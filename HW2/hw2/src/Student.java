
public class Student {
	protected String studentID;
	protected String first_name;
	protected String last_name;
	protected int age;
	protected int creditHours;
	
	public Student(String ID, String fname, String lname, int years, int hours) {
		studentID = ID;
		first_name = fname;
		last_name = lname;
		age = years;
		creditHours = hours;
	}
	
	public void printBasicData() {
		System.out.println("ID Number: " + studentID);
		System.out.println("Name: " + first_name + " " + last_name);
		System.out.println("Age: " + age);
		System.out.println("");
	}
	
	public void printData() {
		printBasicData();
		System.out.println(first_name + " is enrolled in " + creditHours + " credits");
	}
	
	public double computeFees() {
		return 0.0;
	}
}
