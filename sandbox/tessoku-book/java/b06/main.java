package b06;

import java.util.*;

class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = Integer.parseInt(sc.next());
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            a[i] = Integer.parseInt(sc.next());
        }
        int[] win = new int[n];
        int[] lose = new int[n];
        if (a[0] == 1) {
            win[0] = 1;
        } else {
            lose[0] = 1;
        }
        for (int i = 1; i < n; i++) {
            if (a[i] == 1) {
                win[i] = win[i - 1] + 1;
                lose[i] = lose[i - 1];
            } else {
                win[i] = win[i - 1];
                lose[i] = lose[i - 1] + 1;
            }
        }

        int q = Integer.parseInt(sc.next());

        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < q; i++) {
            int l = Integer.parseInt(sc.next());
            int r = Integer.parseInt(sc.next());
            int lwin = (l == 1) ? 0 : win[l - 2];
            int llose = (l == 1) ? 0 : lose[l - 2];
            int winCnt = win[r - 1] - lwin;
            int loseCnt = lose[r - 1] - llose;
            String result = "draw";
            if (winCnt > loseCnt) {
                result = "win";
            } else if (winCnt < loseCnt) {
                result = "lose";
            }
            sb.append(result).append("\n");
        }
        System.out.println(sb.toString());
        sc.close();
    }
}
