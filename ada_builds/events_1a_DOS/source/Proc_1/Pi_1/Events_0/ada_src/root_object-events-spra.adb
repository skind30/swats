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
--* File Name:               r.Events.SprA.adb
--* Drawing Number:          Refer to release documentation                           *
--* Version:                 As detailed by Configuration Management System           *
--* Version Date:            As detailed by Configuration Management System           *
--* Creation Date:           As detailed by Configuration Management System           *
--* Section/Unit:            Refer to release documentation                           *
--* Description:             
--*                          Domain body Root_Object.EventsSprA
--* Comments:                Header written by header.macro                           *
--*                           
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
--* -----------------                                                                 *
--*                                                                                   *
--*  Project Key Letter : TSV2
--*  Project Version    : 0
--*  Build Set          : 0
--*                                                                                   *
--*  Build Target       : Dos
--*  Clock Type         : INTERNAL
--*  Debugging is       : Off
--*  Trace is           : Off
--*                                                                                   *
--*  
--*  
--*  
--*  
--*  
--*************************************************************************************
--  COMPONENTS CONTAINED WITHIN THIS FILE
--  ----------------------------------
--  package Root_Object.<Domain_Key_Letter>.<Object.Object_Key_Letter>
--    procedure Polymorphic_Put
--    function Get_<Attribute.Attribute_Name>
--    procedure Put_<Attribute.Attribute_Name>
--    function Get_<Simple_Relationship.Relationship_No>_<Simple_Relationship.Far_End.Ooa_End>
--    procedure Put_<Simple_Relationship.Relationship_No>_<Simple_Relationship.Far_End.Ooa_End>
--    function Get_<Supertype_Relationship.Relationship_No>_Sub
--    procedure Put_<Supertype_Relationship.Relationship_No>_Sub
--    function Get_<Subtype_Relationship.Relationship_No>_Super
--    procedure Put_<Subtype_Relationship.Relationship_No>_Super
--    function Get_State
--    procedure Put_State
--    procedure Description
--    function Create
--    procedure Delete
--    function Count_Of
--    procedure Find
--    function Return_List
--    procedure Process_Event_Queue
--    procedure Get_Class_Size
--    function Size_Of
--
--
--  MODIFICATION RECORD
--  --------------------
--     NAME     DATE             ECR No            MODIFICATION
--
--    jmm     14/06/99        QAR barrp07       Additional adatest ignore_on/off
--
--    jmm     02/11/99        008243/9SR056     Addition of create unique
--
--    jmm     08/11/99        QAR beatd53       Make instance delete operation return a null pointer
--
--    jmm     13/03/00        008932/9SR056     Add additional test for state action procedure parameters
--                                              being a structure set, and make them of mode 'in out' to
--                                              enable deletion.
--
--    jmm     27/06/00        PILOT_0000_0421   Change to execute polymorphic events in the correct sequence
--                                              when generated from a chain of supertype events-to-self
--
--    jmm     28/06/00        PILOT_0000_0422   Include new test for initialisation of 1-M relationship to avoid
--                                              unconditionally creating a new list when the object is pulled off
--                                              the free list. In this case, a list has already been created, and
--                                              further creates lead to a memory leak.
--
--    jmm     28/06/00        PILOT_0000_0423   Include diagnostic references.
--
--    jmm     07/07/00        PILOT_0000_0447   Include update of event counters for deleted object instances.
--
--    jmm     17/08/00        PILOT_0000_0600   Changes for issue 3.0.0 in accordance with ATN_037_03_01.
--
--    jmm     15/12/00        PILOT_0000_0771   Make instance array size a constant which results in the data
--                                              being allocated statically.
--
--    jmm     26/01/01        PILOT_0000_0844   Code which should have been commented out was left in.
--                            PILOT_0000_0891
--
--    jmm     31/01/01        010340/9SR056     Changes for issue 3.0.1 in accordance with SRLE/TS/TSD/skind045.
--
--    jmm     31/05/01        PILOT_0000_1227   Changes for issue 4.0.0 in accordance with SRLE/TS/TSD/skind045.
--
--    db      13/06/01        PILOT_0000_1147   Replace ADATest directives around Create functions.
--
--    db      27/06/01        PILOT_0000_0245   Really delete an instance handle when asked to.
--
--    db      11/07/01        PILOT_0000_0236   Remove referential attribute generation
--                            PILOT_0000_0230   Coding Standards transgressions
--
--    db      08/08/01        PILOT_0000_1416   Debug only code added.
--
--    db      07/02/02        SRLE100002636     Fix create procedure such that if the object created has
--                                              come from the free list, the attributes are defaulted.
--
--    db      08/02/02        SRLE100002578     Add adatest ignore directives around the event action procedure.
--
--    db      11/02/02        SRLE100002577     Remove Event_Scope_Lower and _Higher operations and
--                                              replace them with Event_Count_Scope.
--
--    db      18/03/02        SRLE100002754     Simplification of withing statements.
--
--    db      26/03/02        SRLE100002907     Remove initialise_list 
--
--    db      28/04/02        SRLE100002926     Static objects mean no delete operation provided.
--
--    db      16/05/02        SRLE100003001     Remove Update_Target and Process_Events procedures
--                                              Update generate conditions for dkl.okl.state_number separate
--
--    db      20/05/02        SRLE100003171     Add adatest directives
--
--    db      20/06/02        SRLE100003005     Remove Create_Unique generation for objects that do not have
--                                              non-referential identifiers.
--
--    db      10/07/02        SRLE100000221     Remove Current_State attribute for passive objects
--
--    db      16/07/02        SRLE100000240     Rename Get_Next_<something> function to avoid any unpleasantness 
--                                              with an attribute called Next_<something> as a preferred identifier.
--
--    db      30/07/02        SRLE100003576     Remove defaulting for Static creates.
--   
--    db      31/10/02        SRLE100003959     Remove Event_Count_Scope.
--
--    db      31/10/02        SRLE100003865     Remove 'with' statements to subtype objects 
--                                              when this is a supertype object
--
--    db      10/11/02        SRLE100003876     Differentiate between initilaised array tagged and 
--                                              non-initilaised array tagged objects
--
--    ANF     04/07/06        001798 9SR056     Archetype language reformatted
--
-- **************************************************************************************
--
-- OOA Environment
--
with Events_Rel_R13;
with Events_Rel_R14;
with Events_Rel_R6;
with Timer;

