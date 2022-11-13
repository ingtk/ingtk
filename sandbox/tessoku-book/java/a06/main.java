package a06;

import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.next());
        int q = Integer.parseInt(sc.next());
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = Integer.parseInt(sc.next());
        }
        int[] a2 = new int[n];
        a2[0] = a[0];
        for (int i = 1; i < n; i++) {
            a2[i] = a2[i - 1] + a[i];
        }

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < q; i++) {
            int l = Integer.parseInt(sc.next());
            int r = Integer.parseInt(sc.next());
            int lv = (l == 1) ? 0 : a2[l - 2];
            int rv = a2[r - 1];
            int v = rv - lv;
            sb.append(v).append("\n");
        }
        System.out.println(sb.toString());
        sc.close();
    }
}
