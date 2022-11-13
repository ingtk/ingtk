package a04;

import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.next());
        int m = 10;
        int a[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
        for (int i = 1; i <= m; i++) {
            a[m - i] = n % 2;
            n = n / 2;
            if (n == 0) {
                break;
            }
        }
        for (int i = 0; i < m; i++) {
            System.out.print(a[i]);
        }
        System.out.println();
        sc.close();
    }
}
