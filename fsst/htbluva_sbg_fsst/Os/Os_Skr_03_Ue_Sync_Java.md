# 3 Os - Synchronisation - Java - Übungen


## Java-Programm (J500)
Ein Objekt Bank modelliert eine reale Bank, die Konten für verschiedene Personen verwaltet. 
Die Bank hat Überweisungen durchzuführen. Die Überweisungen werden in parallelen Threads abgearbeitet. 


### Die Klasse SimpleBank
- In diesem Beispiel wird die Bank durch eine Klasse `SimpleBank` realisiert. 
- Diese Bank besitzt das Array `mKonten`, das die Stände der einzelnen Konten enthält. 
- Der Array-Index soll als Kontonummer dienen. 

- Für Transaktionen zwischen zwei Konten stellt `SimpleBank` die Methode `transfer()` zur Verfügung. 

- Ihr werden die beiden beteiligten Kontonummern sowie der Betrag der Überweisung übergeben. 

- Zu Demonstrationszwecken wird die Ausführung der Überweisung zwischen der Berechnung des neuen Kontostands und dessen Zurückschreiben unterbrochen. Hierzu wird auf die bekannte Methode `sleep()` verwendet.

- Als letztes verfügt `SimpleBank` über die Methode `balance()`, mit der die aktuellen Stände aller Konten angezeigt werden können.


```java
class SimpleBank {
	static int[] mKonten = {30, 50, 100};

	public void transfer(int from, int to, int amount) {
		int newBalance;
	
		newBalance = mKonten[von];
		newBalance -= amount;
		// Inkonsistenz, da neuer Betrag noch nicht vermerkt
		try {
			Thread.sleep((int)Math.random()*1000);
		}
		catch(InterruptedException e) {
		}
		mKonten[von] = newBalance;
	
		newBalance = mKonten[nach];
		newBalance += amount;
		// dito
		mKonten[nach] = newBalance;
	}
	
	public void balance() {
		for(int i = 0; i < mKonten.length; i++)
			System.out.println("Konto "+ i +": " + mKonten[i]);
	}
}
```

- Die Überweisungen sollen durch Bankangestellte erfolgen. 
- Diese werden durch die Klasse `Banker` implementiert. 
- Damit mehrere Banker gleichzeitig Transaktionen vornehmen können, werden sie von Thread abgeleitet. 


### Die Klasse Banker
Jeder Banker gehört zu einer Bank. 
Deshalb wird dem Konstruktor ein Verweis auf `SimpleBank` übergeben. Über diesen Verweis wird die Methode `transfer()` aufgerufen. 
Die beiden beteiligten Kontonummern sowie der Betrag werden dem Konstruktor übergeben und in entsprechenden Datenelementen der Klasse gespeichert. 

Diese Datenelemente werden dann in `run()` benutzt, um die Methode `transfer()` der Bank aufzurufen. Nachdem die Transaktion durchgeführt 
ist, wird eine aktuelle Kontenübersicht ausgegeben.


```java
 class Banker extends Thread {

	private SimpleBank mBank;
	private int mFrom, mTo, mAmount;
	
	public Angestellter(SimpleBank bank, int from, int to, int amount) {
		this.mBank = bank;
		this.mFrom = from;
		this.mTo = to;
		this.mAmount = amount;
	}
	
	public void run() {
		// Überweisung vornehmen
		mBank.transfer(mFrom, mTo, mAmount);
		// Kontostand ausgeben
		System.out.println("Nachher:");
		mBank.kontostand();
	}
}
```


### Das Main Programm 
- vereinbart drei Verweise auf die Klasse `Banker`. Anschließend wird ein `SimpleBank`-Objekt erzeugt und eine Übersicht über den Anfangsstand der Konten gegeben. 
- Dann werden die drei Thread-Objekte erzeugt. Die Konten werden hierbei so gewählt, dass sich eine ringförmige Überweisung ergibt. Wenn alles ordnungsgemäß verläuft, dann müsste also die Kontenübersicht am Ende genauso aussehen wie am Anfang. 
- Schließlich werden die Threads durch Aufrufe ihrer `start()`-Methoden gestartet. In Java wird mittel Aufruf der `start`-Methode einer Thread-Klasse die Funktion `run()` in einem neuen Thread gestartet.

