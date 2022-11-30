601,100
562,"NULL"
586,
585,
564,
565,"noh@iLK>zYwt;ja_RVgQwI`iubsoRafZx2Y\ya6Y:MPqpiaCxGYRiy:W8eQauD4ajPN7Jf4i449raOZ\XY5DiKoILxPvWdRAKN8jc^JRKd`]0^m=Tv<<g8>Dam@5F2G0c;1fwV4Z11M;U6DE92GuItifAbFLK=dHB?KZpfbQVBt7k6eljHY12_AXay4mv6M4[>qk\Z@x"
559,1
928,0
593,
594,
595,
597,
598,
596,
800,
801,
566,0
567,","
588,","
589,
568,""""
570,
571,
569,0
592,0
599,1000
560,0
561,0
590,0
637,0
577,0
578,0
579,0
580,0
581,0
582,0
572,174

#****Begin: Generated Statements***
#****End: Generated Statements****



# TM1 sudoku solver v3 by aboul   ########################################
# I do apologize for the french/english mix ... I did it for fun  :-)  ######################
#                                                                                                                                                 #
#                  Initialisation                                                                                                             #
#                                                                                                                                                 #
################################################################

StringGlobalVariable('V_Cube');
StringGlobalVariable('V_CubeView');
StringGlobalVariable('V_Dim1');
StringGlobalVariable('V_Dim2');
StringGlobalVariable('V_Dim3');
StringGlobalVariable('V_Element');
StringGlobalVariable('V_Subset');

NumericGlobalVariable('V_Value');

V_Cube='sudoku';
IF (CubeExists(V_Cube)=0);

   #####################################
   #                                                                                  #
   #                 Initialisation  cube    sudoku_log               #
   #                                                                                  #
   #####################################

   V_Dim1='M_sudoku_log';
   IF (DimensionExists(V_Dim1)=0);
        DimensionCreate(V_Dim1);
   ENDIF;
   V_Element = 'log';
   DimensionElementInsert (V_Dim1,'', V_Element, 's');

   V_Dim2='F_sudoku_log';
   IF (DimensionExists(V_Dim2)=0);
        DimensionCreate(V_Dim2);
   ENDIF;
   V_Value = 1;
   WHILE (V_Value <= 10000);
        V_Element = NumberToString(V_Value);
        DimensionElementInsert (V_Dim2,'', V_Element, 'n');
        V_Value = V_Value+1;
   END;

   V_Cube='sudoku_log';
   IF (CubeExists(V_Cube)=0);
        CubeCreate(V_Cube, V_Dim2, V_Dim1);
   ENDIF;
   V_CubeView='admin_RAZ';
   IF (ViewExists(V_Cube, V_CubeView)=0);
         ViewCreate(V_Cube, V_CubeView);
   ENDIF;

   #####################################
   #                                                                                  #
   #                 Initialisation  cube    sudoku_comb           #
   #                                                                                  #
   #####################################

   V_Dim1='M_sudoku_comb';
   IF (DimensionExists(V_Dim1)=0);
        DimensionCreate(V_Dim1);
   ENDIF;
   V_Element = 'x';
   DimensionElementInsert (V_Dim1,'', V_Element, 'n');
   V_Element = 'y';
   DimensionElementInsert (V_Dim1,'', V_Element, 'n');
   V_Element = 'z';
   DimensionElementInsert (V_Dim1,'', V_Element, 'n');
   V_Element = 'soluc';
   DimensionElementInsert (V_Dim1,'', V_Element, 'n');

   V_Dim2='F_sudoku_comb';
   IF (DimensionExists(V_Dim2)=0);
        DimensionCreate(V_Dim2);
   ENDIF;
   V_Value = 1;
   WHILE (V_Value <= 1458);
     V_Element = NumberToString(V_Value);
     DimensionElementInsert (V_Dim2,'', V_Element, 'n');
     V_Value = V_Value+1;
   END;

   V_Cube='sudoku_comb';
   IF (CubeExists(V_Cube)=0);
        CubeCreate(V_Cube, V_Dim2, V_Dim1);
   ENDIF;
   V_CubeView='admin_RAZ';
   IF (ViewExists(V_Cube, V_CubeView)=0);
        ViewCreate(V_Cube, V_CubeView);
   ENDIF;

   #####################################
   #                                                                                  #
   #                 Initialisation  cube    sudoku                     #
   #                                                                                  #
   #####################################

   V_Dim1='M_sudoku';
   IF (DimensionExists(V_Dim1)=0);
        DimensionCreate(V_Dim1);
   ENDIF;
   V_Subset = 'admin_resultat';
   IF (SubsetExists(V_Dim1, V_Subset)=0);
        SubsetCreate(V_Dim1, V_Subset);
   ENDIF;
   V_Subset = 'admin_RAZ';
   IF (SubsetExists(V_Dim1, V_Subset)=0);
        SubsetCreate(V_Dim1, V_Subset);
   ENDIF;
   V_Element = 'p_car';
   DimensionElementInsert (V_Dim1,'', V_Element, 'n');
   V_Element = 'base';
   DimensionElementInsert (V_Dim1,'', V_Element, 'n');
   V_Element = 'resultat';
   DimensionElementInsert (V_Dim1,'', V_Element, 'n');
   V_Element = 'flag';
   DimensionElementInsert (V_Dim1,'', V_Element, 'n');
   V_Element = 'nb_poss';
   DimensionElementInsert (V_Dim1,'', V_Element, 'n');

   V_Dim2='F_sudoku_x';
   IF (DimensionExists(V_Dim2)=0);
        DimensionCreate(V_Dim2);
   ENDIF;

   V_Dim3='F_sudoku_y';
   IF (DimensionExists(V_Dim3)=0);
        DimensionCreate(V_Dim3);
   ENDIF;

   V_Value = 1;
   WHILE (V_Value <= 9);
     V_Element = NumberToString(V_Value);
     DimensionElementInsert (V_Dim1,'', V_Element, 'n');
     DimensionElementInsert (V_Dim2,'', V_Element, 'n');
     DimensionElementInsert (V_Dim3,'', V_Element, 'n');
     V_Value = V_Value+1;
   END;

   V_Cube='sudoku';
   CubeCreate(V_Cube, V_Dim2, V_Dim3, V_Dim1);
   V_CubeView='admin_RAZ';
   V_Subset = 'admin_RAZ';
   IF (ViewExists(V_Cube, V_CubeView)=0);
        ViewCreate(V_Cube, V_CubeView);
        ViewSubsetAssign(V_Cube, V_CubeView, V_Dim1, V_Subset);
   ENDIF;
   V_CubeView='Default';
   V_Subset = 'admin_resultat';
   IF (ViewExists(V_Cube, V_CubeView)=0);
        ViewCreate(V_Cube, V_CubeView);
        ViewSubsetAssign(V_Cube, V_CubeView, V_Dim1, V_Subset);
        ViewColumnDimensionSet(V_Cube, V_CubeView, V_Dim1, 1);
        ViewColumnDimensionSet(V_Cube, V_CubeView, V_Dim2, 2);
        ViewRowDimensionSet(V_Cube, V_CubeView, V_Dim3, 1);
   ENDIF;
   V_CubeView='Par défaut';
   V_Subset = 'admin_resultat';
   IF (ViewExists(V_Cube, V_CubeView)=0);
        ViewCreate(V_Cube, V_CubeView);
        ViewSubsetAssign(V_Cube, V_CubeView, V_Dim1, V_Subset);
        ViewColumnDimensionSet(V_Cube, V_CubeView, V_Dim1, 1);
        ViewColumnDimensionSet(V_Cube, V_CubeView, V_Dim2, 2);
        ViewRowDimensionSet(V_Cube, V_CubeView, V_Dim3, 1);
   ENDIF;

ENDIF;
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,125

#****Begin: Generated Statements***
#****End: Generated Statements****


# TM1 sudoku solver v3 by aboul   ########################################
# I do apologize for the french/english mix ... I did it for fun  :-)  ######################
#                                                                                                                                                 #
#                  Initialisation   subset                                                                                                #
#                                                                                                                                                 #
################################################################

V_Dim1='M_sudoku';
V_Subset = 'admin_RAZ';
IF (SubsetGetSize(V_Dim1, V_Subset)=0);
   V_Element = 'flag';
   SubsetElementInsert(V_Dim1, V_Subset, V_Element, 1);
   V_Element = 'nb_poss';
   SubsetElementInsert(V_Dim1, V_Subset, V_Element, 2);
   V_Element = 'resultat';
   SubsetElementInsert(V_Dim1, V_Subset, V_Element, 3);

   V_Subset = 'admin_resultat';
   V_Element = 'base';
   SubsetElementInsert(V_Dim1, V_Subset, V_Element, 1);
   V_Element = 'resultat';
   SubsetElementInsert(V_Dim1, V_Subset, V_Element, 2);
ENDIF;

#####################################
#                                                                                  #
#                  Initialisation  carrés                                  #
#                                                                                  #
#####################################

V_Cube='sudoku';
CellPutN (1, V_Cube, '1', '1', 'p_car');
CellPutN (1, V_Cube, '1', '2', 'p_car');
CellPutN (1, V_Cube, '1', '3', 'p_car');
CellPutN (1, V_Cube, '2', '1', 'p_car');
CellPutN (1, V_Cube, '2', '2', 'p_car');
CellPutN (1, V_Cube, '2', '3', 'p_car');
CellPutN (1, V_Cube, '3', '1', 'p_car');
CellPutN (1, V_Cube, '3', '2', 'p_car');
CellPutN (1, V_Cube, '3', '3', 'p_car');

CellPutN (2, V_Cube, '1', '4', 'p_car');
CellPutN (2, V_Cube, '1', '5', 'p_car');
CellPutN (2, V_Cube, '1', '6', 'p_car');
CellPutN (2, V_Cube, '2', '4', 'p_car');
CellPutN (2, V_Cube, '2', '5', 'p_car');
CellPutN (2, V_Cube, '2', '6', 'p_car');
CellPutN (2, V_Cube, '3', '4', 'p_car');
CellPutN (2, V_Cube, '3', '5', 'p_car');
CellPutN (2, V_Cube, '3', '6', 'p_car');

CellPutN (3, V_Cube, '1', '7', 'p_car');
CellPutN (3, V_Cube, '1', '8', 'p_car');
CellPutN (3, V_Cube, '1', '9', 'p_car');
CellPutN (3, V_Cube, '2', '7', 'p_car');
CellPutN (3, V_Cube, '2', '8', 'p_car');
CellPutN (3, V_Cube, '2', '9', 'p_car');
CellPutN (3, V_Cube, '3', '7', 'p_car');
CellPutN (3, V_Cube, '3', '8', 'p_car');
CellPutN (3, V_Cube, '3', '9', 'p_car');

CellPutN (4, V_Cube, '4', '1', 'p_car');
CellPutN (4, V_Cube, '4', '2', 'p_car');
CellPutN (4, V_Cube, '4', '3', 'p_car');
CellPutN (4, V_Cube, '5', '1', 'p_car');
CellPutN (4, V_Cube, '5', '2', 'p_car');
CellPutN (4, V_Cube, '5', '3', 'p_car');
CellPutN (4, V_Cube, '6', '1', 'p_car');
CellPutN (4, V_Cube, '6', '2', 'p_car');
CellPutN (4, V_Cube, '6', '3', 'p_car');

CellPutN (5, V_Cube, '4', '4', 'p_car');
CellPutN (5, V_Cube, '4', '5', 'p_car');
CellPutN (5, V_Cube, '4', '6', 'p_car');
CellPutN (5, V_Cube, '5', '4', 'p_car');
CellPutN (5, V_Cube, '5', '5', 'p_car');
CellPutN (5, V_Cube, '5', '6', 'p_car');
CellPutN (5, V_Cube, '6', '4', 'p_car');
CellPutN (5, V_Cube, '6', '5', 'p_car');
CellPutN (5, V_Cube, '6', '6', 'p_car');

CellPutN (6, V_Cube, '4', '7', 'p_car');
CellPutN (6, V_Cube, '4', '8', 'p_car');
CellPutN (6, V_Cube, '4', '9', 'p_car');
CellPutN (6, V_Cube, '5', '7', 'p_car');
CellPutN (6, V_Cube, '5', '8', 'p_car');
CellPutN (6, V_Cube, '5', '9', 'p_car');
CellPutN (6, V_Cube, '6', '7', 'p_car');
CellPutN (6, V_Cube, '6', '8', 'p_car');
CellPutN (6, V_Cube, '6', '9', 'p_car');

CellPutN (7, V_Cube, '7', '1', 'p_car');
CellPutN (7, V_Cube, '7', '2', 'p_car');
CellPutN (7, V_Cube, '7', '3', 'p_car');
CellPutN (7, V_Cube, '8', '1', 'p_car');
CellPutN (7, V_Cube, '8', '2', 'p_car');
CellPutN (7, V_Cube, '8', '3', 'p_car');
CellPutN (7, V_Cube, '9', '1', 'p_car');
CellPutN (7, V_Cube, '9', '2', 'p_car');
CellPutN (7, V_Cube, '9', '3', 'p_car');

CellPutN (8, V_Cube, '7', '4', 'p_car');
CellPutN (8, V_Cube, '7', '5', 'p_car');
CellPutN (8, V_Cube, '7', '6', 'p_car');
CellPutN (8, V_Cube, '8', '4', 'p_car');
CellPutN (8, V_Cube, '8', '5', 'p_car');
CellPutN (8, V_Cube, '8', '6', 'p_car');
CellPutN (8, V_Cube, '9', '4', 'p_car');
CellPutN (8, V_Cube, '9', '5', 'p_car');
CellPutN (8, V_Cube, '9', '6', 'p_car');

CellPutN (9, V_Cube, '7', '7', 'p_car');
CellPutN (9, V_Cube, '7', '8', 'p_car');
CellPutN (9, V_Cube, '7', '9', 'p_car');
CellPutN (9, V_Cube, '8', '7', 'p_car');
CellPutN (9, V_Cube, '8', '8', 'p_car');
CellPutN (9, V_Cube, '8', '9', 'p_car');
CellPutN (9, V_Cube, '9', '7', 'p_car');
CellPutN (9, V_Cube, '9', '8', 'p_car');
CellPutN (9, V_Cube, '9', '9', 'p_car');
576,CubeAction=1511DataAction=1503CubeLogChanges=0
638,1
804,0
1217,0
900,
901,
902,
903,
906,
929,
907,
908,
904,0
905,0
909,0
911,
912,
913,
914,
915,
916,
917,0
918,1
919,0
920,50000
921,""
922,""
923,0
924,""
925,""
926,""
927,""
