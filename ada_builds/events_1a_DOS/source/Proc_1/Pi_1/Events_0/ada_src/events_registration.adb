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
--* File Name:               Events_registration.adb
--* Drawing Number:          Refer to release documentation                           *
--* Version:                 As detailed by Configuration Management System           *
--* Version Date:            As detailed by Configuration Management System           *
--* Creation Date:           As detailed by Configuration Management System           *
--* Section/Unit:            Refer to release documentation                           *
--* Description:             
--*                          Template for domain registrations 
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
--*  COMPONENTS CONTAINED WITHIN THIS FILE                                            *
--*  package body Events_Registration 
--*    procedure Register_All 
--*
--*************************************************************************************
--  MODIFICATION RECORD
--  --------------------
--     NAME     DATE             ECR No            MODIFICATION
--
--    jmm     13/03/00        008998/9SR056     Change super-sub specification name to include the domain key
--                                              letter. Note that the change locations are NOT marked in the code 
--                                              body to avoid multiple entries being generated by loops in the
--                                              final source code. Code changes can be identified using the
--                                              clearcase differences tool.
--
--    jmm     10/05/00        PILOT_0000_0460   Change order of A/B groupings for A_End_Is_Multiple/B_End_Is_Single
--                                              reflexive relationships
--
--    jmm     03/10/00        PILOT_0000_0600   Changes for issue 3.0.0 in accordance with ATN_037_03_01.
--
--    db      27/07/01        PILOT_0000_0230   Coding Standards transgressions fixed
--
--    db      21/08/01        PILOT_0000_1431   Associative A end multiple, B end single incorrect
--
--    db      07/02/02        SRLE100001428     Rename file to match package definition.
--
--    db      26/03/02        SRLE100002907     Remove invocation to Root_Object.Initialise_List and
--                                              <Domain_Key_Letter>_Rel_<Domain_Relationship.Relationship_No>.Initialise;
--
--    ANF     04/07/06        001798 9SR056     Archetype language reformatted
--
-- **************************************************************************************
with Root_Object;

with Events_Comms_Registration;

--================================================================================== 
with Root_Object.Events.objL;
with Root_Object.Events.objA;
with Root_Object.Events.objB;
with Root_Object.Events.objC;
with Root_Object.Events.objF;
with Root_Object.Events.sbD;
with Root_Object.Events.sbA;
with Root_Object.Events.objM;
with Root_Object.Events.objD;
with Root_Object.Events.objE;
with Root_Object.Events.objN;
with Root_Object.Events.objVERPOL;
with Root_Object.Events.sbE;
with Root_Object.Events.sbF;
with Root_Object.Events.objO;
with Root_Object.Events.objJ;
with Root_Object.Events.objK;
with Root_Object.Events.objP;
with Root_Object.Events.objQ;
with Root_Object.Events.objR;
with Root_Object.Events.objS;
with Root_Object.Events.objT;
with Root_Object.Events.objU;
with Root_Object.Events.REFLECT;
with Root_Object.Events.objCREATE;
with Root_Object.Events.objTERMINAL;
with Root_Object.Events.objVERCETL;
with Root_Object.Events.objEDATA;
with Root_Object.Events.SprA;
with Root_Object.Events.TD;
with Root_Object.Events.sbB;
with Root_Object.Events.sbC;
with Root_Object.Events.TL;
with Root_Object.Events.SL_ONE_A;
with Root_Object.Events.objMCS;
with Root_Object.Events.ETS;
with Root_Object.Events.BTD;
with Root_Object.Events.SL_ONE_B;
with Root_Object.Events.SL_TWO_A;
with Root_Object.Events.SL_TWO_B;
with Root_Object.Events.SL_TWO_C;
with Root_Object.Events.SL_TWO_D;
with Root_Object.Events.SL_THREE_A;
with Root_Object.Events.SL_THREE_B;
with Root_Object.Events.SL_THREE_C;
with Root_Object.Events.SL_THREE_D;
with Root_Object.Events.BLA;
with Root_Object.Events.BLB;
with Root_Object.Events.BLI;
with Root_Object.Events.BLJ;
with Root_Object.Events.RD;
with Root_Object.Events.BLF;
with Root_Object.Events.BLG;
with Root_Object.Events.BLH;
with Root_Object.Events.BLE;
with Root_Object.Events.BLD;
with Root_Object.Events.BLC;
with Root_Object.Events.SC;
with Root_Object.Events.objX;
with Root_Object.Events.objZ;
with Root_Object.Events.HSM;
with Root_Object.Events.CP;
with Root_Object.Events.PriA;
with Root_Object.Events.PriB;
with Root_Object.Events.objCD;
with Root_Object.Events.objTP;
with Root_Object.Events.TE;
with Root_Object.Events.CCS;

