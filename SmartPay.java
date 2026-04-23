import java.util.Scanner;

interface Billable{
    double calculateTotal(int consumedUnits);
}

public class SmartPay implements Billable{

    @Override
    public double calculateTotal(int consumedUnits){
        double total=0;
        int remaining=consumedUnits;
        if(remaining>0){
            int units=Math.min(remaining,100);
            total+=units*1;
            remaining-=units;
        }
        if(remaining > 0){
            int units=Math.min(remaining,200);
            total+=units*2;
            remaining-=units;
        }
        if(remaining>0){
            total+=remaining*5;
        }
        return total;
    }
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        SmartPay S=new SmartPay();

        while(true){
            System.out.print("Enter Customer Name or Exit: ");
            String customerName = sc.nextLine();
            if(customerName.equalsIgnoreCase("Exit")){
                System.out.println("Program Ended");
                break;
            }
            System.out.print("Previous Reading: ");
            int previous=sc.nextInt();

            System.out.print("Current Reading: ");
            int current=sc.nextInt();

            if(previous>current){
                System.out.println("Invalid Input");
                continue;
            }
            int consumedUnits = current-previous;
            double totalAmount=S.calculateTotal(consumedUnits);
            double taxAmount=totalAmount*0.10;
            System.out.println("=====DIGITAL RECEIPT=====");
            System.out.println("Customer Name: "+customerName);
            System.out.println("Units Consumed: "+consumedUnits);
            System.out.println("Total Amount: "+totalAmount);
            System.out.println("Tax Amount: "+taxAmount);
            System.out.println("Final Amount: "+(totalAmount+taxAmount));
            System.out.println("=========================");
            sc.close();
            
        
        }
    }
}