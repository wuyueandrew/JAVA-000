public class Hello {

    public Integer sum(int[] array) {
        if (array == null) {
            return null;
        }
        int sum = 0;
        for (int i = 0; i < array.length; i++) {
            sum += array[i];
        }
        return sum;
    }

    public static void main(String[] args) {
        int[] array = new int[]{1, 2, 3, 4};
        Hello hello = new Hello();
        System.out.println(hello.sum(array));
    }

}
