package b02;

import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int a = Integer.parseInt(sc.next());
        int b = Integer.parseInt(sc.next());
        String ans = "No";
        for (int i = a; i <= b; i++) {
            if (100 % i == 0) {
                ans = "Yes";
                break;
            }
        }
        System.out.println(ans);
        sc.close();
    }
}
