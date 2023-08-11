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
--* File Name:               TT_RT_3.ada
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
--* Domain Name              : Test_Timers
--* Domain Key Letter        : TT
--* Domain Version           : 0
--*                                                                                   *
--*  Build Target       : Dos
--*  Clock Type         : INTERNAL
--*  Debugging is       : Off
--*  Trace is           : Off
--
-- with list for all objects, relationships, services and types used within this code fragment

with Timer;

with Application_Types;
use type Application_Types.Base_Integer_Type;

with Root_Object;
use type Root_Object.Object_Access;


separate(Root_Object.TT.RT)
   
   procedure TT_RT_3 (This_Instance : in out Root_Object.Object_Access) is
   
      
   begin
      
      declare
         Pushed_Event : Root_Object.Root_Event_Access_Type;
      begin
         Pushed_Event := new Root_Object.TT.RT.TT_RT2'(Root_Object.Root_Event_Type with
                             This_Event_Class => Root_Object.TT.RT.RT2,
                             Target_Instance  => This_Instance);
         Timer.Set_Timer (
            Timer_ID       => Root_Object.TT.RT.TT_RT_type(This_Instance.all).timer_id_one,
            Time_Remaining => 10,
            Granularity    => Application_Types.SECOND,
            This_Event     => Pushed_Event,
            To_Instance    => This_Instance);
      end;
      
      declare
         Pushed_Event : Root_Object.Root_Event_Access_Type;
      begin
         Pushed_Event := new Root_Object.TT.RT.TT_RT3'(Root_Object.Root_Event_Type with
                             This_Event_Class => Root_Object.TT.RT.RT3,
                             Target_Instance  => This_Instance);
         Timer.Set_Timer (
            Timer_ID       => Root_Object.TT.RT.TT_RT_type(This_Instance.all).timer_id_two,
            Time_Remaining => 5,
            Granularity    => Application_Types.SECOND,
            This_Event     => Pushed_Event,
            To_Instance    => This_Instance);
      end;
      
      Timer.Reset_Timer (Timer_ID       => Root_Object.TT.RT.TT_RT_type(This_Instance.all).timer_id_two);
      Root_Object.TT.RT.Process_Queue;
   end TT_RT_3;
   
--
-- End of file TT_RT_3.ada
--
