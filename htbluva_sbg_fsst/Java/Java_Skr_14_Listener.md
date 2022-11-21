# 14 Tastatur- / Maus-Listener

## KeyListener

Für's Abfragen von Tastaturanschlägen kann ein KeyListener implementiert werden. Dafür muss dem entsprechenden Element ein `addKeyListener()` aufgerufen werden. Manchmal gibt's Probleme wenn der Listener an ein JPanel gehängt wird, eine Verknüpfung mit JFrame ist wohl stabiler:

```java
public class PanelKeyListener extends JFrame implements KeyListener {	//<<<<
	JPanel contentPane;
	
	public static void main(String[] args) {
		new PanelKeyListener();
	}
    
	public PanelKeyListener() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 429, 327);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		addKeyListener(this);				// <<<<<<<<<<<<<<<<<<<<<
		this.setVisible(true);
	}
	
	@Override
	public void keyPressed(KeyEvent e) {		//<<<<<<<<<<<<<<<<<<<<<<
	}

	@Override
	public void keyReleased(KeyEvent e) {		//<<<<<<<<<<<<<<<<<<<<<<
	}

	@Override
	public void keyTyped(KeyEvent e) {		//<<<<<<<<<<<<<<<<<<<<<<
		System.out.println(e.getKeyChar());
	}
}
```

### MouseListener

```java
public class MausListener extends JFrame  implements MouseListener {	// <<<<<<< MouseListener wird implementiert
	private static final long serialVersionUID = 1L;
	JPanel contentPane;
	int x1 = 0;
	int y1 = 0;
	int x2 = 0;
	int y2 = 0;
	
	public static void main(String[] args) {
		new MausListener();
	}
	
	public void update() {
		repaint();
	}
	public void paint(Graphics g){
		super.paint(g);

		// die eigentliche Grafik wird im jPanel angezeigt
		Graphics2D leinwand= (Graphics2D) contentPane.getGraphics();	// Graphics2D wird benötigt für Strichstärke
		leinwand.setColor(Color.blue);
		leinwand.setStroke(new BasicStroke( 2, BasicStroke.CAP_ROUND, BasicStroke.JOIN_MITER ));		// Linienstärke, Art
		leinwand.drawLine (x1,y1,x2,y2);
	}
	
	public MausListener(){
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 429, 327);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.addMouseListener(this);			//<<<<<<<<<<<<<
		addMouseListener(this);
		this.setVisible(true);
	}

	@Override
	public void mouseClicked(MouseEvent arg0) {			//<<<<<<<<<<<<<
	}

	@Override
	public void mouseEntered(MouseEvent arg0) {			//<<<<<<<<<<<<<
	}

	@Override
	public void mouseExited(MouseEvent arg0) {			//<<<<<<<<<<<<<
	}

	@Override
	public void mousePressed(MouseEvent arg0) {			//<<<<<<<<<<<<<
	}

	@Override
	public void mouseReleased(MouseEvent arg0) {			//<<<<<<<<<<<<<
		x1 = x2;
		y1 = y2;
		x2 = arg0.getX();
		y2 = arg0.getY();
		repaint();
	}
}
```