--
------------------------------------------------------------------------
--
package body Root_Object.Events.SprA is
--
------------------------------------------------------------------------
--***********************  OOA Environment *****************************
------------------------------------------------------------------------



   type Object_List_Header_Type is
   record
      Size        : Application_Types.Base_Integer_Type := 0;
      Max_Count   : Application_Types.Base_Integer_Type := 0;
      First_Entry : Root_Object.Object_Access := null;
   end record;

   Free_List   : Object_List_Header_Type;
   Object_List : Object_List_Header_Type;



------------------------------------------------------------------------
--*********************  Object Definition *****************************
------------------------------------------------------------------------

   idA_Value : Application_Types.Base_Integer_Type := Application_Types.Base_Integer_Type_first;
--
--ADATEST IGNORE_ON
   function Obtain_Subsequent_idA return Application_Types.Base_Integer_Type is
   begin
      idA_Value :=
         Application_Types.Base_Integer_Type'succ (idA_Value);
      return idA_Value;
   end Obtain_Subsequent_idA;

--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   function Get_idA (
      This_Object : Root_Object.Object_Access) return Application_Types.Base_Integer_Type is
   begin
       return Events_SprA_Type (This_Object.all).idA;
   end Get_idA;

--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Put_idA (
      This_Object : in Root_Object.Object_Access;
      idA_Value : in Application_Types.Base_Integer_Type) is
   begin
      Events_SprA_Type (This_Object.all).idA :=
         idA_Value;
   end Put_idA;

