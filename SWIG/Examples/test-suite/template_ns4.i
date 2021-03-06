%module template_ns4

%inline %{
    namespace hello {

    class Double {
    };
   
    template <class ArgType, class ResType>
    struct Function
    {     
	char *test() { return (char *) "test"; }
    };
   
    template <class AF, class RF>
    struct ArithFunction : Function<AF, RF>
    {
    };
   
    template <class ArgType, class ResType>
    struct traits
    {
    }; 

    template <class ArgType>
    struct traits<ArgType, double>
    {
      typedef ArgType arg_type;
      typedef double res_type;
      typedef ArithFunction<ArgType, double> base;
    };   

    template <class ArgType>
    struct traits<ArgType, Double>
    {
      typedef ArgType arg_type;
      typedef Double res_type;
      typedef ArithFunction<ArgType, Double> base;
    };   

    template <class AF, class RF>
    class Class : public ArithFunction< typename traits<AF, RF>::arg_type,
                    typename traits<AF, RF>::res_type >
    {
    };
 
    template <class AF, class RF>
    typename traits<AF, RF>::base
    make_Class()
    {
      return Class<AF, RF>();
    }
   
  }  
%}
 namespace hello {
  //
  // This complains only when using a namespace
  //
  %template() traits<Double,Double>;
  %template(Function_DD) Function <Double, Double>;
  %template(ArithFunction_DD) ArithFunction <Double, Double>;
  %template(Class_DD) Class <Double, Double>;
  %template(make_Class_DD) make_Class <Double, Double>;
 }