--================================================================================== 
with Events_Rel_R1;
with Events_R1_Specification;
with Events_Rel_R2;
with Events_R2_Specification;
with Events_Rel_R5;
with Events_R5_Specification;
with Events_Rel_R3;
with Events_R3_Specification;
with Events_Rel_R7;
with Events_R7_Specification;
with Events_Rel_R4;
with Events_R4_Specification;
with Events_Rel_R8;
with Events_R8_Specification;
with Events_Rel_R13;
with Events_R13_Specification;
with Events_Rel_R14;
with Events_R14_Specification;
with Events_Rel_R6;
with Events_R6_Specification;
with Events_Rel_R9;
with Events_R9_Specification;
with Events_Rel_R10;
with Events_R10_Specification;
with Events_Rel_R11;
with Events_R11_Specification;
with Events_Rel_R12;
with Events_R12_Specification;
with Events_Rel_R17;
with Events_R17_Specification;
with Events_Rel_R15;
with Events_R15_Specification;
with Events_Rel_R18;
with Events_R18_Specification;
with Events_Rel_R19;
with Events_R19_Specification;
with Events_Rel_R16;
with Events_R16_Specification;
with Events_Rel_R20;
with Events_R20_Specification;

--================================================================================== 
   
with Ada.Tags;

package body Events_Registration is

--================================================================================== 

   procedure Register_All is

   begin

