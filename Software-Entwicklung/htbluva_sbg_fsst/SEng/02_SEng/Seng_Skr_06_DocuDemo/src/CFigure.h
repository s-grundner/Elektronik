typedef int GlobalColor;

/**
 * @brief Base-Class for shapes to be drawn.
 * 
 */
class CFigure {
protected:
/**
 * @brief Color of the shape
 * 
 */
    GlobalColor m_pen;
public:
    CFigure(GlobalColor i);
};