```
public class SimpleBankDemo {

	public static void main(String[] args) {
		Banker A1, A2, A3;
		SimpleBank b = new SimpleBank();
	
		System.out.println("Vorher:");
		b.balance();
	
		// Eine ringförmige Überweisung
		A1 = new Banker(b, 0, 1, 20);
		A2 = new Banker(b, 1, 2, 20);
		A3 = new Banker(b, 2, 0, 20);
	
		A1.start();
		A2.start();
		A3.start();
	}
}
```

Prinzipiell kann das Beispiel ohne Probleme funktionieren. Falls jedoch von beiden Threads, zur gleichen Zeit der Kontostand von Konto A reduziert werden soll, dann kann es vorkommen, dass beide den gleichen Ausgangskontostand lesen, in ihrer temporären Variablen speichern, davon subtrahieren und dann den neuen Wert schreiben.
Je nachdem, ob der erste oder der zweite Thread beim Schreiben schneller ist, wird der Kontostand von Konto A um 10 oder um 20 verringert. Der korrekte Wert wäre jedoch die Summe der Einzelabbuchungen, also 30, gewesen. Die Ausgabe des Programms sieht so (oder ähnlich) aus:

```
       Vorher:
       Konto 0: 30
       Konto 1: 50
       Konto 2: 100
       Nachher:
       Konto 0: 10
       Konto 1: 70
       Konto 2: 100
       Nachher:
       Konto 0: 10
       Konto 1: 30
       Konto 2: 120
       Nachher:
       Konto 0: 30
       Konto 1: 30
       Konto 2: 80
```

### Lost-Update-Problem
- Wie man der letzten Kontenübersicht entnehmen kann, sind nach der letzten Überweisung 40 EUR »verschwunden«. 

- Die Ursache des Problems liegt darin, dass der Vorgang der Abbuchung, also das Lesen, Subtrahieren und Schreiben in mehreren Schritten abläuft und so ein zweiter Thread mit einer eigentlich ungültigen Zahl arbeitet. Dieses Verhalten nennt man Race-Condition. 
Generell sind Race-Conditions Programmfehler, die nur manchmal auftreten, nämlich genau dann, wenn zufällig zwei parallele Threads zur gleichen Zeit auf bestimmte Objekte zugreifen. 
Derartige Fehler sind in der Praxis schwer zu lokalisieren. 


- Die Lösung: Sperrsynchronisation mittels Semaphore Um das Problem zu umgehen, sollte es eine Möglichkeit geben, diese Sequenz als unteilbare Operation zu definieren oder den Zugriff auf das Konto während der Operation zu sperren. 

## Sieb des Eratosthenes (709)

(Producer-Consumer-Problem und Leser-Schreiber-Problem)

- Primzahlenberechnung nach dem sog. "Sieb des Eratosthenes".
- Grundprinzip dabei ist, dass jede ungerade Zahl der Reihe nach daraufhin untersucht wird, ob sie Vielfaches einer bereits erkannten Primzahl ist. Wenn das nicht der Fall ist, dann ist sie natürlich prim.
- Die folgende Lösung stellt für *jede Primzahl einen eigenen Thread* zur Verfügung. D.h. wir erhalten eine Reihe von Threads, die als *Member je eine Primzahl* enthalten.
- Der Main-Thread 
  - erzeugt die ungeraden Zahlen und 
  - sendet sie dem nächsten Thread in der Reihe (`send` bzw. `receive`-Methode)
- Dieser ist für die Primzahl 3 zuständig und filtert demnach alle Zahlen aus, die Vielfache von 3 sind. Das bedeutet er schickt diese Zahlen nicht weiter. 
- Alle anderen Zahlen reicht er an den nächsten Thread weiter, der für die Primzahl 5 zuständig ist, usw. 
- Jeder Thread erzeugt für die erste Zahl, die er weiterreichen muss (das ist die nächste Primzahl!), dynamisch seinen Nachfolger-Thread. 