--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R1 is Super Sub
      Events_Rel_R1.Register_Super_End_Class (Root_Object.Events.objA.Events_objA_Type'tag);
      Events_Rel_R1.Register_Sub_End_Relationship_Write (Root_Object.Events.objA.Put_R1_Sub'access);
      Events_Rel_R1.Register_Sub_End_Relationship_Read  (Root_Object.Events.objA.Get_R1_Sub'access);
  
      Events_Rel_R1.Register_Super_End_Relationship_Write (Events_R1_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R1.Register_Super_End_Relationship_Read  (Events_R1_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R2 is Super Sub
      Events_Rel_R2.Register_Super_End_Class (Root_Object.Events.objM.Events_objM_Type'tag);
      Events_Rel_R2.Register_Sub_End_Relationship_Write (Root_Object.Events.objM.Put_R2_Sub'access);
      Events_Rel_R2.Register_Sub_End_Relationship_Read  (Root_Object.Events.objM.Get_R2_Sub'access);
  
      Events_Rel_R2.Register_Super_End_Relationship_Write (Events_R2_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R2.Register_Super_End_Relationship_Read  (Events_R2_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R5 is Super Sub
      Events_Rel_R5.Register_Super_End_Class (Root_Object.Events.objD.Events_objD_Type'tag);
      Events_Rel_R5.Register_Sub_End_Relationship_Write (Root_Object.Events.objD.Put_R5_Sub'access);
      Events_Rel_R5.Register_Sub_End_Relationship_Read  (Root_Object.Events.objD.Get_R5_Sub'access);
  
      Events_Rel_R5.Register_Super_End_Relationship_Write (Events_R5_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R5.Register_Super_End_Relationship_Read  (Events_R5_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R3 is Super Sub
      Events_Rel_R3.Register_Super_End_Class (Root_Object.Events.objN.Events_objN_Type'tag);
      Events_Rel_R3.Register_Sub_End_Relationship_Write (Root_Object.Events.objN.Put_R3_Sub'access);
      Events_Rel_R3.Register_Sub_End_Relationship_Read  (Root_Object.Events.objN.Get_R3_Sub'access);
  
      Events_Rel_R3.Register_Super_End_Relationship_Write (Events_R3_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R3.Register_Super_End_Relationship_Read  (Events_R3_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R7 is Super Sub
      Events_Rel_R7.Register_Super_End_Class (Root_Object.Events.objJ.Events_objJ_Type'tag);
      Events_Rel_R7.Register_Sub_End_Relationship_Write (Root_Object.Events.objJ.Put_R7_Sub'access);
      Events_Rel_R7.Register_Sub_End_Relationship_Read  (Root_Object.Events.objJ.Get_R7_Sub'access);
  
      Events_Rel_R7.Register_Super_End_Relationship_Write (Events_R7_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R7.Register_Super_End_Relationship_Read  (Events_R7_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R4 is Super Sub
      Events_Rel_R4.Register_Super_End_Class (Root_Object.Events.objP.Events_objP_Type'tag);
      Events_Rel_R4.Register_Sub_End_Relationship_Write (Root_Object.Events.objP.Put_R4_Sub'access);
      Events_Rel_R4.Register_Sub_End_Relationship_Read  (Root_Object.Events.objP.Get_R4_Sub'access);
  
      Events_Rel_R4.Register_Super_End_Relationship_Write (Events_R4_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R4.Register_Super_End_Relationship_Read  (Events_R4_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R8 is Super Sub
      Events_Rel_R8.Register_Super_End_Class (Root_Object.Events.objT.Events_objT_Type'tag);
      Events_Rel_R8.Register_Sub_End_Relationship_Write (Root_Object.Events.objT.Put_R8_Sub'access);
      Events_Rel_R8.Register_Sub_End_Relationship_Read  (Root_Object.Events.objT.Get_R8_Sub'access);
  
      Events_Rel_R8.Register_Super_End_Relationship_Write (Events_R8_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R8.Register_Super_End_Relationship_Read  (Events_R8_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R13 is Super Sub
      Events_Rel_R13.Register_Super_End_Class (Root_Object.Events.SprA.Events_SprA_Type'tag);
      Events_Rel_R13.Register_Sub_End_Relationship_Write (Root_Object.Events.SprA.Put_R13_Sub'access);
      Events_Rel_R13.Register_Sub_End_Relationship_Read  (Root_Object.Events.SprA.Get_R13_Sub'access);
  
      Events_Rel_R13.Register_Super_End_Relationship_Write (Events_R13_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R13.Register_Super_End_Relationship_Read  (Events_R13_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R14 is Super Sub
      Events_Rel_R14.Register_Super_End_Class (Root_Object.Events.SprA.Events_SprA_Type'tag);
      Events_Rel_R14.Register_Sub_End_Relationship_Write (Root_Object.Events.SprA.Put_R14_Sub'access);
      Events_Rel_R14.Register_Sub_End_Relationship_Read  (Root_Object.Events.SprA.Get_R14_Sub'access);
  
      Events_Rel_R14.Register_Super_End_Relationship_Write (Events_R14_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R14.Register_Super_End_Relationship_Read  (Events_R14_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R6 is Super Sub
      Events_Rel_R6.Register_Super_End_Class (Root_Object.Events.SprA.Events_SprA_Type'tag);
      Events_Rel_R6.Register_Sub_End_Relationship_Write (Root_Object.Events.SprA.Put_R6_Sub'access);
      Events_Rel_R6.Register_Sub_End_Relationship_Read  (Root_Object.Events.SprA.Get_R6_Sub'access);
  
      Events_Rel_R6.Register_Super_End_Relationship_Write (Events_R6_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R6.Register_Super_End_Relationship_Read  (Events_R6_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R9 is Super Sub
      Events_Rel_R9.Register_Super_End_Class (Root_Object.Events.TL.Events_TL_Type'tag);
      Events_Rel_R9.Register_Sub_End_Relationship_Write (Root_Object.Events.TL.Put_R9_Sub'access);
      Events_Rel_R9.Register_Sub_End_Relationship_Read  (Root_Object.Events.TL.Get_R9_Sub'access);
  
      Events_Rel_R9.Register_Super_End_Relationship_Write (Events_R9_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R9.Register_Super_End_Relationship_Read  (Events_R9_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R10 is Super Sub
      Events_Rel_R10.Register_Super_End_Class (Root_Object.Events.SL_ONE_A.Events_SL_ONE_A_Type'tag);
      Events_Rel_R10.Register_Sub_End_Relationship_Write (Root_Object.Events.SL_ONE_A.Put_R10_Sub'access);
      Events_Rel_R10.Register_Sub_End_Relationship_Read  (Root_Object.Events.SL_ONE_A.Get_R10_Sub'access);
  
      Events_Rel_R10.Register_Super_End_Relationship_Write (Events_R10_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R10.Register_Super_End_Relationship_Read  (Events_R10_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R11 is Super Sub
      Events_Rel_R11.Register_Super_End_Class (Root_Object.Events.SL_ONE_B.Events_SL_ONE_B_Type'tag);
      Events_Rel_R11.Register_Sub_End_Relationship_Write (Root_Object.Events.SL_ONE_B.Put_R11_Sub'access);
      Events_Rel_R11.Register_Sub_End_Relationship_Read  (Root_Object.Events.SL_ONE_B.Get_R11_Sub'access);
  
      Events_Rel_R11.Register_Super_End_Relationship_Write (Events_R11_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R11.Register_Super_End_Relationship_Read  (Events_R11_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R12 is Super Sub
      Events_Rel_R12.Register_Super_End_Class (Root_Object.Events.SL_TWO_A.Events_SL_TWO_A_Type'tag);
      Events_Rel_R12.Register_Sub_End_Relationship_Write (Root_Object.Events.SL_TWO_A.Put_R12_Sub'access);
      Events_Rel_R12.Register_Sub_End_Relationship_Read  (Root_Object.Events.SL_TWO_A.Get_R12_Sub'access);
  
      Events_Rel_R12.Register_Super_End_Relationship_Write (Events_R12_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R12.Register_Super_End_Relationship_Read  (Events_R12_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R17 is Super Sub
      Events_Rel_R17.Register_Super_End_Class (Root_Object.Events.SL_TWO_D.Events_SL_TWO_D_Type'tag);
      Events_Rel_R17.Register_Sub_End_Relationship_Write (Root_Object.Events.SL_TWO_D.Put_R17_Sub'access);
      Events_Rel_R17.Register_Sub_End_Relationship_Read  (Root_Object.Events.SL_TWO_D.Get_R17_Sub'access);
  
      Events_Rel_R17.Register_Super_End_Relationship_Write (Events_R17_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R17.Register_Super_End_Relationship_Read  (Events_R17_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R15 is Super Sub
      Events_Rel_R15.Register_Super_End_Class (Root_Object.Events.SL_THREE_A.Events_SL_THREE_A_Type'tag);
      Events_Rel_R15.Register_Sub_End_Relationship_Write (Root_Object.Events.SL_THREE_A.Put_R15_Sub'access);
      Events_Rel_R15.Register_Sub_End_Relationship_Read  (Root_Object.Events.SL_THREE_A.Get_R15_Sub'access);
  
      Events_Rel_R15.Register_Super_End_Relationship_Write (Events_R15_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R15.Register_Super_End_Relationship_Read  (Events_R15_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R18 is Super Sub
      Events_Rel_R18.Register_Super_End_Class (Root_Object.Events.SL_THREE_A.Events_SL_THREE_A_Type'tag);
      Events_Rel_R18.Register_Sub_End_Relationship_Write (Root_Object.Events.SL_THREE_A.Put_R18_Sub'access);
      Events_Rel_R18.Register_Sub_End_Relationship_Read  (Root_Object.Events.SL_THREE_A.Get_R18_Sub'access);
  
      Events_Rel_R18.Register_Super_End_Relationship_Write (Events_R18_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R18.Register_Super_End_Relationship_Read  (Events_R18_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R19 is Super Sub
      Events_Rel_R19.Register_Super_End_Class (Root_Object.Events.SL_THREE_A.Events_SL_THREE_A_Type'tag);
      Events_Rel_R19.Register_Sub_End_Relationship_Write (Root_Object.Events.SL_THREE_A.Put_R19_Sub'access);
      Events_Rel_R19.Register_Sub_End_Relationship_Read  (Root_Object.Events.SL_THREE_A.Get_R19_Sub'access);
  
      Events_Rel_R19.Register_Super_End_Relationship_Write (Events_R19_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R19.Register_Super_End_Relationship_Read  (Events_R19_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R16 is Super Sub
      Events_Rel_R16.Register_Super_End_Class (Root_Object.Events.SL_THREE_D.Events_SL_THREE_D_Type'tag);
      Events_Rel_R16.Register_Sub_End_Relationship_Write (Root_Object.Events.SL_THREE_D.Put_R16_Sub'access);
      Events_Rel_R16.Register_Sub_End_Relationship_Read  (Root_Object.Events.SL_THREE_D.Get_R16_Sub'access);
  
      Events_Rel_R16.Register_Super_End_Relationship_Write (Events_R16_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R16.Register_Super_End_Relationship_Read  (Events_R16_Specification.Subtype_Read_Accessor'access);
--==================================================================================
      -- Relationships for Events domain to register:
      -- Relationship R20 is Super Sub
      Events_Rel_R20.Register_Super_End_Class (Root_Object.Events.PriA.Events_PriA_Type'tag);
      Events_Rel_R20.Register_Sub_End_Relationship_Write (Root_Object.Events.PriA.Put_R20_Sub'access);
      Events_Rel_R20.Register_Sub_End_Relationship_Read  (Root_Object.Events.PriA.Get_R20_Sub'access);
  
      Events_Rel_R20.Register_Super_End_Relationship_Write (Events_R20_Specification.Subtype_Write_Accessor'access);
      Events_Rel_R20.Register_Super_End_Relationship_Read  (Events_R20_Specification.Subtype_Read_Accessor'access);

      -- Relationships for Comms to register:
      Events_Comms_Registration.Register_Comms;

   end Register_All;

end Events_Registration;

