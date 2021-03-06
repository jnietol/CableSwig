/*=========================================================================

  Program:   CABLE - CABLE Automates Bindings for Language Extension
  Module:    cableArrayType.cxx
  Language:  C++
  Date:      $Date$
  Version:   $Revision$

  Copyright (c) 2002 Kitware, Inc., Insight Consortium.  All rights reserved.
  See Copyright.txt for details.

     This software is distributed WITHOUT ANY WARRANTY; without even 
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
     PURPOSE.  See the above copyright notices for more information.

=========================================================================*/
#include "cableArrayType.h"
#include "cxxTypeSystem.h"

namespace cable
{

//----------------------------------------------------------------------------
ArrayType::ArrayType()
{
  m_Target = 0;
}

//----------------------------------------------------------------------------
ArrayType::~ArrayType()
{
}

//----------------------------------------------------------------------------
Type::TypeIdType ArrayType::GetTypeId() const
{
  return ArrayTypeId;
}

//----------------------------------------------------------------------------
bool ArrayType::CreateCxxType(cxx::TypeSystem* ts)
{
  // Make sure we haven't already created the type.
  if(m_CxxType.GetType())
    {
    return true;
    }
  
  // Make sure there is a valid target type.
  if(!m_Target || !m_Target->CreateCxxType(ts))
    {
    cableErrorMacro("Invalid target type for ArrayType.");
    return false;
    }
  
  // Target gets the added cv-qualifiers.
  cxx::CvQualifiedType cvt = m_Target->GetCxxType();
  cxx::CvQualifiedType target = cvt.GetMoreQualifiedType(m_Const, m_Volatile);
  const cxx::ArrayType* t = ts->GetArrayType(target, m_Length);
  
  if(t)
    {
    m_CxxType = t->GetCvQualifiedType(false, false);
    return true;
    }
  else
    {
    cableErrorMacro("Couldn't create cxx::ArrayType.");
    return false;
    }
}

//----------------------------------------------------------------------------
Type* ArrayType::GetTarget() const
{
  return m_Target;
}

//----------------------------------------------------------------------------
void ArrayType::SetTarget(Type* target)
{
  m_Target = target;
}

//----------------------------------------------------------------------------
unsigned long ArrayType::GetLength() const
{
  return m_Length;
}

//----------------------------------------------------------------------------
void ArrayType::SetLength(unsigned long length)
{
  m_Length = length;
}

} // namespace cable
