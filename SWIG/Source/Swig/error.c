/* ----------------------------------------------------------------------------- 
 * error.c
 *
 *     Error handling functions.   These are used to issue warnings and
 *     error messages.
 * 
 * Author(s) : David Beazley (beazley@cs.uchicago.edu)
 *
 * Copyright (C) 1999-2000.  The University of Chicago
 * See the file LICENSE for information on usage and redistribution.	
 * ----------------------------------------------------------------------------- */

#include "swig.h"
#include <stdarg.h>
#include <ctype.h>

char cvsroot_error_c[] = "/cvsroot/SWIG/Source/Swig/error.c,v 1.7 2004/01/15 08:33:12 mmatus Exp";

/* -----------------------------------------------------------------------------
 * Commentary on the warning filter.
 *
 * The warning filter is a string of numbers prefaced by (-) or (+) to
 * indicate whether or not a warning message is displayed.  For example:
 *
 *      "-304-201-140+210+201"
 *
 * The filter string is scanned left to right and the first occurrence
 * of a warning number is used to determine printing behavior.
 *
 * The same number may appear more than once in the string.  For example, in the 
 * above string, "201" appears twice.  This simply means that warning 201
 * was disabled after it was previously enabled.  This may only be temporary
 * setting--the first number may be removed later in which case the warning
 * is reenabled.
 * ----------------------------------------------------------------------------- */

#if defined(_WIN32)
#  define  DEFAULT_ERROR_MSG_FORMAT EMF_MICROSOFT
#else
#  define  DEFAULT_ERROR_MSG_FORMAT EMF_STANDARD
#endif
static ErrorMessageFormat msg_format = DEFAULT_ERROR_MSG_FORMAT;
static int silence = 0;            /* Silent operation */
static String *filter = 0;         /* Warning filter */
static int warnall = 0;
static int nwarning = 0;

static int init_fmt = 0;
static char wrn_wnum_fmt[64];
static char wrn_nnum_fmt[64];
static char err_line_fmt[64];
static char err_eof_fmt[64];

/* -----------------------------------------------------------------------------
 * Swig_warning()
 *
 * Issue a warning message
 * ----------------------------------------------------------------------------- */

void 
Swig_warning(int wnum, const String_or_char *filename, int line, const char *fmt, ...) {
  String *out;
  char   *msg;
  int     wrn = 1;
  va_list ap;
  if (silence) return;
  if (!init_fmt) Swig_error_msg_format(DEFAULT_ERROR_MSG_FORMAT);
  
  va_start(ap,fmt);

  out = NewString("");
  vPrintf(out,fmt,ap);
  {
    char temp[64], *t;
    t = temp;
    msg = Char(out);
    while (isdigit((int) *msg)) {
      *(t++) = *(msg++);
    }
    if (t != temp) {
      msg++;
      *t = 0;
      wnum = atoi(temp);
    }
  }

  /* Check in the warning filter */
  if (filter) {
    char    temp[32];    
    char *c;
    sprintf(temp,"%d",wnum);
    c = Strstr(filter,temp);
    if (c) {
      if (*(c-1) == '-') wrn = 0;     /* Warning disabled */
      if (*(c-1) == '+') wrn = 1;     /* Warning enabled */
    }
  }
  if (warnall || wrn) {
    if (wnum) {
      Printf(stderr, wrn_wnum_fmt, filename, line, wnum);
    } else {
      Printf(stderr, wrn_nnum_fmt, filename, line);
    }
    Printf(stderr,"%s",msg);
    nwarning++;
  }
  Delete(out);
  va_end(ap);
}

/* -----------------------------------------------------------------------------
 * Swig_error()
 *
 * Issue an error message
 * ----------------------------------------------------------------------------- */

static int nerrors = 0;

void 
Swig_error(const String_or_char *filename, int line, const char *fmt, ...) {
  va_list ap;

  if (silence) return;
  if (!init_fmt) Swig_error_msg_format(DEFAULT_ERROR_MSG_FORMAT);
  
  va_start(ap,fmt);
  if (line > 0) {
    Printf(stderr, err_line_fmt, filename, line);
  } else {
    Printf(stderr, err_eof_fmt, filename);
  }
  vPrintf(stderr,fmt,ap);
  va_end(ap);
  nerrors++;
}

/* -----------------------------------------------------------------------------
 * Swig_error_count()
 *
 * Returns number of errors received.
 * ----------------------------------------------------------------------------- */

int
Swig_error_count(void) {
  return nerrors;
}

/* -----------------------------------------------------------------------------
 * Swig_error_silent()
 *
 * Set silent flag
 * ----------------------------------------------------------------------------- */

void
Swig_error_silent(int s) {
  silence = s;
}


/* -----------------------------------------------------------------------------
 * Swig_warnfilter()
 *
 * Takes a comma separate list of warning numbers and puts in the filter.
 * ----------------------------------------------------------------------------- */

void
Swig_warnfilter(const String_or_char *wlist, int add) {
  char *c;
  String *s;

  if (!filter) filter = NewString("");
  s = NewString(wlist);
  c = Char(s);
  c = strtok(c,", ");
  while (c) {
    if (isdigit((int) *c) || (*c == '+') || (*c == '-')) {
      if (add) {
	Insert(filter,0,c);
	if (isdigit((int) *c)) {
	  Insert(filter,0,"-");
	}
      } else {
	char temp[32];
	if (isdigit((int) *c)) {
	  sprintf(temp,"-%s",c);
	} else {
	  strcpy(temp,c);
	}
	Replace(filter,temp,"", DOH_REPLACE_FIRST);
      }
    }
    c = strtok(NULL,", ");
  }
  Delete(s);
}

void
Swig_warnall(void) {
  warnall = 1;
}


/* ----------------------------------------------------------------------------- 
 * Swig_warn_count()
 *
 * Return the number of warnings
 * ----------------------------------------------------------------------------- */

int
Swig_warn_count(void) {
  return nwarning;
}

/* -----------------------------------------------------------------------------
 * Swig_error_msg_format()
 *
 * Set the type of error/warning message display
 * ----------------------------------------------------------------------------- */

void
Swig_error_msg_format(ErrorMessageFormat format) {
  const char* error    = "Error";
  const char* warning  = "Warning";

  const char* fmt_eof  = "%s:EOF";

  /* here 'format' could be directly a string instead of an enum, but
     by now a switch is used to translated into one. */
  const char* fmt_line = 0;
  switch (format) {
  case EMF_MICROSOFT:
    fmt_line = "%s(%d)";
    break;
  case EMF_STANDARD:
  default:
    fmt_line = "%s:%d";
  }

  sprintf(wrn_wnum_fmt, "%s: %s(%%d): ", fmt_line, warning);
  sprintf(wrn_nnum_fmt, "%s: %s: ",      fmt_line, warning);
  sprintf(err_line_fmt, "%s: %s: ",      fmt_line, error);
  sprintf(err_eof_fmt,  "%s: %s: ",      fmt_eof,  error);

  msg_format = format;
  init_fmt = 1;
}
