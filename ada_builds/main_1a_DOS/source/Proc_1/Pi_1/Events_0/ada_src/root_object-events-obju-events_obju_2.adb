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
--* File Name:               Events_objU_2.ada
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
--* Domain Name              : Events
--* Domain Key Letter        : Events
--* Domain Version           : 0
--*                                                                                   *
--*  Build Target       : Dos
--*  Clock Type         : INTERNAL
--*  Debugging is       : Off
--*  Trace is           : Off
--
-- with list for all objects, relationships, services and types used within this code fragment

-- List of bridges used
with Events_RPT1_Start_Test_Bridge;

with Application_Types;
use type Application_Types.Base_Integer_Type;
use type Application_Types.Base_Text_Type;

with Root_Object;
use type Root_Object.Object_Access;


separate(Root_Object.Events.objU)
   
   procedure Events_objU_2 (Test_Number   : in     Application_Types.Base_Integer_Type;
                            This_Instance : in out Root_Object.Object_Access) is
   
      
      temp : Application_Types.Base_Integer_Type := 1;
      
   begin
      
      -- -----------------------------------------------------------
      --  SUBTYPE
      -- -----------------------------------------------------------
      
      Events_RPT1_Start_Test_Bridge.Events_RPT1_Start_Test (
         Test_Number     => Root_Object.Events.objU.Events_objU_type(This_Instance.all).latest_test,
         Requid          => "Null Requid                     ",
         Invoking_Domain => "Events                          ",
         Invoking_Object => "objU                            ",
         Purpose         => "subtype                         ");
      
      
      -- Change the value of attribute 'ResultU'
      temp := Root_Object.Events.objU.Events_objU_type(This_Instance.all).Result_U + 555;
      
      
      Root_Object.Events.objU.Events_objU_type(This_Instance.all).Result_U := temp;
      
      
      -- -----------------------------------------------------------
      
      declare
         Pushed_Event : Root_Object.Root_Event_Access_Type;
      begin
         Pushed_Event := new
         Root_Object.Events.objU.Events_objU2'(Root_Object.Root_Event_Type with
            This_Event_Class => Root_Object.Events.objU.objU2,
            Target_Instance  => This_Instance,
            Test_Number      => Test_Number);
         
         Root_Object.Events.objU.Push (
            Event  => Pushed_Event,
            To_Top => True);
      end;
      Root_Object.Events.objU.Process_Queue;
   end Events_objU_2;
   
--
-- End of file Events_objU_2.ada
--
