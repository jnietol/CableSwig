%module(directors="1") director_exception
%{

#include <string>

class Foo {
public:
	virtual ~Foo() {}
	virtual std::string ping() { return "Foo::ping()"; }
	virtual std::string pong() { return "Foo::pong();" + ping(); }
};

Foo *launder(Foo *f) {
	return f;
}

// define dummy director exception classes to prevent spurious errors 
// in target languages that do not support directors.

#ifndef SWIG_DIRECTORS
namespace Swig {
class DirectorException {};
class DirectorMethodException: public Swig::DirectorException {};
}
  #ifndef SWIG_fail
    #define SWIG_fail
  #endif
#endif

%}

%include "std_string.i"

#ifdef SWIGPYTHON

%feature("director:except") {
	if ($error != NULL) {
		throw Swig::DirectorMethodException();
	}
}

%exception {
	try { $action }
	catch (Swig::DirectorException &e) { SWIG_fail; }
}

#endif

#ifdef SWIGRUBY

%feature("director:except") {
    throw Swig::DirectorMethodException($error);
}

%exception {
  try { $action }
  catch (Swig::DirectorException &e) { rb_exc_raise(e.getError()); }
}

#endif

%feature("director") Foo;

class Foo {
public:
	virtual ~Foo() {}
	virtual std::string ping() { return "Foo::ping()"; }
	virtual std::string pong() { return "Foo::pong();" + ping(); }
};

Foo *launder(Foo *f);

