// -------------------------------
// Single Dispatch
// -------------------------------

public class A {
  public void foo(A a) { System.out.println("A/A"); }
  public void foo(B b) { System.out.println("A/B"); }
}
public class B extends A {
  public void foo(A a) { System.out.println("B/A"); }
  public void foo(B b) { System.out.println("B/B"); }
}

public class Main {
  public static void main(String[] argv) {
    A obj = argv[0].equals("A") ? new A() : new B();
    obj.foo(obj);
  }
}

// $ java com.gigamonkeys.Main A
// A/A


// $ java com.gigamonkeys.Main B
// B/A
