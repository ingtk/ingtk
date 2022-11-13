package a05;

import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.next());
        int k = Integer.parseInt(sc.next());
        int ansCnt = 0;
        for (int i = 1; i <= n; i++) {
            for (int j = 1; j <= n; j++) {
                int x = k - (i + j);
                if (0 < x && x <= n) {
                    ansCnt++;
                }
            }
        }
        System.out.println(ansCnt);
        sc.close();
    }
}
