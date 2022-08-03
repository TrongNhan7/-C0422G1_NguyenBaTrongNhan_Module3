public class Test {
    static int[] parent = {1, 4, 5, 2, 1};
    static int[] child = {1, 2, 3};

    public static int solution(int[] parent, int[] child) {
        int count = 0;

        for (int i = 0; i < child.length; i++) {
            for (int j = 0; j < parent.length; j++) {
                if (child[i] == parent[j]){
                    count++;
                    break;
                }
            }
        }
        if (count == child.length){
            return 1;
        }else {
            return 0;
        }
    }

    public static void main(String[] args) {
        System.out.println(solution(parent,child));
    }
}
