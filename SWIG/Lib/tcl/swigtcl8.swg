/*
 * /cvsroot/SWIG/Lib/tcl/swigtcl8.swg,v 1.19 2003/12/09 12:44:49 beazley Exp
 * 
 * swigtcl8.swg
 */

#include <tcl.h>
#include <stdlib.h>
#include <stdarg.h>
#include <ctype.h>

#ifdef __cplusplus
extern "C" {
#endif

#if (TCL_MAJOR_VERSION >= 8) && (TCL_MINOR_VERSION >=4)
    //If using TCL version 84, then add some more const.
#define SWIG_TCL_CONST84 const
#define SWIG_TCL_CONST83 const
//#error "Found that version is 8.4"
#else
#define SWIG_TCL_CONST84
#define SWIG_TCL_CONST83 const
//#error "Found that version is not 8.4"
#endif

    
/* Constant table */

#define SWIG_TCL_INT     1
#define SWIG_TCL_FLOAT   2
#define SWIG_TCL_STRING  3
#define SWIG_TCL_POINTER 4
#define SWIG_TCL_BINARY  5

/* Flags for pointer conversion */
#define SWIG_POINTER_EXCEPTION     0x1
#define SWIG_POINTER_DISOWN        0x2

/* Swig fail macro */

#define SWIG_fail   goto fail

/* Constant information structure */
typedef struct swig_const_info {
    int type;
    char *name;
    long lvalue;
    double dvalue;
    void   *pvalue;
    swig_type_info **ptype;
} swig_const_info;

typedef int   (*swig_wrapper)(ClientData, Tcl_Interp *, int, Tcl_Obj *const []);
typedef int   (*swig_wrapper_func)(ClientData, Tcl_Interp *, int, Tcl_Obj *const []);
typedef char *(*swig_variable_func)(ClientData, Tcl_Interp *, char *, char *, int);
typedef void  (*swig_delete_func)(ClientData);

typedef struct swig_method {
  SWIG_TCL_CONST84 char     *name;
  swig_wrapper   method;
} swig_method;

typedef struct swig_attribute {
  SWIG_TCL_CONST84 char     *name;
  swig_wrapper   getmethod;
  swig_wrapper   setmethod;
} swig_attribute;

typedef struct swig_class {
  SWIG_TCL_CONST84 char         *name;
  swig_type_info   **type;
  swig_wrapper       constructor;
  void              (*destructor)(void *);
  swig_method        *methods;
  swig_attribute     *attributes;
  const char         **bases;
} swig_class;

typedef struct swig_instance {
  Tcl_Obj       *thisptr;
  void          *thisvalue;
  swig_class   *classptr;
  int            destroy;
  Tcl_Command    cmdtok;
} swig_instance;

#define SWIG_NewPointerObj(ptr, type, flags) \
  SWIG_Tcl_NewPointerObj(ptr, type, flags)
#define SWIG_ConvertPtr(oc, ptr, ty, flags) \
  SWIG_Tcl_ConvertPtr(interp, oc, ptr, ty, flags)
#define SWIG_ConvertPtrFromString(c, ptr, ty, flags) \
  SWIG_Tcl_ConvertPtrFromString(interp, c, ptr, ty, flags)
#define SWIG_ConvertPacked(obj, ptr, sz, ty, flags) \
  SWIG_Tcl_ConvertPacked(interp, obj, ptr, sz, ty, flags)
#define SWIG_MakePtr(c, ptr, ty, flags) \
  SWIG_Tcl_MakePtr(c, ptr, ty, flags)
#define SWIG_NewPackedObj(ptr, sz, type, flags) \
  SWIG_Tcl_NewPackedObj(ptr, sz, type, flags)
#define SWIG_GetArgs SWIG_Tcl_GetArgs
#define SWIG_PointerTypeFromString(c) \
  SWIG_Tcl_PointerTypeFromString(c)
#define SWIG_Acquire(ptr) \
  SWIG_Tcl_Acquire(ptr)
#define SWIG_Disown(ptr) \
  SWIG_Tcl_Disown(ptr)
#define SWIG_Thisown(ptr) \
  SWIG_Tcl_Thisown(ptr)
#define SWIG_InstallConstants(interp, constants) \
  SWIG_Tcl_InstallConstants(interp, constants)
#define SWIG_GetConstant(key) \
  SWIG_Tcl_GetConstant(key)
#define SWIG_NewInstanceObj(thisvalue, type, flags) \
  SWIG_Tcl_NewInstanceObj(interp, thisvalue, type, flags)
#define SWIG_ObjectConstructor SWIG_Tcl_ObjectConstructor
#define SWIG_MethodCommand SWIG_Tcl_MethodCommand
#define SWIG_ObjectDelete SWIG_Tcl_ObjectDelete

#ifdef SWIG_NOINCLUDE

SWIGIMPORT(int)       SWIG_Tcl_ConvertPtrFromString(Tcl_Interp *, char *, void **, swig_type_info *,int flags);
SWIGIMPORT(int)       SWIG_Tcl_ConvertPtr(Tcl_Interp *, Tcl_Obj *, void **, swig_type_info *, int flags);
SWIGIMPORT(int)       SWIG_Tcl_ConvertPacked(Tcl_Interp *, Tcl_Obj *, void *, int sz, swig_type_info *, int flags);
SWIGIMPORT(void)      SWIG_Tcl_MakePtr(char *, void *, swig_type_info *, int flags);
SWIGIMPORT(Tcl_Obj *) SWIG_Tcl_NewPointerObj(void *, swig_type_info *, int flags);
SWIGIMPORT(Tcl_Obj *) SWIG_Tcl_NewPackedObj(void *, int sz, swig_type_info *, int flags);
SWIGIMPORT(int)       SWIG_Tcl_GetArgs(Tcl_Interp *, int, Tcl_Obj *const [], const char *, ...);
SWIGIMPORT(char *)    SWIG_Tcl_PointerTypeFromString(char *c);
SWIGIMPORT(void)      SWIG_Tcl_Acquire(SWIG_TCL_CONST84 void * const ptr);
SWIGIMPORT(int)       SWIG_Tcl_Disown(SWIG_TCL_CONST84 void * const ptr);
SWIGIMPORT(int)       SWIG_Tcl_Thisown(SWIG_TCL_CONST84 void * const ptr);
SWIGIMPORT(void)      SWIG_Tcl_InstallConstants(Tcl_Interp *interp, struct swig_const_info constants[]);
SWIGIMPORT(Tcl_Obj *) SWIG_Tcl_GetConstant(const char *key);
SWIGIMPORT(Tcl_Obj *) SWIG_Tcl_NewInstanceObj(Tcl_Interp *interp, void *, swig_type_info *, int flags);
SWIGIMPORT(int)       SWIG_Tcl_ObjectConstructor(ClientData, Tcl_Interp *, int, Tcl_Obj *const objv[]);
SWIGIMPORT(int)       SWIG_Tcl_MethodCommand(ClientData, Tcl_Interp *, int, Tcl_Obj *objv[]);
SWIGIMPORT(void)      SWIG_Tcl_ObjectDelete(ClientData);

#else

/* Object support */
static Tcl_HashTable  swigobjectTable;
static int            swigobjectTableinit = 0;

/* Acquire ownership of a pointer */
SWIGRUNTIME(void)
SWIG_Tcl_Acquire(SWIG_TCL_CONST84 void * const ptr) {
  //Not UsedTcl_HashEntry *entryPtr;
  int newobj;
  if (!swigobjectTableinit) {
    Tcl_InitHashTable(&swigobjectTable, TCL_ONE_WORD_KEYS);
    swigobjectTableinit = 1;
  }
  //Not Used entryPtr =
      Tcl_CreateHashEntry(&swigobjectTable, (SWIG_TCL_CONST84 char *) ptr, &newobj);
}

/* Disown a pointer.  Returns 1 if we owned it to begin with */
SWIGRUNTIME(int)
SWIG_Tcl_Disown(SWIG_TCL_CONST84 void * const ptr) {
  Tcl_HashEntry *entryPtr;
  if (!swigobjectTableinit) return 0;
  entryPtr = Tcl_FindHashEntry(&swigobjectTable, (SWIG_TCL_CONST84 char *) ptr);
  if (entryPtr) {
    Tcl_DeleteHashEntry(entryPtr);
    return 1;
  }
  return 0;
}

SWIGRUNTIME(int)
SWIG_Tcl_Thisown(SWIG_TCL_CONST84 void * const ptr) {
  if (!swigobjectTableinit) return 0;
  if (Tcl_FindHashEntry(&swigobjectTable, (SWIG_TCL_CONST84 char *) ptr)) {
    return 1;
  }
  return 0;
}
/************************/
/*NOTE: All this carring on is due to the fact that tcl is not */
/*      cost correct, and requires that non-cost char strings are passed. */
SWIGRUNTIME(void)
SWIG_Tcl_SetResultFromConstString(Tcl_Interp * interp, char const * const str, Tcl_FreeProc * freeProc) {
  const size_t NullTerminatedStringLength=strlen(str)+1;
  char * Msg= (char *) malloc(NullTerminatedStringLength);
  strncpy(Msg,str,NullTerminatedStringLength);
  Tcl_SetResult(interp, Msg, TCL_VOLATILE);
  free(Msg);
  return;
}

/* Convert a pointer value */
SWIGRUNTIME(int)
SWIG_Tcl_ConvertPtrFromString(Tcl_Interp *interp, char *c, void **ptr, swig_type_info *ty, int flags) {
  swig_type_info *tc;
  /* Pointer values must start with leading underscore */
  while (*c != '_') {
    *ptr = (void *) 0;
    if (strcmp(c,"NULL") == 0) return TCL_OK;
    /* Hmmm. It could be an object name. */
        {
        char TempGetCmd[17]=" cget -this";/* This is to avoid compiler warnings because TCL is not const correct! */
        if (Tcl_VarEval(interp,c,TempGetCmd, (char *) NULL) == TCL_OK) {
            Tcl_Obj *result = Tcl_GetObjResult(interp);
            c = Tcl_GetStringFromObj(result, NULL);
            continue;
        }
        }
    Tcl_ResetResult(interp);
    if (flags & SWIG_POINTER_EXCEPTION) 
      SWIG_Tcl_SetResultFromConstString(interp, "Type error. Expected a pointer", TCL_STATIC);
    return TCL_ERROR;
  }
  c++;
  c = SWIG_UnpackData(c,ptr,sizeof(void *));
  if (ty) {
    tc = SWIG_TypeCheck(c,ty);
    if ((!tc) && (flags & SWIG_POINTER_EXCEPTION)) {
      SWIG_Tcl_SetResultFromConstString(interp, "Type error. Expected ", TCL_STATIC);
      Tcl_AppendElement(interp, ty->name);
      return TCL_ERROR;
    } else if (!tc) {
      Tcl_ResetResult(interp);
      return TCL_ERROR;
    }
    if (flags & SWIG_POINTER_DISOWN) {
      SWIG_Disown((void *) *ptr);
    }
    *ptr = SWIG_TypeCast(tc,(void *) *ptr);
  }
  return TCL_OK;
}

/* Convert a pointer value */
SWIGRUNTIME(int)
SWIG_Tcl_ConvertPtr(Tcl_Interp *interp, Tcl_Obj *oc, void **ptr, swig_type_info *ty, int flags) {
  return SWIG_Tcl_ConvertPtrFromString(interp, Tcl_GetStringFromObj(oc,NULL), ptr, ty, flags);
}

/* Convert a pointer value */
SWIGRUNTIME(char *)
SWIG_Tcl_PointerTypeFromString(char *c) {
  char d;
  /* Pointer values must start with leading underscore. NULL has no type */
  if (*c != '_') {
    return 0;
  }
  c++;
  /* Extract hex value from pointer */
  while ((d = *c)) {
    if (!(((d >= '0') && (d <= '9')) || ((d >= 'a') && (d <= 'f')))) break;
    c++;
  }
  return c;
}

/* Convert a packed value value */
SWIGRUNTIME(int)
SWIG_Tcl_ConvertPacked(Tcl_Interp *interp, Tcl_Obj *obj, void *ptr, int sz, swig_type_info *ty, int flags) {
  swig_type_info *tc;
  char  *c;

  if (!obj) goto type_error;
  c = Tcl_GetStringFromObj(obj,NULL);
  /* Pointer values must start with leading underscore */
  if (*c != '_') goto type_error;
  c++;
  c = SWIG_UnpackData(c,ptr,sz);
  if (ty) {
    tc = SWIG_TypeCheck(c,ty);
    if (!tc) goto type_error;
  }
  return TCL_OK;

type_error:

  if (flags) {
    if (ty) {
      SWIG_Tcl_SetResultFromConstString(interp, "Type error. Expected ", TCL_STATIC);
      Tcl_AppendElement(interp, ty->name);
      return TCL_ERROR;
    } else {
      SWIG_Tcl_SetResultFromConstString(interp, "Expected packed data.", TCL_STATIC);
      return TCL_ERROR;
    }
  }
  return TCL_ERROR;
}


/* Take a pointer and convert it to a string */
SWIGRUNTIME(void)
SWIG_Tcl_MakePtr(char *c, void *ptr, swig_type_info *ty, int flags) {
  if (ptr) {
    *(c++) = '_';
    c = SWIG_PackData(c,&ptr,sizeof(void *));
    strcpy(c,ty->name);
  } else {
    strcpy(c,"NULL");
  }
  flags = 0;
}

/* Create a new pointer object */
SWIGRUNTIME(Tcl_Obj *)
SWIG_Tcl_NewPointerObj(void *ptr, swig_type_info *type, int flags) {
  Tcl_Obj *robj;
  char result[512];
  SWIG_MakePtr(result,ptr,type,flags);
  robj = Tcl_NewStringObj((SWIG_TCL_CONST84 char *)result,-1);
  return robj;
}

SWIGRUNTIME(Tcl_Obj *)
SWIG_Tcl_NewPackedObj(void *ptr, int sz, swig_type_info *type, int flags) {
  char result[1024];
  char *r = result;
  if ((2*sz + 1 + strlen(type->name)) > 1000) return 0;
  *(r++) = '_';
  r = SWIG_PackData(r,ptr,sz);
  strcpy(r,type->name);
  flags = 0;
  return Tcl_NewStringObj((SWIG_TCL_CONST84 char *)result,-1);
}

static Tcl_HashTable   swigconstTable;
static int             swigconstTableinit = 0;

/* Install Constants */
SWIGRUNTIME(void)
SWIG_Tcl_InstallConstants(Tcl_Interp *interp, swig_const_info constants[]) {
  int i;
  Tcl_Obj *obj;
  Tcl_HashEntry *entryPtr;
  int            newobj;

  if (!swigconstTableinit) {
    Tcl_InitHashTable(&swigconstTable, TCL_STRING_KEYS);
    swigconstTableinit = 1;
  }
  for (i = 0; constants[i].type; i++) {
    switch(constants[i].type) {
    case SWIG_TCL_INT:
      obj = Tcl_NewIntObj(constants[i].lvalue);
      break;
    case SWIG_TCL_FLOAT:
      obj = Tcl_NewDoubleObj(constants[i].dvalue);
      break;
    case SWIG_TCL_STRING:
      obj = Tcl_NewStringObj((SWIG_TCL_CONST84 char *) constants[i].pvalue,-1);
      break;
    case SWIG_TCL_POINTER:
      obj = SWIG_NewPointerObj(constants[i].pvalue, *(constants[i]).ptype,0);
      break;
    case SWIG_TCL_BINARY:
      obj = SWIG_NewPackedObj(constants[i].pvalue, constants[i].lvalue, *(constants[i].ptype),0);
      break;
    default:
      obj = 0;
      break;
    }
    if (obj) {
      Tcl_ObjSetVar2(interp,Tcl_NewStringObj((SWIG_TCL_CONST84 char *)constants[i].name,-1), NULL, obj, TCL_GLOBAL_ONLY);
      entryPtr = Tcl_CreateHashEntry(&swigconstTable, (SWIG_TCL_CONST84 char *)constants[i].name, &newobj);
      Tcl_SetHashValue(entryPtr, (ClientData) obj);
    }
  }
}

SWIGRUNTIME(Tcl_Obj *)
SWIG_Tcl_GetConstant(SWIG_TCL_CONST84 char *key) {
  Tcl_HashEntry *entryPtr;
  if (!swigconstTableinit) return 0;
  entryPtr = Tcl_FindHashEntry(&swigconstTable, (SWIG_TCL_CONST84 char *)key);
  if (entryPtr) {
    return (Tcl_Obj *) Tcl_GetHashValue(entryPtr);
  }
  printf("Searching %s\n", key);
  return 0;
}

/* Get arguments */
SWIGRUNTIME(int)
SWIG_Tcl_GetArgs(Tcl_Interp *interp, int objc, Tcl_Obj *const objv[], const char *fmt, ...) {
  int        argno = 0, opt = 0;
  long       tempi;
  double     tempd;
  const char *c;
  va_list    ap;
  void      *vptr;
  Tcl_Obj   *obj = 0;
  swig_type_info *ty;

  va_start(ap,fmt);
  for (c = fmt; (*c && (*c != ':') && (*c != ';')); c++,argno++) {
    if (*c == '|') {
      opt = 1;
      c++;
    }
    if (argno >= (objc-1)) {
      if (!opt) {
        SWIG_Tcl_SetResultFromConstString(interp, "Wrong # args. ", TCL_STATIC);
        goto argerror;
      } else {
        va_end(ap);
        return TCL_OK;
      }
    }

    vptr = va_arg(ap,void *);
    if (vptr) {
      if (isupper(*c)) {
        obj = SWIG_GetConstant(Tcl_GetStringFromObj(objv[argno+1],0));
        if (!obj) obj = objv[argno+1];
      } else {
        obj = objv[argno+1];
      }
      switch(*c) {
      case 'i': case 'I':
      case 'l': case 'L':
      case 'h': case 'H':
      case 'b': case 'B':
        if (Tcl_GetLongFromObj(interp,obj,&tempi) != TCL_OK) goto argerror;
        if ((*c == 'i') || (*c == 'I')) *((int *)vptr) = (int)tempi;
        else if ((*c == 'l') || (*c == 'L')) *((long *)vptr) = (long)tempi;
        else if ((*c == 'h') || (*c == 'H')) *((short*)vptr) = (short)tempi;
        else if ((*c == 'b') || (*c == 'B')) *((unsigned char *)vptr) = (unsigned char)tempi;
        break;
      case 'f': case 'F':
      case 'd': case 'D':
        if (Tcl_GetDoubleFromObj(interp,obj,&tempd) != TCL_OK) goto argerror;
        if ((*c == 'f') || (*c == 'F')) *((float *) vptr) = (float)tempd;
        else if ((*c == 'd') || (*c == 'D')) *((double*) vptr) = tempd;
        break;
      case 's': case 'S':
        if (*(c+1) == '#') {
          int *vlptr = (int *) va_arg(ap, void *);
          *((char **) vptr) = Tcl_GetStringFromObj(obj, vlptr);
          c++;
        } else {
          *((char **)vptr) = Tcl_GetStringFromObj(obj,NULL);
        }
        break;
      case 'c': case 'C':
        *((char *)vptr) = *(Tcl_GetStringFromObj(obj,NULL));
        break;
      case 'p': case 'P':
        ty = (swig_type_info *) va_arg(ap, void *);
        if (SWIG_Tcl_ConvertPtr(interp, obj, (void **) vptr, ty, SWIG_POINTER_EXCEPTION) == TCL_ERROR) goto argerror;
        break;
      case 'o': case 'O':
        *((Tcl_Obj **)vptr) = objv[argno+1];
        break;
      default:
        break;
      }
    }
  }

  if ((*c != ';') && ((objc-1) > argno)) {
    SWIG_Tcl_SetResultFromConstString(interp, "Wrong # args.", TCL_STATIC);
    goto argerror;
  }
  va_end(ap);
  return TCL_OK;

 argerror:
  {
    char temp[32];
    sprintf(temp,"%d", argno+1);
    c = strchr(fmt,':');
    if (!c) c = strchr(fmt,';');
    if (!c) c = "";
    Tcl_AppendResult(interp,c," argument ", temp, NULL);
    va_end(ap);
    return TCL_ERROR;
  }
}

SWIGRUNTIME(void)
SWIG_Tcl_ObjectDelete(ClientData clientData) {
  swig_instance *si = (swig_instance *) clientData;
  if ((si) && (si->destroy) && (SWIG_Disown(si->thisvalue))) {
    if (si->classptr->destructor) {
      (si->classptr->destructor)(si->thisvalue);
    }
  }
  Tcl_DecrRefCount(si->thisptr);
  free(si);
}

/* Function to invoke object methods given an instance */
SWIGRUNTIME(int)
SWIG_Tcl_MethodCommand(ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj * _objv[]) {
  char *method,   *attrname;
  swig_instance   *inst = (swig_instance *) clientData;
  swig_method     *meth;
  swig_attribute  *attr;
  Tcl_Obj         *oldarg;
  int              rcode;
  swig_class      *cls;
  swig_class      *cls_stack[64];
  int              cls_stack_bi[64];
  int              cls_stack_top = 0;
  int              numconf = 2;
  int              bi; 
  const char*      base_name;
  Tcl_Obj         **objv = (Tcl_Obj **) _objv;
  if (objc < 2) {
    SWIG_Tcl_SetResultFromConstString(interp, "wrong # args.", TCL_STATIC);
    return TCL_ERROR;
  }
  method = Tcl_GetStringFromObj(objv[1],NULL);
  if (strcmp(method,"-acquire") == 0) {
    inst->destroy = 1;
    SWIG_Acquire(inst->thisvalue);
    return TCL_OK;
  }
  if (strcmp(method,"-disown") == 0) {
    if (inst->destroy) {
      SWIG_Disown(inst->thisvalue);
    }
    inst->destroy = 0;
    return TCL_OK;
  }
  if (strcmp(method,"-delete") == 0) {
    Tcl_DeleteCommandFromToken(interp,inst->cmdtok);
    return TCL_OK;
  }
  cls_stack[cls_stack_top] = inst->classptr;
  cls_stack_bi[cls_stack_top] = -1;
  cls = inst->classptr;
  while (1) {
    bi = cls_stack_bi[cls_stack_top];
    cls = cls_stack[cls_stack_top];
    if (bi != -1) {
      if(cls->bases)
        base_name = cls->bases[bi];
      else
        base_name = 0;
      if(base_name)
        cls = (swig_class *) SWIG_TypeQuery(base_name)->clientdata;
      else
        cls = 0;
      if (cls) {
        cls_stack_bi[cls_stack_top]++;
        cls_stack_top++;
        cls_stack[cls_stack_top] = cls;
        cls_stack_bi[cls_stack_top] = -1;
        continue;
      }
    }
    if (!cls) {
      cls_stack_top--;
      if (cls_stack_top < 0) break;
      else continue;
    }
    cls_stack_bi[cls_stack_top]++;

    meth = cls->methods;
    /* Check for methods */
    while (meth && meth->name) {
      if (strcmp(meth->name,method) == 0) {
        oldarg = objv[1];
        objv[1] = inst->thisptr;
        Tcl_IncrRefCount(inst->thisptr);
        rcode = (*meth->method)(clientData,interp,objc,objv);
        objv[1] = oldarg;
        Tcl_DecrRefCount(inst->thisptr);
        return rcode;
      }
      meth++;
    }
    /* Check class methods for a match */
    if (strcmp(method,"cget") == 0) {
      if (objc < 3) {
        SWIG_Tcl_SetResultFromConstString(interp, "wrong # args.", TCL_STATIC);
        return TCL_ERROR;
      }
      attrname = Tcl_GetStringFromObj(objv[2],NULL);
      attr = cls->attributes;
      while (attr && attr->name) {
        if ((strcmp(attr->name, attrname) == 0) && (attr->getmethod)) {
          oldarg = objv[1];
          objv[1] = inst->thisptr;
          Tcl_IncrRefCount(inst->thisptr);
          rcode = (*attr->getmethod)(clientData,interp,2, objv);
          objv[1] = oldarg;
          Tcl_DecrRefCount(inst->thisptr);
          return rcode;
        }
        attr++;
      }
      if (strcmp(attrname, "-this") == 0) {
        Tcl_SetObjResult(interp, Tcl_DuplicateObj(inst->thisptr));
        return TCL_OK;
      }
      if (strcmp(attrname, "-thisown") == 0) {
        if (SWIG_Thisown(inst->thisvalue)) {
          SWIG_Tcl_SetResultFromConstString(interp,"1",TCL_STATIC);
        } else {
          SWIG_Tcl_SetResultFromConstString(interp,"0",TCL_STATIC);
        }
        return TCL_OK;
      }
    } else if (strcmp(method, "configure") == 0) {
      int i;
      if (objc < 4) {
        SWIG_Tcl_SetResultFromConstString(interp, "wrong # args.", TCL_STATIC);
        return TCL_ERROR;
      }
      i = 2;
      while (i < objc) {
        attrname = Tcl_GetStringFromObj(objv[i],NULL);
        attr = cls->attributes;
        while (attr && attr->name) {
          if ((strcmp(attr->name, attrname) == 0) && (attr->setmethod)) {
            oldarg = objv[i];
            objv[i] = inst->thisptr;
            Tcl_IncrRefCount(inst->thisptr);
            rcode = (*attr->setmethod)(clientData,interp,3, &objv[i-1]);
            objv[i] = oldarg;
            Tcl_DecrRefCount(inst->thisptr);
            if (rcode != TCL_OK) return rcode;
            numconf += 2;
          }
          attr++;
        }
        i+=2;
      }
    }
  }
  if (strcmp(method,"configure") == 0) {
    if (numconf >= objc) {
      return TCL_OK;
    } else {
      SWIG_Tcl_SetResultFromConstString(interp,"Invalid attribute name.", TCL_STATIC);
      return TCL_ERROR;
    }
  }
  if (strcmp(method,"cget") == 0) {
      SWIG_Tcl_SetResultFromConstString(interp, "Invalid attribute name.", TCL_STATIC);
      return TCL_ERROR;
  }

  SWIG_Tcl_SetResultFromConstString(interp, "Invalid method. Must be one of: configure cget -acquire -disown -delete", TCL_STATIC);
  cls = inst->classptr;
  bi = 0;
  while (cls) {
    meth = cls->methods;
    while (meth && meth->name) {
      SWIG_TCL_CONST84 char *cr = (SWIG_TCL_CONST84 char *) Tcl_GetStringResult(interp);
      if (!strstr(strchr(cr,':'), meth->name))
        Tcl_AppendElement(interp, meth->name);
      meth++;
    }
    if(inst->classptr->bases) {
      base_name = inst->classptr->bases[bi++];
    }
    else {
      base_name = 0;
      bi++;
    }
    if(base_name)
      cls = (swig_class *) SWIG_TypeQuery(base_name)->clientdata;
    else
      cls = 0;
  }
  return TCL_ERROR;
}

/* Function to create objects */
SWIGRUNTIME(int)
SWIG_Tcl_ObjectConstructor(ClientData clientData, Tcl_Interp *interp, int objc, Tcl_Obj *const objv[]) {
    Tcl_Obj          *newObj = 0;
    void             *thisvalue = 0;
    swig_instance   *newinst = 0;
    swig_class      *classptr = (swig_class *) clientData;
    swig_wrapper     cons = 0;
    char             *name = 0;
    int               firstarg = 0;
    int               thisarg = 0;
    int               destroy = 1;

    if (!classptr) {
      SWIG_Tcl_SetResultFromConstString(interp, "swig: internal runtime error. No class object defined.", TCL_STATIC);
      return TCL_ERROR;
    }
    cons = classptr->constructor;
    if (objc > 1) {
      char *s = Tcl_GetStringFromObj(objv[1],NULL);
      if (strcmp(s,"-this") == 0) {
        thisarg = 2;
        cons = 0;
      } else if (strcmp(s,"-args") == 0) {
        firstarg = 1;
      } else if (objc == 2) {
        firstarg = 1;
        name = s;
      } else if (objc >= 3) {
        char *s1;
        name = s;
        s1 = Tcl_GetStringFromObj(objv[2],NULL);
        if (strcmp(s1,"-this") == 0) {
          thisarg = 3;
          cons = 0;
        } else {
          firstarg = 1;
        }
      }
    }
    if (cons) {
      int result;
      result = (*cons)(0, interp, objc-firstarg, &objv[firstarg]);
      if (result != TCL_OK) {
        return result;
      }
      newObj = Tcl_DuplicateObj(Tcl_GetObjResult(interp));
      if (!name) name = Tcl_GetStringFromObj(newObj,NULL);
    } else if (thisarg > 0) {
      if (thisarg < objc) {
        destroy = 0;
        newObj = Tcl_DuplicateObj(objv[thisarg]);
        if (!name) name = Tcl_GetStringFromObj(newObj,NULL);
      } else {
        SWIG_Tcl_SetResultFromConstString(interp, "wrong # args.", TCL_STATIC);
        return TCL_ERROR;
      }
    } else {
      SWIG_Tcl_SetResultFromConstString(interp, "No constructor available.", TCL_STATIC);
      return TCL_ERROR;
    }
    if (SWIG_Tcl_ConvertPtr(interp,newObj, (void **) &thisvalue, *(classptr->type), SWIG_POINTER_EXCEPTION) == TCL_ERROR) {
      Tcl_DecrRefCount(newObj);
      return TCL_ERROR;
    }
    newinst = (swig_instance *) malloc(sizeof(swig_instance));
    newinst->thisptr = newObj;
    Tcl_IncrRefCount(newObj);
    newinst->thisvalue = thisvalue;
    newinst->classptr = classptr;
    newinst->destroy = destroy;
    if (destroy) {
      SWIG_Acquire(thisvalue);
    }
    newinst->cmdtok = Tcl_CreateObjCommand(interp,name, (swig_wrapper) SWIG_MethodCommand, (ClientData) newinst, (swig_delete_func) SWIG_ObjectDelete);
    return TCL_OK;
}


/* This function takes the current result and turns it into an object command */
SWIGRUNTIME(Tcl_Obj *)
SWIG_Tcl_NewInstanceObj(Tcl_Interp *interp, void *thisvalue, swig_type_info *type, int flags) {
  Tcl_Obj *robj = SWIG_NewPointerObj(thisvalue, type,0);
  /* Check to see if this pointer belongs to a class or not */
  if ((type->clientdata) && (interp)) {
    Tcl_CmdInfo    ci;
    char          *name  = Tcl_GetStringFromObj(robj,NULL);
    if (!Tcl_GetCommandInfo(interp,name, &ci) || (flags)) {
      swig_instance *newinst = (swig_instance *) malloc(sizeof(swig_instance));
      newinst->thisptr = Tcl_DuplicateObj(robj);
      Tcl_IncrRefCount(newinst->thisptr);
      newinst->thisvalue = thisvalue;
      newinst->classptr = (swig_class *) type->clientdata;
      newinst->destroy = flags;
      newinst->cmdtok = Tcl_CreateObjCommand(interp, Tcl_GetStringFromObj(robj,NULL), (swig_wrapper_func) SWIG_MethodCommand, (ClientData) newinst, (swig_delete_func) SWIG_ObjectDelete);
      if (flags) {
        SWIG_Acquire(thisvalue);
      }
    }
  }
  return robj;
}

#endif

/* Structure for command table */
typedef struct {
  SWIG_TCL_CONST84 char *name;
  int       (*wrapper)(ClientData, Tcl_Interp *, int, Tcl_Obj *const []);
  ClientData  clientdata;
} swig_command_info;

/* Structure for variable linking table */
typedef struct {
  SWIG_TCL_CONST84 char *name;
  void *addr;
  char * (*get)(ClientData, Tcl_Interp *, char *, char *, int);
  char * (*set)(ClientData, Tcl_Interp *, char *, char *, int);
} swig_var_info;


/* Contract support */

#define SWIG_contract_assert(expr, msg)  if (!(expr)) { SWIG_Tcl_SetResultFromConstString(interp, msg, TCL_STATIC ); goto fail; } else

#ifdef __cplusplus
}
#endif




