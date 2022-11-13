package a02;

import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.next());
        int x = Integer.parseInt(sc.next());
        for (int i = 0; i < n; i++) {
            int a = Integer.parseInt(sc.next());
            if (a == x) {
                System.out.println("Yes");
                sc.close();
                return;
            }
        }
        System.out.println("No");
        sc.close();
    }
}