Der folgende Ausschnitt funktioniert:

```java
/** 
* Worker der "Pipe" zur Primzahlenbestimmung 
* @author Roland Rössler 
* @version 1 
*/ 
public class Worker extends Thread { 
    /** die Primzahl, für die der Worker zuständig ist */ 
    private int myPrime; 

    /** der nächste Worker in der "Pipe" */ 
    private Worker next=null; 

    /** der Sende-/Empfangs-Puffer. Hier ein einf. Int Wert */ 
    private int buffer=0; 

    /** Erzeugung eines Workers und Zuordnung einer Primzahl 
      * @param prime die Primzahl, für die der Worker zuständig ist 
      */ 
    Worker(int prime) { 
        myPrime=prime; 
        next=null; /** nullsetzen*/ 
        System.out.println(this+" Prime: "+myPrime); 
    } 

    /** "Arbeitsroutine" des Workers. 
      * Es werden ungerade Zahlen empfangen, wenn diese 
      * Vielfache der "eigenen" Primzahl sind, dann werden 
      * sie "verschluckt", andernfalls an den nächsten 
      * Worker weitergereicht 
      */ 
    public void run() { 
        int i = this.receive();     // Zahl empfangen 
        while (i>0) { 			//arbeite, solange i positiv ist
            if (i%myPrime != 0) {     // wenn i nicht Vielfaches von myPrime
                // erzeuge neuen Nachfolger-Thread oder
                // wenn er bereits existiert sende ihm 
                // die Variable i

                if (next==null)
                    (next=new Worker(i)).start(); 
                else                         
                    next.send(i);              
            } 

            i = receive();                 // nächste Zahl holen 
        } 
        if (next!=null) next.send(-1);   // Abbruchkennung weiterreichen 
    } 

    /** Senden einer Zahl an den Worker. <p>"send" wird von einem 
      * anderem Thread aufgerufen. 
      * @param i zu sendende Zahl 
      */ 
    synchronized void send(int i) { 
        try { 
            while (buffer>0) wait();        // warten bis Puffer frei 
            buffer = i;                     // Zahl in Puffer eintragen 
            notify();                       // Empfänger benachrichtigen 
        } 
        catch (InterruptedException e) {} 
    } 

    /** Empfangen einer Zahl. 
      * <p>"receive" wird vom aktuellen Worker aufgerufen. 
      * @return empfangene Zahl 
      */ 
    synchronized int receive() { 
        int result=0; 
        try { 
            while ((result=buffer)==0)      // warten bis Zahl angekommen 
                wait(); 
            buffer=0;                       // Puffer freigeben 
            notify();                       // Sender benachrichtigen 
        } 
        catch (InterruptedException e) {} 
        return result; 
    } 


    /** MAINThread: Zahlengenerator. 
      * <p>Startet einen Worker für die Primzahl 3 und übergibt ihm 
      * alle ungeraden Zahlen ab 5 
    */ 
    public static void main (String args[]) { 
        Worker first = new Worker(3);     // ersten Worker für Primzahl 3 
        first.start();                    // starten

        int i=5;                          // nächste ungerade Zahl 
        while (i<10000) { 
            first.send(i);                  // ungerade Zahl an Worker senden 
            i+=2; 
        } 

        first.send(-1);                   // Abschlusskennung senden 
        System.out.println("finished"); 
    } 
}        
```

Das *Sieb des Eratosthenes* beinhaltet ein Producer-Consumer-Problem. Die Zahlen werden von `main` beginnend durch die Threads gereicht, diese warten jeweils auf die nächste Zahl.

## Producer-Consumer-BlockingQueue (713)

In Java gibt es etwa `BlockingQueue`s aus `java.util.concurrent` für den Austausch von Daten.

- Start eines Producer und Consumer Threads
- Der Producer füllt die Queue mit Strings, am Ende wird der String *exit* eingefügt
- Der Consumer entnimmt Elemente aus der Queue und gibt sie in der Konsole aus

