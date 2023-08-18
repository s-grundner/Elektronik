class myRechteck {		// Wunsch-Interface: Zeichnen mit draw()
public:
    virtual void draw() = 0;
};

class Rechteck {		// Vorhandenes Rechteck
public:
    Rechteck(int x1, int y1, int x2, int y2) { // Konstruktor mit 2 Punkten des Rechtecks
        m_x1 = x1;
        m_y1 = y1;
        m_x2 = x2;
        m_y2 = y2;
        cout << "Rechteck:  Konstruktor.  P1(" << m_x1 << "," << m_y1 << ") => P2("
          << m_x2 << "," << m_y2 << ")" << endl;
    }
    void oldDraw() {
        cout << "Rechteck:  oldDraw.  P1(" << m_x1 << "," << m_y1 << ") => P2("
          << m_x2 << "," << m_y2 << ")" << endl;
    }
private:
    int m_x1;
    int m_y1;
    int m_x2;
    int m_y2;
};

int main() {
    myRechteck *r = new RechteckAdapter(120, 200, 60, 40);
    r->draw();
}