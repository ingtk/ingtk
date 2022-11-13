package b04;

import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String n = sc.next();
        int ans = 0;
        int nl = n.length();
        for (int i = 0; i < nl; i++) {
            if (n.charAt(nl - i - 1) == '1') {
                ans += (int) Math.pow(2, i);
            }
        }
        System.out.println(ans);
        sc.close();
    }
}
