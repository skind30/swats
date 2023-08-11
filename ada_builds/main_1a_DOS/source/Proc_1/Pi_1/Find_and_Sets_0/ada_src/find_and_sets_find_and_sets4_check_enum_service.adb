--*************************************************************************************
--*                            UNCLASSIFIED                                           *
--*************************************************************************************
--*                            BAE SYSTEMS PROPRIETARY                                *
--*************************************************************************************
--*          Export Control Restrictions: NONE                                        *
--*************************************************************************************
--*                                                                                   *
--*               Copyright 2023 BAE Systems. All Rights Reserved.                    *
--*                                                                                   *
--*************************************************************************************
--*                                                                                   *
--* No contract-specific restrictions are in place for this code-generated file.      *
--*                                                                                   *
--*************************************************************************************
--*                                                                                   *
--* File Name:               Find_and_Sets4_Check_Enum_Service.adb
--* Drawing Number:          Refer to release documentation                           *
--* Version:                 As detailed by Configuration Management System           *
--* Version Date:            As detailed by Configuration Management System           *
--* Creation Date:           As detailed by Configuration Management System           *
--* Section/Unit:            Refer to release documentation                           *
--* Description              
--*                          Not Defined
--* Comments:                Header written by ASL Translator
--*                                                                                   *
--*************************************************************************************
--*                            SUPPLEMENTAL INFORMATION                               *
--*                            ------------------------                               *
--*  OVERVIEW                                                                         *
--*  --------                                                                         *
--*
--*  ERROR HANDLING                                                                   *
--*  --------------                                                                   *
--*  None                                                                             *
--*                                                                                   *
--*  SAFETY         : None                                                            *
--*  ------                                                                           *
--*                                                                                   *
--*  BUILD INFORMATION                                                                *
--*  -----------------                                                                *
--*                                                                                   *
--* Domain Name              : Find_and_Sets
--* Domain Key Letter        : Find_and_Sets
--* Domain Version           : 0
--*                                                                                   *
--*  Build Target       : Dos
--*  Clock Type         : INTERNAL
--*  Debugging is       : Off
--*  Trace is           : Off
--
-- with list for all objects, relationships, services and types used within this code fragment

-- List of domain types used
with Find_and_Sets_Domain_Types;
use type Find_and_Sets_Domain_Types.New_Enum_Type;

with Application_Types;
use type Application_Types.Base_Integer_Type;

with Root_Object;
use type Root_Object.Object_Access;


package body Find_and_Sets_Find_and_Sets4_Check_Enum_Service is
   
   procedure Find_and_Sets_Find_and_Sets4_Check_Enum (
      The_Input_Value  : in     Find_and_Sets_Domain_Types.New_Enum_Type;
      The_Return_Value :    out Application_Types.Base_Integer_Type) is
      
   begin
   -- start of Find_and_Sets4_Check_Enum
      
      case The_Input_Value is
         when Find_and_Sets_Domain_Types.Sly =>
            The_Return_Value := 41;
         
         when Find_and_Sets_Domain_Types.Sandy =>
            The_Return_Value := 42;
         
         when Find_and_Sets_Domain_Types.Wes =>
            The_Return_Value := 43;
         
         when others =>
            The_Return_Value := -41;
            
         
      end case;
      
      
   end Find_and_Sets_Find_and_Sets4_Check_Enum;
   
end Find_and_Sets_Find_and_Sets4_Check_Enum_Service;

--
-- End of file Find_and_Sets_Find_and_Sets4_Check_Enum_Service.adb
--
