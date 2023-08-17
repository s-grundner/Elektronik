# 15 Bilder

## Fenster Erzeugen

Um Bilder in einem Fenster darzustellen wird ein JFrame und JPanel benötigt:

```java
public class MyPanel extends JPanel {

  public MyPanel() {
    this.setPreferredSize(new Dimension(800, 600));
	JFrame fr = new JFrame();
	fr.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	fr.add(this);
	fr.pack();
	fr.setVisible(true);
  }
}
```

Ein Panel wird in einem Fenster erstellt und angezeigt. Mit EXIT_ON_CLOSE wird eingestellt was passieren soll wenn das Fenster-Schließen-X gedrückt wird.

## Bilder Laden

Der erste Schritt ist die Bilder zu laden:

```java
BufferedImage pic;
String pfad = "images/bild.png";
URL pic_url = getClass().getClassLoader().getResource(pfad);
try {
  pic = ImageIO.read(pic_url);
} catch (Exception e) {
}
```

Damit ist das Bild als *pic* verfügbar. Der Ordner *images* mit *bild.png* muss hier im *bin* Ordner liegen.

### Bilder ins Panel

Das Panel wird immer wieder neu aufgebaut. Etwa wenn die Fenstergröße verstellt wird oder ein Control in diesem Bereich verändert wird. Daher muss das Darstellen des Bilds immer dann wiederholt erfolgen. Im Fall eines Neuaufbaues wird automatisch die Methode `paintComponent(Graphics g)` ausgeführt. Sie wird daher Überladen:

```java
BufferedImage pic;
...
@Override
public void paintComponent(Graphics g) {
	super.paintComponent(g);
	g.drawImage(pic, 10, 11, (int)(pic.getWidth()), (int)(pic.getHeight()), null);
}
```

Mit `super.paintComponent(g);`  werden Elemente aufgefrischt die vom System sind. mit `drawImage` wird ein Bild dargestellt:

- an der Position x=10, y=11
- das Bild wird Skaliert mit den folgenden beiden Parametern

Soll ein Bild bewegt werden, dann müssen der zweite und dritte Parameter verändert werden.

### Sprites

Um bewegte Bilder (Figuren o.ä.) darzustellen werden häufig Bilder mit leichten Veränderungen in schneller Abfolge dargestellt. Wenn die Teilbilder in einem großen Bild zusammengefasst werden dann können die Bilder in einem Array abgelegt werden:

```java
BufferedImage gesBild;
...
BufferedImage[] bild = new BufferedImage[14];
...
try {
    gesBild = ImageIO.read(new File(pfad));
} catch (Exception e) {}    
..
for (int i = 0; i < bild.length; i++) {
  int x = i % 5;
  int y = i / 5;
  bild[i] = gesBild.getSubimage(x * O_breite, 10 + y * O_hoehe, breite, hoehe);
}
```

Es wird ein bild-Array erstellt in welchem in jedem Element ein Teil des Sammelbildes abgelegt wird (getSubimage).

<img src="./bilder/bird.png" width="500">

Es wird nur einmal ein Bild geladen und im Programm wird es gesplittet.