/* This file is part of a test for SF bug #231619. 
   It shows that the %import directive does not work properly in SWIG
   1.3a5:  Type information is not properly generated if a base class
   comes from an %import-ed file. */

%module imports_b

%{ 
#include "imports_b.h" 
%} 

%import "imports_a.i" 

%include "imports_b.h"  
