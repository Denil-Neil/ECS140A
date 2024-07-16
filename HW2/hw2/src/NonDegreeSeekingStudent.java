
public class NonDegreeSeekingStudent extends Student {

    public NonDegreeSeekingStudent(String ID, String fname, String lname, int years, int hours) {
        super(ID, fname, lname, years, hours);
    }

    @Override
    public void printData() {
        super.printBasicData();
        System.out.println(first_name + " is a non-degree-seeking student enrolled in " + creditHours + " credits");
    }
    
    @Override
    public double computeFees() {
        return 0.0; // Default implementation
    }
}
