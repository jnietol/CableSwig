#ifndef EXAMPLE_H
#define EXAMPLE_H

class shape {
public:
  shape();
  virtual ~shape();
  virtual bool cover( double x, double y ); // does this shape cover this point?
};

class volume {
public:
    virtual double depth( double x, double y );
};

extern void draw_shape_coverage( shape *s, int div_x, int div_y );
extern void draw_depth_map( volume *v, int div_x, int div_y );

#endif//EXAMPLE_H
