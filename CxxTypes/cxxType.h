/*=========================================================================

  Program:   Insight Segmentation & Registration Toolkit
  Module:    cxxType.h
  Language:  C++
  Date:      $Date$
  Version:   $Revision$

Copyright (c) 2001 Insight Consortium
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice,
   this list of conditions and the following disclaimer.

 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

 * The name of the Insight Consortium, nor the names of any consortium members,
   nor of any contributors, may be used to endorse or promote products derived
   from this software without specific prior written permission.

  * Modified source versions must be plainly marked as such, and must not be
    misrepresented as being the original software.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS ``AS IS''
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

=========================================================================*/
#ifndef _cxxType_h
#define _cxxType_h

#include "cxxTypes.h"

namespace _cxx_
{

class CvQualifiedType;

/**
 * Abstract interface to a C++ type representation.
 */
class _cxx_EXPORT Type
{
public:
  /**
   * Retrieve what kind of Type this is.
   */
  virtual RepresentationType GetRepresentationType() const = 0;
  virtual bool IsTypedefType() const;
  
  /*@{
   * Quick type representation test.
   */     
  bool IsArrayType() const           { return this->GetRepresentationType() == ArrayType_id; }
  bool IsClassType() const           { return this->GetRepresentationType() == ClassType_id; } 
  bool IsFunctionType() const        { return this->GetRepresentationType() == FunctionType_id; }
  bool IsFundamentalType() const     { return this->GetRepresentationType() == FundamentalType_id; }
  bool IsPointerType() const         { return this->GetRepresentationType() == PointerType_id; }
  bool IsPointerToMemberType() const { return this->GetRepresentationType() == PointerToMemberType_id; }
  bool IsReferenceType() const       { return this->GetRepresentationType() == ReferenceType_id; }
  bool IsEitherPointerType() const   { return (this->IsPointerType() || this->IsPointerToMemberType()); }
  //@}
  
  virtual const Type* Id() const;  
  virtual CvQualifiedType GetCvQualifiedType(bool, bool) const;

  /**
   * Get the name of the type.
   */
  String Name() const;
  String CvName(bool isConst, bool isVolatile) const;

  virtual String GenerateName(const String& indirection,
                              bool isConst, bool isVolatile) const =0;
  
protected:
  Type() {}
  virtual ~Type() {}
  String GetLeftCvString(bool isConst, bool isVolatile) const;
  String GetRightCvString(bool isConst, bool isVolatile) const;
};


/**
 * An exception of this type is thrown when a representation's
 * SafeDownCast fails.
 */
class TypeDownCastException
{
public:
  TypeDownCastException(RepresentationType from, RepresentationType to);
  TypeDownCastException(const Type* from, RepresentationType to);
  
  String GetMessage() const;
private:
  RepresentationType m_From;
  RepresentationType m_To;
};

  
} // namespace _cxx_

#endif
