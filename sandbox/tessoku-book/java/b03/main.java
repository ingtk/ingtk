package b03;

import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.next());
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = Integer.parseInt(sc.next());
        }
        for (int i = 0; i < n - 2; i++) {
            for (int j = i + 1; j < n - 1; j++) {
                for (int k = j + 1; k < n; k++) {
                    int v = a[i] + a[j] + a[k];
                    if (v == 1000) {
                        System.out.println("Yes");
                        sc.close();
                        return;
                    }
                }
            }
        }
        System.out.println("No");
        sc.close();
    }
}