Hauptprogramm:

```java
public static void main(String[] args) {
    //Creating BlockingQueue of size 10
    BlockingQueue<Message> queue = new ArrayBlockingQueue<>(10);
    Producer producer = new Producer(queue);
    Consumer consumer = new Consumer(queue);
    //starting producer to produce messages in queue
    new Thread(producer).start();
    //starting consumer to consume messages from queue
    new Thread(consumer).start();
    System.out.println("Producer and Consumer has been started");
}
```

Für die Queue wird ein einfacher String verwendet:

```java
public class Message {
    private String mMsg;
    public Message(String str){
        this.mMsg=str;
    }
    public String getMsg() {
        return mMsg;
    }
}
```

Der Producer fügt Elemente in die Queue ein mittels `queue.put()`:

```java
public class Producer implements Runnable {
    private BlockingQueue<Message> mQueue;

    public Producer(BlockingQueue<Message> q){
        this.mQueue = q;
    }
    @Override public void run() {
        //produce messages
        for(int i = 0; i <100; i++){
            Message msg = new Message("" + i);
            try {
                Thread.sleep(i);
                mQueue.put(msg);
                System.out.println("Produced " + msg.getMsg());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        //adding exit message
        Message msg = new Message("exit");
        try {
            mQueue.put(msg);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
```

Der Consumer entnimmt Elemente aus der Queue mittels `queue.take()`:

```java
public class Consumer implements Runnable{
    private BlockingQueue<Message> mQueue;

    public Consumer(BlockingQueue<Message> q){
        this.mQueue = q;
    }

    @Override
    public void run() {
        try{
            Message msg;
            //consuming messages until exit message is received
            while((msg = mQueue.take()).getMsg() != "exit"){
                Thread.sleep(10);
                System.out.println("Consumed " + msg.getMsg());
            }
        } catch(InterruptedException e) {
            e.printStackTrace();
        }
    }
}
```

die Funktion `queue.take()` blockiert bis ein Element in der Queue verfügbar ist.

## Non-Thread-Safe Fifo-Buffer (710)

Erstellen Sie einen Buffer für die Übertragung von Daten zwischen einen Producer und einem Consumer.

- int-Ringbuffer, in den Buffer können n-1 Elemente eingefügt werden, die fehlende Stelle wird für die Vollerkennung benötigt
- Beim Einfügen (enqueue) kann ein Bufferoverflow passieren, dieser ist mittels Exception auszugeben
- Beim Auslesen (dequeue) kann ein Bufferunderf passieren, dieser ist mittels Exception auszugeben 

Template Fifo.java:

```java
public class Fifo {
    private int[] mQueue;
    private int mSize, mBegin, mEnd;   // mBegin of mQueue and mEnd of mQueue

    Fifo(int size) {// to store mSize elements
		// insert Code
    }

    public int dequeue()  throws EmptyException {
		// insert Code
    }

    public boolean isEmpty() {
		// insert Code
    }

    public boolean isFull()  {
		// insert Code
    }

    public void enqueue(int item) throws FullException {
		// insert Code
    }
}
```

mit den EmptyException und FullException (anaolg):

```java
public class EmptyException extends Exception {
    public EmptyException(){
        super("Queue Empty Exception");
    }

    public EmptyException(String msg){
        super(msg);
    }
}
```

FifoTest.java:

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

Implementieren Sie den Buffer um den Test zu passieren (======== ALL TESTS PASSED =======).

## Thread-Safe Fifo-Buffer (712)

Lösen Sie das Producer-Consumer-Problem mittels synchronisierten Fifo-Buffer (siehe oben).

Der Buffer mit Exceptions für Over-/Underrun ist nicht optimal, daher muss der Fifo-Buffer Thread-Sicher gemacht werden.

Hauptprogramm ProdConsDemo.java:

