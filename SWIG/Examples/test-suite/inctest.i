%module inctest

 //
 // This test fails if swig is not able to include
 // the following two files:
 //
 //   'testdir/subdir1/hello.i'
 //   'testdir/subdir2/hello.i'
 //
 // since they have the same basename 'hello', swig is only
 // including one. This is not right, it must include both,
 // as the well known compilers do.
 //
 // Also repeats the test for the import directive in subdirectories

%include "testdir/test.i"
