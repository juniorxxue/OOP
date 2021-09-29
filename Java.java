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

// $ java .Main A
// A/A


// $ java .Main B
// B/A


// in λi,
// f(A)
// f(A&B)
// A a1 = ....;
// B b1 = ....;

// A a2 = a1 ,, b1
// f(a2)
// actually call f(A)
// (λ(a2: A). e) a1 ,, b1
