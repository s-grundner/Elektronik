# Aufgabe - Fifo

Darstellung des Producer-Consumer-Problems, Arbeiten mit Threads in Java, Synchronisierung von Threads.

Für eine ProducerConsumer-Anwendung wird ein Fifo-Buffer benötig. Der Producer schreibt Zahlen in den Buffer, der Consumer entnimmt sie (mehr oder weniger) gleichzeitig die Daten.

Im ersten Schritt wird ein Fifo-Buffer entwickelt der, wenn der Buffer nicht groß genug ist oder der Producer nicht schnell genug Daten einlegt eine Exception auslöst.



> Vervollständigen Sie Fifo.java damit FifoTest.main() und ProdConsDemo.main() funktioniert.



Um den Buffer zu Testen dient dieses Testprogramm **FifoTest.java**:

```java
public class FifoTest {
    public static void main(String[] args) {
        if (!testEmpty()) {
            System.out.println("ERROR: testEmpty");
            return;
        }
        if (!testFull()) {
            System.out.println("ERROR: testFull");
            return;
        }
        if (!testEnqueueAndEmpty()) {
            System.out.println("ERROR: testEnqueueAndEmpty");
            return;
        }
        if (!testEnqueueDequeueAndEmpty()) {
            System.out.println("ERROR: testEnqueueDequeueAndEmpty");
            return;
        }
        if (!testFullException()) {
            System.out.println("ERROR: testFullException");
            return;
        }
        if (!testEmptyException()) {
            System.out.println("ERROR: testEmptyException");
            return;
        }
        System.out.println("======== ALL TESTS PASSED =======");
    }

    public static boolean testEmpty() {
        Fifo f1 = new Fifo(5); // 5 Elemente haben Platz
        if (f1.isEmpty())
            return true;
        else
            return false;
    }

    public static boolean testFull() {
        try {
            Fifo f1 = new Fifo(5); // 5 Elemente haben Platz
            f1.enqueue(1);
            f1.enqueue(2);
            f1.enqueue(3);
            f1.enqueue(4);
            f1.enqueue(5);

            if (f1.isFull())
                return true;
            else
                return false;

        } catch (FullException e) {
            return false;
        }
    }

    public static boolean testEnqueueAndEmpty() {
        try {
            Fifo f1 = new Fifo(5); // 5 Elemente haben Platz
            f1.enqueue(1);

            if (f1.isEmpty())
                return false;
            else
                return true;

        } catch (Exception f) {
            return false;
        }
    }

    public static boolean testEnqueueDequeueAndEmpty() {
        try {
            Fifo f1 = new Fifo(5); // 5 Elemente haben Platz
            f1.enqueue(1);
            int val = f1.dequeue();
            if (val != 1)
                return false;

            if (f1.isEmpty())
                return true;
            else
                return false;

        } catch (Exception f) {
            return false;
        }
    }

    public static boolean testFullException() {
        try {
            Fifo f1 = new Fifo(5); // 5 Elemente haben Platz
            f1.enqueue(1);
            f1.enqueue(2);
            f1.enqueue(3);
            f1.enqueue(4);
            f1.enqueue(5);
            f1.enqueue(6);

            return false;
        } catch (FullException f) {
            return true;
        }
    }

    public static boolean testEmptyException() {

        try {
            Fifo f1 = new Fifo(5); // 5 Elemente haben Platz
            int ret = f1.dequeue();

            return false;

        } catch (EmptyException f) {
            return true;
        }
    }
}
```

Der Buffer löst Exceptions aus, sobald der Buffer überläuft **FullException.java**:

```java
public class FullException extends Exception {
    public FullException(){
        super("Queue Full Exception");
    }
    public FullException(String msg){
        super(msg);
    }
}
```

 und analog dazu eine **EmptyException** wenn der Producer nicht schnell genug in den Buffer schreibt.

Für den Fifo ist das folgende Gerüst in **Fifo.java** gegeben:

```java
public class Fifo {
    private int[] mQueue;
    private int mSize, mRead, mWrite;   // mBegin of mQueue and mEnd of mQueue

    Fifo(int size) {// to store size elements
		//...
    }

    public int dequeue()  throws EmptyException {
		//...
    }

    public boolean isEmpty() {
		//...
    }

    public boolean isFull()  {
		//...
    }

    public void enqueue(int item) throws FullException {
		//...
    }
}
```

der Buffer ist mittels Ringbuffer zu implementieren:

![OS_FiFo](.\img\OS_FiFo.png)

## Producer-Consumer

Der entwickelte Buffer wird in Producer-Consumer-Anwendung verwendet:

```java
public class ProdConsDemo {
    public static void main(String[] args) {

        Fifo myFifo = new Fifo(499);

        Thread producer = new Producer(myFifo); // erstellt 500 Elemente
        Thread consumer = new Consumer(myFifo); // nimmt 500 Elemente

        producer.start();
        consumer.start();

        try {
            producer.join();
            consumer.join();
        } catch (Exception e) {}
    }
}
```

Es werden ein Producer und ein Consumer in unabhängigen Threads gestartet.

**Producer.java** schreibt 500 Werte in den Buffer:

```java
class Producer extends Thread{
    Fifo mFifo;
    public Producer(Fifo fifo){
        this.mFifo=fifo;
    }
    @Override public void run(){
        try {
            produce();
        } catch (FullException e) {
            e.printStackTrace();    // not in use at the end!
        }
    }
    public void produce() throws FullException {// exception not in use
        for (int i=1; i <=500; i++){
            System.out.println("[PRODUCER:] enqueue " + i);
            mFifo.enqueue(i);
        }
    }
}
```

**Consumer.java** liest 500 Werte aus dem Buffer:

```java
class Consumer extends Thread{
    Fifo mFifo;
    public Consumer(Fifo fifo){
        this.mFifo=fifo;
    }
    @Override public void run(){
        try {
            consume();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
    }
    public void consume() throws EmptyException {
        for (int i=1; i <=500; i++) {
            try {
                sleep(50);
            } catch(InterruptedException e) {}
            System.out.println("\t\t\t\t[CONSUMER:] dequeue " + mFifo.dequeue());
        }
    }
}
```

Die Anwendung klappt, wenn der Buffer groß genug ist, ansonsten läuft er schnell über. Hier wurde *sleep()* in *consume()* variert um mit einem zu kleinen Buffer auskommen zu können.
