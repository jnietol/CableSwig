#######################################################################
# /cvsroot/SWIG/Examples/test-suite/common.mk,v 1.90 2004/02/04 21:05:39 cheetah Exp
# 
# SWIG test suite makefile.
# The test suite comprises many different test cases, which have
# typically produced bugs in the past. The aim is to have the test 
# cases compiling for every language modules. Some testcase have
# a runtime test which is written in each of the module's language.
#
# This makefile runs SWIG on the testcases, compiles the c/c++ code
# then builds the object code for use by the language.
# To complete a test in a language follow these guidelines: 
# 1) Add testcases to CPP_TEST_CASES (c++) or C_TEST_CASES (c) or
#    MULTI_CPP_TEST_CASES (multi-module c++ tests)
# 2) If not already done, create a makefile which:
#    a) Defines LANGUAGE matching a language rule in Examples/Makefile, 
#       for example LANGUAGE = java
#    b) Define rules for %.ctest, %.cpptest, %.multicpptest and %.clean.
#    c) Define srcdir, top_srcdir and top_builddir (these are the
#       equivalent to configure's variables of the same name).
#
# The variables below can be overridden after including this makefile
#######################################################################

#######################################################################
# Variables
#######################################################################
SWIG       = $(top_builddir)swig
SWIG_LIB   = $(top_srcdir)/Lib
TEST_SUITE = test-suite
EXAMPLES   = Examples
CXXSRCS    = 
CSRCS      = 
TARGETPREFIX = 
TARGETSUFFIX = 
SWIGOPT    = -I$(top_srcdir)/$(EXAMPLES)/$(TEST_SUITE)
INCLUDES   = -I$(top_srcdir)/$(EXAMPLES)/$(TEST_SUITE)
RUNTIMEDIR = $(top_builddir)/Runtime/.libs
DYNAMIC_LIB_PATH = $(RUNTIMEDIR):.

#
# Please keep test cases in alphabetical order.
# Note that any whitespace after the last entry in each list will break make
#

# Broken C++ test cases. (Can be run individually using make testcase.cpptest.)
CPP_TEST_BROKEN += \
	array_typedef_memberin \
	defvalue_constructor \
	features.i \
	namespace_union \
	smart_pointer_namespace2 \
	template_default_arg \
	template_specialization_defarg \
	template_specialization_enum \
	using_namespace

# Broken C test cases. (Can be run individually using make testcase.ctest.)
C_TEST_BROKEN +=


# C++ test cases. (Can be run individually using make testcase.cpptest.)
CPP_TEST_CASES += \
	abstract_access \
	abstract_inherit \
	abstract_inherit_ok \
	abstract_signature \
	abstract_typedef \
	abstract_typedef2 \
	abstract_virtual \
	add_link \
	aggregate \
	anonymous_arg \
	anonymous_bitfield \
	argout \
	array_member \
	arrayref \
	arrays_dimensionless \
	arrays_global \
	arrays_global_twodim \
	arrays_scope \
	bloody_hell \
	bool_default \
	bools \
	casts \
	cast_operator \
	class_ignore \
	class_scope_weird \
	const_const_2 \
	constant_pointers \
	constover \
	constructor_exception \
	constructor_explicit \
	constructor_value \
	contract \
	conversion \
	conversion_namespace \
	conversion_ns_template \
	cplusplus_throw \
	cpp_enum \
	cpp_enum_scope \
	cpp_enum_scope \
	cpp_namespace \
	cpp_nodefault \
	cpp_static \
	cpp_typedef \
	default_cast \
	default_char \
	default_constructor \
	default_ns \
	default_ref \
	director_abstract \
	director_basic \
	director_detect \
	director_exception \
	director_frob \
	director_finalizer \
	director_nested \
	director_protected \
	director_redefined \
	director_unroll \
	director_wombat \
	dynamic_cast \
	enum_plus \
	enum_scope \
	enum_scope_template \
	enum_var \
	evil_diamond \
	evil_diamond_ns \
	evil_diamond_prop \
	exception_order \
	extend_placement \
	extend_template \
	extend_template_ns \
	extern_throws \
	friends \
	global_ns_arg \
	grouping \
	ignore_parameter \
	import_nomodule \
	inherit_missing \
	inline_initializer \
	inherit_void_arg \
	kind \
	lib_carrays \
	lib_cdata \
	lib_cpointer \
	lib_std_deque \
        lib_std_pair \
	lib_std_string \
	lib_std_vector \
	lib_typemaps \
	long_long_apply \
	member_template \
	minherit \
	name_cxx \
	name_inherit \
	name_warnings \
	namespace_enum \
	namespace_extend \
	namespace_nested \
	namespace_spaces \
	namespace_template \
	namespace_typedef_class \
	namespace_typemap \
	namespace_virtual_method \
	newobject1 \
	overload_complicated \
	overload_copy \
	overload_extend \
	overload_simple \
	overload_subtype \
	overload_template \
	pointer_reference \
	primitive_ref \
	private_assign \
        protected_rename \
	pure_virtual \
	redefined \
	reference_global_vars \
	rename_default \
	rename_default \
	rename_scope \
	return_value_scope \
	rname \
	smart_pointer_const \
	smart_pointer_const2 \
	smart_pointer_multi \
	smart_pointer_multi_typedef \
	smart_pointer_namespace \
	smart_pointer_not \
	smart_pointer_overload \
	smart_pointer_protected \
	smart_pointer_rename \
	smart_pointer_simple \
	smart_pointer_static \
	smart_pointer_typedef \
	static_array_member \
	static_const_member \
	static_const_member_2 \
	struct_value \
	template \
	template_array_numeric \
	template_arg_replace \
	template_arg_scope \
	template_arg_typename \
	template_base_template \
	template_classes \
	template_const_ref \
	template_construct \
	template_default \
	template_default2 \
	template_default_inherit \
	template_default_qualify \
	template_default_vw \
	template_enum \
	template_enum_ns_inherit \
	template_enum_typedef \
	template_explicit \
	template_extend_overload \
	template_extend_overload_2 \
	template_extend1 \
	template_extend2 \
	template_forward \
	template_inherit \
	template_inherit_abstract \
	template_int_const \
	template_ns \
	template_ns2 \
	template_ns3 \
	template_ns4 \
	template_ns_enum \
	template_ns_enum2 \
	template_ns_inherit \
	template_ns_scope \
	template_partial_arg \
	template_qualifier \
	template_qualifier \
	template_ref_type \
	template_rename \
	template_retvalue \
	template_specialization \
	template_static \
	template_tbase_template \
	template_type_namespace \
	template_typedef \
	template_typedef_cplx \
	template_typedef_cplx2 \
	template_typedef_cplx3 \
	template_typedef_cplx4 \
	template_typedef_cplx5 \
	template_virtual \
	template_whitespace \
	throw_exception \
	typedef_array_member \
	typedef_class \
	typedef_funcptr \
	typedef_inherit \
	typedef_mptr \
	typedef_reference \
	typedef_scope \
	typemap_namespace \
	typemap_ns_using \
	typename \
	union_scope \
	using1 \
	using2 \
	using_composition \
	using_extend \
	using_inherit \
	using_pointers \
	using_private \
	using_protected \
	valuewrapper \
	valuewrapper_base \
	valuewrapper_const \
	valuewrapper_default \
	varargs \
	virtual_destructor \
	voidtest \
	wrapmacro

