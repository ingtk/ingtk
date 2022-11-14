package b07;

import java.util.*;

class Main {
    public static void main(String[] args) throws Exception {
        Scanner sc = new Scanner(System.in);
        int t = Integer.parseInt(sc.next());
        int n = Integer.parseInt(sc.next());
        int[] a = new int[t + 1];
        for (int i = 0; i < n; i++) {
            int l = Integer.parseInt(sc.next());
            int r = Integer.parseInt(sc.next());
            a[l]++;
            a[r]--;
        }
        StringBuilder sb = new StringBuilder();
        int p = 0;
        for (int i = 0; i < t; i++) {
            p += a[i];
            sb.append(p).append("\n");
        }
        System.out.println(sb.toString());
        sc.close();
    }
}

// class Scanner {
//     BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//     StringTokenizer st = new StringTokenizer("");
//     StringBuilder sb = new StringBuilder();

//     public Scanner() throws Exception {

//     }

//     public String next() throws Exception {
//         while (!st.hasMoreTokens()) {
//             st = new StringTokenizer(br.readLine());
//         }
//         return st.nextToken();
//     }

// }
