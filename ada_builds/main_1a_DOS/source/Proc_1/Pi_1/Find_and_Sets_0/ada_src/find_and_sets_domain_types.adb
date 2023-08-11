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
--* File Name:               Find_and_Sets_domain_types.adb
--* Drawing Number:          Refer to release documentation                           *
--* Version:                 As detailed by Configuration Management System           *
--* Version Date:            As detailed by Configuration Management System           *
--* Creation Date:           As detailed by Configuration Management System           *
--* Section/Unit:            Refer to release documentation                           *
--* Description:             
--*                          Type-specific operations on Domain Data Structure Types
--* Comments:                Header written by header.macro                           *
--*                           
--*                                                                                   *
--*************************************************************************************
--*                            SUPPLEMENTAL INFORMATION                               *
--*                            ------------------------                               *
--*  OVERVIEW                                                                         *
--*  --------                                                                         *
--*  This archetype provides operations on structures defined for this domain
--*  This package body is conditionally generated for domains containing structures only. 
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
--*  COMPONENTS CONTAINED WITHIN THIS FILE                                            *
--*  package body Find_and_Sets_Domain_Types 
--*
--*************************************************************************************
--  MODIFICATION RECORD
--  --------------------
--     NAME     DATE             ECR No            MODIFICATION
--
--    jmm     13/03/00        008932/9SR056     Add tests and definitions for structures and sets of structures.
--
--    jmm     05/07/00        PILOT_0000_0381   Rework structures as controlled types.
--
--    jmm     05/07/00        PILOT_0000_0446   Remove dummy procedure Number_Of_Navigates and replace by pragma 
--                                              Elaborate_Body in package spec.
--
--    jmm     03/10/00        PILOT_0000_0600   Changes for issue 3.0.0 in accordance with ATN_037_03_01.
--
--    jmm     26/01/01        PILOT_0000_0714   Extra checks made to enable copy of null structures.
--
--    db      04/07/01        PILOT_0000_0231   Rename package filename to match package definition.
--
--    db      15/03/02        SRLE100002863     Conditionally generate only if Structures 
--                                              exist in this domain.
--
--    db      12/04/02        SRLE100001553     Default values corrected
--
--    ANF     04/07/06        001798 9SR056     Archetype language reformatted
--
-- **************************************************************************************
--

with Ada.Unchecked_Deallocation;

