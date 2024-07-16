
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Report {

    // generateReport() should be a public static method that takes no parameters and returns a String
    public static String generateReport() {
        StringBuilder reportBuilder = new StringBuilder();
        ArrayList<Student> studentList = new ArrayList<>();

        try (BufferedReader br = new BufferedReader(new FileReader("hw2.txt"))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split(";");
                
                String studentID = data[0];
                String firstName = data[1];
                String lastName = data[2];
                int age = Integer.parseInt(data[3]);
                int creditHours = Integer.parseInt(data[4]);
                
                if (data[5].equals("Y")) {
                	String major;
                	switch (data[6]) {
                    case "S":
                        major = "gaming Science";
                        break;
                    case "M":
                        major = "hotel Management";
                        break;
                    case "A":
                        major = "lounge Arts";
                        break;
                    case "E":
                        major = "beverage Engineering";
                        break;
                    default:
                        major = "Unknown";
                        break;
                }
                	String academicStanding;
                	switch (data[7]) {
                    case "G":
                        academicStanding = "Good";
                        break;
                    case "W":
                    	academicStanding = "Warning";
                        break;
                    case "P":
                    	academicStanding = "Probation";
                        break;
                    default:
                        academicStanding = "Unknown";
                        break;
                }
                    if (data[8].equals("Y")) {
                        double financialAid = Double.parseDouble(data[9]);
                        studentList.add(new DegreeSeekingWithFinancialAid(studentID, firstName, 
                                                                             lastName, age, creditHours,
                                                                             major, academicStanding, financialAid));
                    } else {
                        studentList.add(new DegreeSeekingStudent(studentID, firstName, 
                                                                 lastName, age, creditHours,
                                                                 major, academicStanding));
                    }
                } else if (data[5].equals("N")) {
                    if (data[6].equals("C")) {
                        String certificateType = "";
                        switch (data[7]) {
                            case "S":
                                certificateType = "gaming Science";
                                break;
                            case "M":
                                certificateType = "hotel Management";
                                break;
                            case "A":
                                certificateType = "lounge Arts";
                                break;
                            case "E":
                                certificateType = "beverage Engineering";
                                break;
                            default:
                                certificateType = "Unknown";
                                break;
                        }
                        studentList.add(new CertificateStudent(studentID, firstName, lastName,
                                                               age, creditHours, certificateType));
                    } else if (data[6].equals("S")) {
                        studentList.add(new SeniorCitizen(studentID, firstName, lastName,
                                                          age, creditHours));
                    }
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        Student[] students = studentList.toArray(new Student[0]); // save all the student record objects here

        // DO NOT ADD, CHANGE, OR DELETE ANY reportBuilder code. Use the provided variables.
        // INDIVIDUAL REPORTS, listing of all students and the fees they have each been assessed
        reportBuilder.append("Summary of each student's fees assessed: \n\n");
        
    	students[0].printData();
		students[1].printData();

        int degreeNoFinFees = 0;
        int degreeFinFees = 0;
        int certificateFees = 0;
        int seniorFees = 0;
        int totalFees = 0;

        for (Student student : students) {
            String student_name = student.first_name + " " + student.last_name;
            int student_fee = (int) student.computeFees();
            reportBuilder.append(student_name + " has $" + String.format("%,d", student_fee) + " fees assessed \n");

            // Calculate the summary fees
            if (student instanceof DegreeSeekingWithFinancialAid) {
                degreeFinFees += student_fee;
            } else if (student instanceof DegreeSeekingStudent) {
                degreeNoFinFees += student_fee;
            } else if (student instanceof CertificateStudent) {
                certificateFees += student_fee;
            } else if (student instanceof SeniorCitizen) {
                seniorFees += student_fee;
            }
            totalFees += student_fee;
//            student.printData();
        }

        // Print out the total fees for different students
        reportBuilder.append("\n\n");
        reportBuilder.append("Summary of all student fees assessed: \n\n");
        reportBuilder.append("Degree-seeking students without financial assistance: $" + String.format("%,d", degreeNoFinFees) + "\n");
        reportBuilder.append("Degree-seeking students with financial assistance: $" + String.format("%,d", degreeFinFees) + "\n");
        reportBuilder.append("Certificate students: $" + String.format("%,d", certificateFees) + "\n");
        reportBuilder.append("Senior citizens: $" + String.format("%,d", seniorFees) + "\n\n");
        reportBuilder.append("Total fees assessed: $" + String.format("%,d", totalFees));

        return reportBuilder.toString();
    }

    public static void main(String[] args) {
        // You may test your Report here by comparing the output with the provided hw2_output.txt
        System.out.println(generateReport());
        
    }
}