--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   function Get_ResultA (
      This_Object: Root_Object.Object_Access) return Application_Types.Base_Integer_Type is
   begin
      return Events_SprA_Type (This_Object.all).ResultA;
   end Get_ResultA;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Put_ResultA (
      This_Object : in Root_Object.Object_Access;
      ResultA_Value : in Application_Types.Base_Integer_Type) is
   begin
      Events_SprA_Type (This_Object.all).ResultA :=
         ResultA_Value;
   end Put_ResultA;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   function Get_Reference_ID (
      This_Object: Root_Object.Object_Access) return Application_Types.Base_Integer_Type is
   begin
      return Events_SprA_Type (This_Object.all).Reference_ID;
   end Get_Reference_ID;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Put_Reference_ID (
      This_Object : in Root_Object.Object_Access;
      Reference_ID_Value : in Application_Types.Base_Integer_Type) is
   begin
      Events_SprA_Type (This_Object.all).Reference_ID :=
         Reference_ID_Value;
   end Put_Reference_ID;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   function Get_Current_State (
      This_Object: Root_Object.Object_Access) return  Object_State_Type is
   begin
      return Events_SprA_Type (This_Object.all).Current_State;
   end Get_Current_State;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Put_Current_State (
      This_Object : in Root_Object.Object_Access;
      Current_State_Value : in  Object_State_Type) is
   begin
      Events_SprA_Type (This_Object.all).Current_State :=
         Current_State_Value;
   end Put_Current_State;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------


--ADATEST IGNORE_ON
   function  Get_R13_Sub (
      This_Object: Root_Object.Object_Access) return Root_Object.Object_Access is
   begin
      return Events_SprA_Type (This_Object.all).R13_Sub;
   end Get_R13_Sub;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Put_R13_Sub (
      This_Object : in Root_Object.Object_Access;
      R13_Sub_Value : in Root_Object.Object_Access) is
   begin
      Events_SprA_Type (This_Object.all).R13_Sub :=
         R13_Sub_Value;
   end Put_R13_Sub;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   function  Get_R14_Sub (
      This_Object: Root_Object.Object_Access) return Root_Object.Object_Access is
   begin
      return Events_SprA_Type (This_Object.all).R14_Sub;
   end Get_R14_Sub;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Put_R14_Sub (
      This_Object : in Root_Object.Object_Access;
      R14_Sub_Value : in Root_Object.Object_Access) is
   begin
      Events_SprA_Type (This_Object.all).R14_Sub :=
         R14_Sub_Value;
   end Put_R14_Sub;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   function  Get_R6_Sub (
      This_Object: Root_Object.Object_Access) return Root_Object.Object_Access is
   begin
      return Events_SprA_Type (This_Object.all).R6_Sub;
   end Get_R6_Sub;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Put_R6_Sub (
      This_Object : in Root_Object.Object_Access;
      R6_Sub_Value : in Root_Object.Object_Access) is
   begin
      Events_SprA_Type (This_Object.all).R6_Sub :=
         R6_Sub_Value;
   end Put_R6_Sub;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------
------------------------------------------------------------------------
--*********************  Object Management *****************************
------------------------------------------------------------------------

--
--ADATEST IGNORE_ON
   function Create return Root_Object.Object_Access is

      This_Object: Root_Object.Object_Access := null;

   begin


      --
      if Free_List.First_Entry = null then
         This_Object := new Events_SprA_Type;
   
      else
         This_Object := Free_List.First_Entry;
         Events_SprA_Type(This_Object.all).idA := Application_Types.Base_Integer_Type_First;
         Events_SprA_Type(This_Object.all).ResultA := Application_Types.Base_Integer_Type_First;
         Events_SprA_Type(This_Object.all).Reference_ID := Application_Types.Base_Integer_Type_First;
         Events_SprA_Type(This_Object.all).Current_State :=  Object_State_Type_First;
         Free_List.First_Entry := Free_List.First_Entry.Next_Object;
      end if;

      --
      -- connect the new instance into the class set
      --
      This_Object.Next_Object := Object_List.First_Entry;

      if Object_List.First_Entry /= null then
         Object_List.First_Entry.Previous_Object := This_Object;
      end if;

      This_Object.Previous_Object := null;
      Object_List.First_Entry := This_Object;
      --
      -- and increment the size of the store
      --
      Object_List.Size := Object_List.Size + 1;
      --

      if Object_List.Size > Object_List.Max_Count then
         Object_List.Max_Count := Object_List.Size;
      end if;
      --
      -- set up the attributes as necessary
      --
      This_Object.Root_Object_Attribute := Root_Object.Get_Next_Root_Object_Attribute;
      --


      return This_Object;

   end Create;
