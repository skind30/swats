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
--* File Name:               TAGS_UT2_An_Untagged_Project_Terminator_Bridge.adb
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
--*  Project Key Letter : Tagged_and_Bagged_Build_Set
--*  Project Version    : 0
--*  Build Set          : 0
--*                                                                                   *
--*  Build Target       : Dos
--*  Clock Type         : INTERNAL
--*  Debugging is       : Off
--*  Trace is           : Off
--
-- with list for all objects, relationships, services and types used within this code fragment

with Application_Types;
use type Application_Types.Base_Integer_Type;

with Root_Object;
use type Root_Object.Object_Access;


package body TAGS_UT2_An_Untagged_Project_Terminator_Bridge is
   
   procedure TAGS_UT2_An_Untagged_Project_Terminator (
      Incoming_Parameter_4 : in     Application_Types.Base_Integer_Type;
      Outgoing_Parameter_4 :    out Application_Types.Base_Integer_Type) is
      
      Local : Application_Types.Base_Integer_Type := 1;
      
   begin
   -- start of UT2_An_Untagged_Project_Terminator
      
      -- -----------------
      --  @@TAGS-01-0023 -
      -- -----------------
      Local                := Incoming_Parameter_4;
      Outgoing_Parameter_4 := Local;
      
      
   end TAGS_UT2_An_Untagged_Project_Terminator;
   
end TAGS_UT2_An_Untagged_Project_Terminator_Bridge;

--
-- End of file TAGS_UT2_An_Untagged_Project_Terminator_Bridge.adb
--
