# 16 Zeichnen

## Fenster Erzeugen

Zum Zeichnen wird ein JFrame benötigt. Für Bedienelemente wird ein JPanel benötigt, daher wird's gleich mit erzeugt (einfach JFrame mit WindowBuilder-Vorlage erstellen):

```java
public class Gfx extends JFrame {

    public Gfx() {		// Konstruktor
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setBounds(100, 100, 450, 300);
        contentPane = new JPanel();
        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
        setContentPane(contentPane);
        contentPane.setLayout(null);		// xy-Layout
    }

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Gfx frame = new Gfx();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
}
```

Ein Panel wird in einem Fenster erstellt und angezeigt. Mit EXIT_ON_CLOSE wird eingestellt was passieren soll wenn das Fenster-Schließen-X gedrückt wird.

Eine Zeichnung muss bei jeder Veränderung der Oberfläche (einfügen von Elementen, Verändern der Fenstergröße ...) neu gezeichnet werden. Dafür wird für ein JFrame (für JPanel paintComponent()) automatisch die paint-Methode aufgerufen. Damit die eigenen Darstellungen dabei ebenfalls neu dargestellt werden, muss die paint-Methode überladen werden:

```java
@Override
public void paint(Graphics g){
	super.paint(g);		// "Fremde" Elemente werden damit upgedated

    /// .... hier eigene Zeichnungen, z.B.:
	g.drawLine(1, 1, 100, 100);
}
```

## Linien

Um etwa die Linienstärke verändern zu können muss eine Linie über ein 2D-Objekt gezeichnet werden. Dafür wird obiges `Graphics g`  Element in ein Graphics2D gecastet:

```java
Graphics2D g2d = (Graphics2D)g;				// g ist Graphics von Oben
g2d.drawLine(x1, y1, x2, y2);				
```
## Rechtecke

```java
g2d.drawRect(x1, y1, breite, hoehe);
```

## Ellipsen

```java
g2d.drawOval(x1, y1, breite, hoehe);
```

Wobei *breite* und *hoehe* das begrenzende Rechteck für die Form ist.

## Farben

Zum Ändern der Farbe wird vor dem Zeichnen die Farbe geändert:

```java
Graphics2D g2d = (Graphics2D)g;				// g ist Graphics von Oben
g2d.setColor(Color.red);
g2d.drawLine(x1, y1, x2, y2);
```

Zeichnet dein Rote Linie.

## Liniendicke/Form

```java
Graphics2D g2d = (Graphics2D)g;				// g ist Graphics von Oben
BasicStroke thick = new BasicStroke(2f);	// Dicke 2.0 Float
g2d.setStroke(thick);						// Stärke der Linie
g2d.drawLine(x1, y1, x2, y2);				
```

Mit

```java
g2d.setStroke(new BasicStroke( this.thick, BasicStroke.CAP_ROUND, BasicStroke.JOIN_MITER ));
```

können noch weitere Linienparameter verändert werden wie hier die Endform der Linie (Rund).