```java
public class ProdConsDemo {
    public static void main(String[] args) {

        Fifo myFifo = new Fifo(5);

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

mit dem Producer Producer.java:

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
            System.out.println("PRODUCER: enqueue " + i);
            mFifo.enqueue(i);
        }
    }
}
```

und dem Consumer Consumer.java:

```java
class Consumer extends Thread{
    Fifo mFifo;

    public Consumer(Fifo fifo){
        this.mFifo=fifo;
    }

    @Override
    public void run(){
        try {
            consume();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
    }

    public void consume() throws EmptyException {
        for (int i=1; i <=500; i++)
            System.out.println("\t\t\t\tCONSUMER: dequeue " + mFifo.dequeue());
    }
}
```

Tipps:

- der Monitor wird auf den FiFo-Buffer gesetzt

- wenn der Buffer voll ist muss ein Sender (enqueue) warten `wait()` und nach dem enquen, wird ein eventuell schlafender Empfänger (dequeue) geweckt werden `notify()`:

  ```java
  synchronized (this) {
  	...
      wait();
      ...
      notify();
  }
  ```

  völlig analog für den Fall dass ein Empfänger aus einem leeren Buffer lesen möchte `wait()` und wenn ein Empfänger empfangen hat, einen wartenden Sender wecken `notify()`.

## LostUpdate-Monitor (711)

Vervollständigen Sie das folgende Programm-Fragment unter Verwendung des erzeugten Fifo-Buffers:

```java
class LostUpdate extends Thread {
    private String mPrefix;

    // gemeinsamer Speicher: Hier eine static Variable
    private static int mCount = 0;

    // Sync-Objekt !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    // ENTER CODE

    public LostUpdate(String s) {
        this.mPrefix = s;
    }

    public void run() {
        for (int i = 1; i <= 5; i++) {
            // begin critical section !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

            // ENTER CODE

            // READ
            int temp;
            temp = mCount;
            System.out.println(mPrefix + "READ: " + temp);
            try {
                Thread.sleep(50);
            } catch (InterruptedException e) {}

            // INCR
            temp = temp + 1;
            System.out.println(mPrefix + "INCR: " + temp);
            try {
                Thread.sleep(20);
            } catch (InterruptedException e) {}

            //WRITE
            mCount = temp;
            System.out.println(mPrefix + "WRITTEN: " + temp);
            try {
                Thread.sleep(30);
            } catch (InterruptedException e) {}
            // END critical section		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        } // for
    }
}

public class Main {
    public static void main(String[] args) {
        LostUpdate t1= new LostUpdate("THREAD1: ");
        LostUpdate t2= new LostUpdate("\t\t\t\tTHREAD2: ");

        t1.start();
        t2.start();

        try {
            t1.join();
            t2.join();
        } catch (InterruptedException e) {}
    }
}

/* output

THREAD1: READ: 0
THREAD1: INCR: 1
THREAD1: WRITTEN: 1
THREAD1: READ: 1
THREAD1: INCR: 2
THREAD1: WRITTEN: 2
                                THREAD2: READ: 2
                                THREAD2: INCR: 3
                                THREAD2: WRITTEN: 3
                                THREAD2: READ: 3
                                THREAD2: INCR: 4
                                THREAD2: WRITTEN: 4
                                THREAD2: READ: 4
                                THREAD2: INCR: 5
                                THREAD2: WRITTEN: 5
                                THREAD2: READ: 5
                                THREAD2: INCR: 6
                                THREAD2: WRITTEN: 6
THREAD1: READ: 6
THREAD1: INCR: 7
THREAD1: WRITTEN: 7
THREAD1: READ: 7
THREAD1: INCR: 8
THREAD1: WRITTEN: 8
THREAD1: READ: 8
THREAD1: INCR: 9
THREAD1: WRITTEN: 9
                                THREAD2: READ: 9
                                THREAD2: INCR: 10
                                THREAD2: WRITTEN: 10
*/
```

## Referenzen

- Sehr gut lesbares, deutsches Java-Skriptum
  http://ssw.jku.at/Teaching/Lectures/Sem/2003/reports/Brueckl/Brueckl.pdfd