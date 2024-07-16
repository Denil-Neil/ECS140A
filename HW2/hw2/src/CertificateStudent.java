
public class CertificateStudent extends NonDegreeSeekingStudent {
    private String certificateType;

    public CertificateStudent(String ID, String fname, String lname, int years, int hours, String type) {
        super(ID, fname, lname, years, hours);
        certificateType = type;
    }

    @Override
    public void printData() {
        super.printData();
        System.out.println(first_name + " is a certificate student with a " + certificateType + " vocation");
        System.out.println("");
    }

    @Override
    public double computeFees() {
        return 700 + 300 * creditHours;
    }
}