--ADATEST IGNORE_OFF
--
--------------------------------------------------------------------------
--

--ADATEST IGNORE_ON
   function Create_Unique return Root_Object.Object_Access is

   This_Object: Root_Object.Object_Access;

   begin
      --
      -- get hold of a new instance
      --
      This_Object := Create;


      Events_SprA_Type(This_Object.all).idA :=
         Obtain_Subsequent_idA;

      return This_Object;

   end Create_Unique;
--ADATEST IGNORE_OFF
--------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Count_Of (
      Instance_Count     :    out Application_Types.Base_Integer_Type;
      Max_Instance_Count :    out Application_Types.Base_Integer_Type) is

   begin
      Instance_Count     := Object_List.Size;
      Max_Instance_Count := Object_List.Max_Count;
   end Count_Of;
--ADATEST IGNORE_OFF

--------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Find (Add_To : in out Root_Object.Object_List.List_Header_Access_Type) is
      Temp_Instance: Root_Object.Object_Access;

   begin
      
      Temp_Instance := Object_List.First_Entry;

      while Temp_Instance /= null loop

         Root_Object.Object_List.Insert (
            New_Item => Temp_Instance,
            On_To    => Add_To );

         Temp_Instance := Temp_Instance.Next_Object;

      end loop;

   end Find;

--ADATEST IGNORE_OFF

--------------------------------------------------------------------------

--ADATEST IGNORE_ON
   function Return_List return Root_Object.Object_Access is

   begin
      return Object_List.First_Entry;
   end Return_List;

--ADATEST IGNORE_OFF

---------------------------------------------------------------------

   procedure Delete (Old_Instance : in out Root_Object.Object_Access) is

   begin

      if Old_Instance.Previous_Object = null then -- first in list

         Object_List.First_Entry := Old_Instance.Next_Object;

         if Old_Instance.Next_Object /= null then -- but not last in list
            Old_Instance.Next_Object.Previous_Object := Old_Instance.Previous_Object;
         end if;

      else -- Old_Instance.Previous_Object <> null -- not first in list

         Old_Instance.Previous_Object.Next_Object := Old_Instance.Next_Object;

         if Old_Instance.Next_Object /= null then -- and not last in list either
            Old_Instance.Next_Object.Previous_Object := Old_Instance.Previous_Object;
         end if;

      end if;

      Object_List.Size := Object_List.Size - 1;
      --
      Old_Instance.Next_Object := Free_List.First_Entry;

      Free_List.First_Entry := Old_Instance;
      --
      Old_Instance := null;



   end Delete;


----------------------------------------------------------------------------


------------------------------------------------------------------------
------------------------------------------------------------------------
--*****************  Code imported from actions child ******************
------------------------------------------------------------------------

   type Event_Matrix_Access_Type is access
      procedure (
         This_Instance : in out Root_Object.Object_Access;
         This_Event    : in     Root_Object.Root_Event_Access_Type);
--
   type Event_Dispatch_Matrix_Type is array (Event_Class, Object_State_Type) of Event_Matrix_Access_Type;

------------------------------------------------------------------------
------------------------------------------------------------------------

   procedure Ignore_Action (
      This_Instance : in out Root_Object.Object_Access;
      This_Event    : in     Root_Object.Root_Event_Access_Type) is

   begin
      null;
   end Ignore_Action;
