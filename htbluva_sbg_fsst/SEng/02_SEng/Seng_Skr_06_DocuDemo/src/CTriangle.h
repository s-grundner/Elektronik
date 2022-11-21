#include "CFigure.h"

typedef int QPoint;
typedef int GlobalColor;
typedef int QPainter;

/**
 * @brief Class for administration of triangle-shapes.
 * 
 */
class CTriangle : CFigure {
private:
/// @brief 1st point of the triangle
    QPoint m_pt1;
/// @brief 2nd point of the triangle
    QPoint m_pt2;
/// @brief 3rd point of the triangle
    QPoint m_pt3;
public:
/**
 * @brief Construct a new CTriangle object
 * 
 * @param i 
 */
    CTriangle(GlobalColor i) : CFigure(i) {};
    void draw(QPainter *p);
};