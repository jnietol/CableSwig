/*=========================================================================

  Program:   CABLE - CABLE Automates Bindings for Language Extension
  Module:    ctFunctionBase.cxx
  Language:  C++
  Date:      $Date$
  Version:   $Revision$

  Copyright (c) 2002 Kitware, Inc., Insight Consortium.  All rights reserved.
  See Copyright.txt for details.

     This software is distributed WITHOUT ANY WARRANTY; without even 
     the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
     PURPOSE.  See the above copyright notices for more information.

=========================================================================*/
#include "ctFunctionBase.h"

namespace _cable_tcl_
{

/**
 * Constructor just initializes all members.  This is only called from
 * a subclass's constructor, which is only called by a generated
 * registration function.
 */
FunctionBase::FunctionBase(const String& name,
                           const ParameterTypes& parameterTypes):
  m_Name(name),
  m_ParameterTypes(parameterTypes)
{
}


/**
 * Need a virtual destructor.
 */
FunctionBase::~FunctionBase()
{
}


/**
 * Get the name of the wrapped method.
 */
const String& FunctionBase::GetName() const
{
  return m_Name;
}


/**
 * Get the number of arguments that the method takes.
 */
unsigned long FunctionBase::GetNumberOfParameters() const
{
  return m_ParameterTypes.size();
}


/**  
 * Get a reference to the vector holding the method's parameter types.
 */
const FunctionBase::ParameterTypes&
FunctionBase::GetParameterTypes() const
{
  return m_ParameterTypes;
}


/**  
 * Get a begin iterator to the method's parameter types.
 */
FunctionBase::ParameterTypes::const_iterator
FunctionBase::ParametersBegin() const
{
  return m_ParameterTypes.begin();
}


/**  
 * Get an end iterator to the method's parameter types.
 */
FunctionBase::ParameterTypes::const_iterator
FunctionBase::ParametersEnd() const
{
  return m_ParameterTypes.end();
}


} // namespace _cable_tcl_
