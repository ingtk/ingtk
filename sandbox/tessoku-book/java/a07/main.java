package a07;

import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int d = Integer.parseInt(sc.next());
        int n = Integer.parseInt(sc.next());
        int[] a = new int[d];
        for (int i = 0; i < n; i++) {
            int l = Integer.parseInt(sc.next()) - 1;
            int r = Integer.parseInt(sc.next()) - 1;
            for (int j = l; j <= r; j ++) {
                a[j] ++;
            }
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < d; i++) {
            sb.append(a[i]).append("\n");
        }
        System.out.println(sb.toString());
        sc.close();
    }
}