package body Find_and_Sets_Domain_Types is

   procedure Initialize (Object: in out Simple_Structure_Type) is

   begin
   
      Object.Iterator    := new Simple_Structure_Type_Node_Access;
      Object.First_Entry := null;
      Object.Last_Entry  := null;

   end Initialize;

   --------------------------------------------------------------------------------------------

   procedure Adjust (Object: in out Simple_Structure_Type) is
    
      Next:        Simple_Structure_Type_Node_Access := null;
      Header_Cell: Simple_Structure_Type_Node_Access := null;
      Last_Cell:   Simple_Structure_Type_Node_Access := null;
      New_Cell:    Simple_Structure_Type_Node_Access := null;

   begin

      if Object.First_Entry /= null then
      
         Next        := Object.First_Entry;
         Header_Cell := new Simple_Structure_Type_Node;
         Last_Cell   := Header_Cell;
      
         Header_Cell.an_integer_of_structure := Next.an_integer_of_structure;
         Header_Cell.a_real_of_structure := Next.a_real_of_structure;
         Header_Cell.some_text_of_structure := Next.some_text_of_structure;
    
         Next := Next.Next_Structure;

         while Next /= null loop

            New_Cell := new Simple_Structure_Type_Node'(
               an_integer_of_structure => Next.an_integer_of_structure,
               a_real_of_structure => Next.a_real_of_structure,
               some_text_of_structure => Next.some_text_of_structure,
               Next_Structure     => null,
               Previous_Structure => null);

            Last_Cell.Next_Structure                    := New_Cell;
            Last_Cell.Next_Structure.Previous_Structure := Last_Cell;
            Last_Cell                                   := New_Cell;
            Next                                        := Next.Next_Structure;

         end loop;

         Object.First_Entry := Header_Cell;
         Object.Last_Entry  := Last_Cell;

      end if;

      Object.Iterator := new Simple_Structure_Type_Node_Access;

   end Adjust;

   --------------------------------------------------------------------------------------------

   procedure Finalize (Object: in out Simple_Structure_Type) is

      Next:     Simple_Structure_Type_Node_Access := null;
      Old_Cell: Simple_Structure_Type_Node_Access := null;
    
      procedure Free is new Ada.Unchecked_Deallocation (
         Object => Simple_Structure_Type_Node, 
         Name   => Simple_Structure_Type_Node_Access);
        
      procedure Free is new Ada.Unchecked_Deallocation (
         Object => Simple_Structure_Type_Node_Access, 
         Name   => Simple_Structure_Type_Node_Access_Pointer);
              
   begin

      if Object.First_Entry /= null then

         Next := Object.First_Entry;

         while Next /= null loop

            Old_Cell := Next;
            Next     := Next.Next_Structure;

            Free (Old_Cell);

         end loop;

      end if;

      Free (Object.Iterator);

      Object.First_Entry := null;
      Object.Last_Entry  := null;

   end Finalize;

   -------------------------------------------------------------------------------------------

   procedure Initialize (Object: in out Complex_Structure_Type) is

   begin
   
      Object.Iterator    := new Complex_Structure_Type_Node_Access;
      Object.First_Entry := null;
      Object.Last_Entry  := null;

   end Initialize;

   --------------------------------------------------------------------------------------------

   procedure Adjust (Object: in out Complex_Structure_Type) is
    
      Next:        Complex_Structure_Type_Node_Access := null;
      Header_Cell: Complex_Structure_Type_Node_Access := null;
      Last_Cell:   Complex_Structure_Type_Node_Access := null;
      New_Cell:    Complex_Structure_Type_Node_Access := null;

   begin

      if Object.First_Entry /= null then
      
         Next        := Object.First_Entry;
         Header_Cell := new Complex_Structure_Type_Node;
         Last_Cell   := Header_Cell;
      
         Header_Cell.Number_Of_Simple_Structures := Next.Number_Of_Simple_Structures;
         Header_Cell.list_of_structures := Next.list_of_structures;
    
         Next := Next.Next_Structure;

         while Next /= null loop

            New_Cell := new Complex_Structure_Type_Node'(
               Number_Of_Simple_Structures => Next.Number_Of_Simple_Structures,
               list_of_structures => Next.list_of_structures,
               Next_Structure     => null,
               Previous_Structure => null);

            Last_Cell.Next_Structure                    := New_Cell;
            Last_Cell.Next_Structure.Previous_Structure := Last_Cell;
            Last_Cell                                   := New_Cell;
            Next                                        := Next.Next_Structure;

         end loop;

         Object.First_Entry := Header_Cell;
         Object.Last_Entry  := Last_Cell;

      end if;

      Object.Iterator := new Complex_Structure_Type_Node_Access;

   end Adjust;

   --------------------------------------------------------------------------------------------

   procedure Finalize (Object: in out Complex_Structure_Type) is

      Next:     Complex_Structure_Type_Node_Access := null;
      Old_Cell: Complex_Structure_Type_Node_Access := null;
    
      procedure Free is new Ada.Unchecked_Deallocation (
         Object => Complex_Structure_Type_Node, 
         Name   => Complex_Structure_Type_Node_Access);
        
      procedure Free is new Ada.Unchecked_Deallocation (
         Object => Complex_Structure_Type_Node_Access, 
         Name   => Complex_Structure_Type_Node_Access_Pointer);
              
   begin

      if Object.First_Entry /= null then

         Next := Object.First_Entry;

         while Next /= null loop

            Old_Cell := Next;
            Next     := Next.Next_Structure;

            Free (Old_Cell);

         end loop;

      end if;

      Free (Object.Iterator);

      Object.First_Entry := null;
      Object.Last_Entry  := null;

   end Finalize;

   -------------------------------------------------------------------------------------------

end Find_and_Sets_Domain_Types;