------------------------------------------------------------------------

   This_Event_Dispatch_Matrix : Event_Dispatch_Matrix_Type := (
      others      => (others => Ignore_Action'access));

------------------------------------------------------------------------

   procedure Unknown_Action (
      This_Instance : in out Root_Object.Object_Access;
      This_Event    : in     Root_Object.Root_Event_Access_Type)
   renames Ignore_Action;

   procedure Cannot_Happen_Action  (
      This_Instance : in out Root_Object.Object_Access;
      This_Event    : in     Root_Object.Root_Event_Access_Type)
   renames Ignore_Action;

   procedure Meaningless_Action  (
      This_Instance : in out Root_Object.Object_Access;
      This_Event    : in     Root_Object.Root_Event_Access_Type)
   renames Ignore_Action;

--
-- STATE ACTIONS
--

   procedure Events_SprA_3 (
      Test : in Application_Types.Base_Integer_Type;
      This_Instance : in out Root_Object.Object_Access ) is separate;

   procedure Events_SprA_2 (
      This_Instance : in out Root_Object.Object_Access ) is separate;

   procedure Events_SprA_1 (
      Test : in Application_Types.Base_Integer_Type;
      This_Instance : in out Root_Object.Object_Access ) is separate;

   procedure Events_SprA_5 (
      Test : in Application_Types.Base_Integer_Type;
      This_Instance : in out Root_Object.Object_Access ) is separate;


--
   procedure SprA2_To_Verify_Migration (
      This_Instance : in out Root_Object.Object_Access;
      This_Event    : in     Root_Object.Root_Event_Access_Type) is

   begin

      Events_SprA_Type (This_Instance.all).Current_State := 
         Root_Object.Events.SprA.Object_State_Type(Verify_Migration);

      Events_SprA_3 (
         Test =>  Events_SprA2(This_Event.all).Test,
         This_Instance => This_Instance );

   end SprA2_To_Verify_Migration;
--
   procedure SprA3_To_Fail (
      This_Instance : in out Root_Object.Object_Access;
      This_Event    : in     Root_Object.Root_Event_Access_Type) is

   begin

      Events_SprA_Type (This_Instance.all).Current_State := 
         Root_Object.Events.SprA.Object_State_Type(Fail);

      Events_SprA_2 (
         This_Instance => This_Instance );

   end SprA3_To_Fail;
--
   procedure SprA4_To_Wait_Here (
      This_Instance : in out Root_Object.Object_Access;
      This_Event    : in     Root_Object.Root_Event_Access_Type) is

   begin

      Events_SprA_Type (This_Instance.all).Current_State := 
         Root_Object.Events.SprA.Object_State_Type(Wait_Here);

      Events_SprA_1 (
         Test =>  Events_SprA4(This_Event.all).Test,
         This_Instance => This_Instance );

   end SprA4_To_Wait_Here;
--
   procedure SprA1_To_Wait_Here (
      This_Instance : in out Root_Object.Object_Access;
      This_Event    : in     Root_Object.Root_Event_Access_Type) is

   begin

      Events_SprA_Type (This_Instance.all).Current_State := 
         Root_Object.Events.SprA.Object_State_Type(Wait_Here);

      Events_SprA_1 (
         Test =>  Events_SprA1(This_Event.all).Test,
         This_Instance => This_Instance );

   end SprA1_To_Wait_Here;
--
   procedure SprA5_To_Migrate (
      This_Instance : in out Root_Object.Object_Access;
      This_Event    : in     Root_Object.Root_Event_Access_Type) is

   begin

      Events_SprA_Type (This_Instance.all).Current_State := 
         Root_Object.Events.SprA.Object_State_Type(Migrate);

      Events_SprA_5 (
         Test =>  Events_SprA5(This_Event.all).Test,
         This_Instance => This_Instance );

   end SprA5_To_Migrate;


------------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Event_Action (
      Dispatch_Event : in     Events_SprA_Event_Type;
      This_Event     : in out Root_Object.Root_Event_Access_Type) is

   begin
     null;
   end Event_Action;
--ADATEST IGNORE_OFF

------------------------------------------------------------------------
--
   procedure Event_Action (
      Dispatch_Event : in     Events_SprA_Instance_Event_Type;
      This_Event     : in out Root_Object.Root_Event_Access_Type) is separate;

----------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Push (Event  : in Root_Object.Root_Event_Access_Type;
                   To_Top : in BOOLEAN := FALSE) is
   begin

      Events_SprA_Event_Queue.Push (
         Item        => Event,
         Target_FIFO => Events_SprA_Queue,
         Top         => To_Top);

   end Push;
--ADATEST IGNORE_OFF

----------------------------------------------------------------------

--ADATEST IGNORE_ON
   function Pop return Root_Object.Root_Event_Access_Type is

      Temp_Event : Root_Object.Root_Event_Access_Type;

   begin

      Events_SprA_Event_Queue.Pop (
         Item        => Temp_Event,
         Target_FIFO => Events_SprA_Queue);

      return Temp_Event;

   end Pop;
--ADATEST IGNORE_OFF

----------------------------------------------------------------------

--ADATEST IGNORE_ON
   function Count return natural is
   begin

      return Events_SprA_Event_Queue.Queue_Length (Events_SprA_Queue);

   end Count;
--ADATEST IGNORE_OFF

----------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Process_Queue is

      Popped_Event: Root_Object.Root_Event_Access_Type;

   begin

      while Count > 0 loop

         Popped_Event := Pop;

         Event_Action (
            Dispatch_Event => Popped_Event.all,
            This_Event     => Popped_Event);

      end loop;

   end Process_Queue;
--ADATEST IGNORE_OFF

----------------------------------------------------------------------

--ADATEST IGNORE_ON
   procedure Put_Event (
      Event    : in Root_Object.Root_Event_Access_Type;
      To_Class : in Events_SprA_Type;
      Top      : in BOOLEAN := FALSE) is

   begin

      Push (Event => Event);

   end Put_Event;
--ADATEST IGNORE_OFF

----------------------------------------------------------------------

begin
   null;
--
-- STATE TRANSITION TABLE, elaboration
--
   This_Event_Dispatch_Matrix (SprA1, Non_Existent) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA2, Non_Existent) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA3, Non_Existent) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA4, Non_Existent) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA5, Non_Existent) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA6, Non_Existent) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA1, Wait_Here) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA2, Wait_Here) := SprA2_To_Verify_Migration'access;
   This_Event_Dispatch_Matrix (SprA3, Wait_Here) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA4, Wait_Here) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA5, Wait_Here) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA6, Wait_Here) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA1, Fail) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA2, Fail) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA3, Fail) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA4, Fail) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA5, Fail) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA6, Fail) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA1, Verify_Migration) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA2, Verify_Migration) :=  Cannot_Happen_Action'access;
   This_Event_Dispatch_Matrix (SprA3, Verify_Migration) := SprA3_To_Fail'access;
   This_Event_Dispatch_Matrix (SprA4, Verify_Migration) := SprA4_To_Wait_Here'access;
   This_Event_Dispatch_Matrix (SprA5, Verify_Migration) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA6, Verify_Migration) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA1, Migrate) := SprA1_To_Wait_Here'access;
   This_Event_Dispatch_Matrix (SprA2, Migrate) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA3, Migrate) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA4, Migrate) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA5, Migrate) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA6, Migrate) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA1, Idle) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA2, Idle) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA3, Idle) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA4, Idle) :=  Ignore_Action'access;
   This_Event_Dispatch_Matrix (SprA5, Idle) := SprA5_To_Migrate'access;
   This_Event_Dispatch_Matrix (SprA6, Idle) :=  Ignore_Action'access;

end Root_Object.Events.SprA;