# C test cases. (Can be run individually using make testcase.ctest.)
C_TEST_CASES += \
	arrays \
	char_constant \
	const_const \
	enums \
	function_typedef \
	inctest \
	lib_carrays \
	lib_cdata \
	lib_cmalloc \
	lib_constraints \
	lib_cpointer \
	lib_math \
	long_long \
	name \
	nested \
	newobject2 \
	overload_extendc \
	preproc \
	ret_by_value \
	sizeof_pointer \
	sneaky1 \
	struct_rename \
	typemap_subst \
	unions


# Multi-module C++ test cases . (Can be run individually using make testcase.multicpptest.)
MULTI_CPP_TEST_CASES += \
	imports \
	template_typedef_import

NOT_BROKEN_TEST_CASES =	$(CPP_TEST_CASES:=.cpptest) \
			$(C_TEST_CASES:=.ctest) \
			$(MULTI_CPP_TEST_CASES:=.multicpptest)

BROKEN_TEST_CASES = 	$(CPP_TEST_BROKEN:=.cpptest) \
			$(C_TEST_BROKEN:=.ctest)

ALL_CLEAN = 		$(CPP_TEST_CASES:=.clean) \
			$(C_TEST_CASES:=.clean) \
			$(MULTI_CPP_TEST_CASES:=.clean) \
			$(CPP_TEST_BROKEN:=.clean) \
			$(C_TEST_BROKEN:=.clean)

#######################################################################
# The following applies for all module languages
#######################################################################
all:	$(BROKEN_TEST_CASES) $(NOT_BROKEN_TEST_CASES)

check: 	$(NOT_BROKEN_TEST_CASES)

broken: $(BROKEN_TEST_CASES)

swig_and_compile_cpp =  \
	$(MAKE) -f $(top_builddir)/$(EXAMPLES)/Makefile CXXSRCS="$(CXXSRCS)" \
	SWIG_LIB="$(SWIG_LIB)" SWIG="$(SWIG)" \
	INCLUDES="$(INCLUDES)" SWIGOPT="$(SWIGOPT)" NOLINK=true \
	TARGET="$(TARGETPREFIX)$*$(TARGETSUFFIX)" INTERFACE="$*.i" \
	$(LANGUAGE)$(VARIANT)_cpp

swig_and_compile_c =  \
	$(MAKE) -f $(top_builddir)/$(EXAMPLES)/Makefile CSRCS="$(CSRCS)" \
	SWIG_LIB="$(SWIG_LIB)" SWIG="$(SWIG)" \
	INCLUDES="$(INCLUDES)" SWIGOPT="$(SWIGOPT)" NOLINK=true \
	TARGET="$(TARGETPREFIX)$*$(TARGETSUFFIX)" INTERFACE="$*.i" \
	$(LANGUAGE)$(VARIANT)

swig_and_compile_multi_cpp = \
	for f in `cat $(top_srcdir)/$(EXAMPLES)/$(TEST_SUITE)/$*.list` ; do \
	  $(MAKE) -f $(top_builddir)/$(EXAMPLES)/Makefile CXXSRCS="$(CXXSRCS)" \
	  SWIG_LIB="$(SWIG_LIB)" SWIG="$(SWIG)" \
	  INCLUDES="$(INCLUDES)" SWIGOPT="$(SWIGOPT)" RUNTIMEDIR="$(RUNTIMEDIR)" \
	  TARGET="$(TARGETPREFIX)$${f}$(TARGETSUFFIX)" INTERFACE="$$f.i" \
	  NOLINK=true $(LANGUAGE)$(VARIANT)_multi_cpp; \
	done

setup = \
	if [ -f $(srcdir)/$(SCRIPTPREFIX)$*$(SCRIPTSUFFIX) ]; then	  \
	  echo "Checking testcase $* (with run test) under $(LANGUAGE)" ; \
	else								  \
	  echo "Checking testcase $* under $(LANGUAGE)" ;		  \
	fi;



#######################################################################
# Clean
#######################################################################
clean: $(ALL_CLEAN)

distclean: clean
	@rm -f Makefile

.PHONY: all check broken clean distclean 

