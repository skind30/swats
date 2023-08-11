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
--* File Name:               TAGS_TT2_A_Tagged_Dummy_Terminator_One_Bridge.adb
--* Drawing Number:          Refer to release documentation                           *
--* Version:                 As detailed by Configuration Management System           *
--* Version Date:            As detailed by Configuration Management System           *
--* Creation Date:           As detailed by Configuration Management System           *
--* Section/Unit:            Refer to release documentation                           *
--* Description              
--*                          Dummy tagged terminator with odd param names to get around possible I-SIM e
--*                          rror
--*                          
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


package body TAGS_TT2_A_Tagged_Dummy_Terminator_One_Bridge is
   
   procedure TAGS_TT2_A_Tagged_Dummy_Terminator_One (
      Mickey_Mouse_Input_One  : in     Application_Types.Base_Integer_Type;
      Minnie_Mouse_Output_One :    out Application_Types.Base_Integer_Type) is
      
      A_Local_Value : Application_Types.Base_Integer_Type := 1;
      
   begin
   -- start of TT2_A_Tagged_Dummy_Terminator_One
      
      -- -----------------
      --  @@TAGS-01-0020 -
      -- -----------------
      A_Local_Value := 999;
      
      
      --  A_Local_Value = Mickey_Mouse_Input_One
      -- Minnie_Mouse_Output_One = A_Local_Value
      
      Minnie_Mouse_Output_One := 1;
      
      
   end TAGS_TT2_A_Tagged_Dummy_Terminator_One;
   
end TAGS_TT2_A_Tagged_Dummy_Terminator_One_Bridge;

--
-- End of file TAGS_TT2_A_Tagged_Dummy_Terminator_One_Bridge.adb
--
