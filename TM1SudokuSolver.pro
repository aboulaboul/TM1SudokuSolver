601,100
562,"NULL"
586,
585,
564,
565,"e1ss^amYKX:bsJ6:qhxfhx0KAsQW1U\cb\QCb@SF_bAIA[xkov<4uL4@Zkehs[NNB\uWBo^<MN=ZV3XUsdJVzhEwB0WNi[joE\S<Am0NaDa\m^fhkC8PBBYh7nPARESWdjxUJTVb2Izt[cN_7VC@taK1g9ywvG=J7iTeIVpD@hZluA:dVdBRDwxx9S6BMP@yLN>_g0L?"
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
572,679

#****Begin: Generated Statements***
#****End: Generated Statements****



# TM1 sudoku solver v3 by aboul   ########################################
# I do apologize for the french/english mix ... I did it for fun  :-)  ######################
#                                                                                                                                                 #
#                  Déclaration des variables                                                                                       #
#                                                                                                                                                 #
################################################################

NumericGlobalVariable('V_Compteur_Boucle_x');
NumericGlobalVariable('V_Compteur_Boucle_y');
NumericGlobalVariable('V_Compteur_Boucle_z');

StringGlobalVariable('V_Compteur_Boucle_x_txt');
StringGlobalVariable('V_Compteur_Boucle_y_txt');
StringGlobalVariable('V_Compteur_Boucle_z_txt');

NumericGlobalVariable('V_Compteur_Boucle_x_Ref');
NumericGlobalVariable('V_Compteur_Boucle_y_Ref');
NumericGlobalVariable('V_Compteur_Boucle_z_Ref');

StringGlobalVariable('V_Compteur_Boucle_x_txt_Ref');
StringGlobalVariable('V_Compteur_Boucle_y_txt_Ref');
StringGlobalVariable('V_Compteur_Boucle_z_txt_Ref');

#NumericGlobalVariable('V_Compteur_Boucle_x_Ref2');
#NumericGlobalVariable('V_Compteur_Boucle_y_Ref2');
#NumericGlobalVariable('V_Compteur_Boucle_z_Ref2');

#StringGlobalVariable('V_Compteur_Boucle_x_txt_Ref2');
#StringGlobalVariable('V_Compteur_Boucle_y_txt_Ref2');
#StringGlobalVariable('V_Compteur_Boucle_z_txt_Ref2');

NumericGlobalVariable('V_Nbe_Nbe');

NumericGlobalVariable('V_Compteur_Soluc');
NumericGlobalVariable('V_Compteur_Soluc_New');
NumericGlobalVariable('V_Compteur_Soluc_Int1');
NumericGlobalVariable('V_Compteur_Soluc_Int2');
NumericGlobalVariable('V_Compteur_Soluc_Ref');
NumericGlobalVariable('V_Soluc');

NumericGlobalVariable('V_Value');
NumericGlobalVariable('V_Value2');
NumericGlobalVariable('V_Flag');
StringGlobalVariable('V_Value_txt');

NumericGlobalVariable('V_Lig');
NumericGlobalVariable('V_Col');
NumericGlobalVariable('V_Car');

NumericGlobalVariable('V_Lig2');
NumericGlobalVariable('V_Col2');
NumericGlobalVariable('V_Car2');

StringGlobalVariable('V_Lig_txt');
StringGlobalVariable('V_Col_txt');
StringGlobalVariable('V_Car_txt');

StringGlobalVariable('V_Lig_txt2');
StringGlobalVariable('V_Col_txt2');
StringGlobalVariable('V_Car_txt2');

NumericGlobalVariable('V_Cptr_Poss');
StringGlobalVariable('V_Cptr_Poss_txt');
StringGlobalVariable('V_Init_Hyp');
StringGlobalVariable('V_Init');
NumericGlobalVariable('V_Niveau');
NumericGlobalVariable('V_Compteur_Comb');
StringGlobalVariable('V_Compteur_Comb_txt');
NumericGlobalVariable('V_Compteur_Log');
StringGlobalVariable('V_Compteur_Log_txt');


################################################################
#                                                                                                                                                 #
#                 Initialisation                                                                                                              #
#                                                                                                                                                 #
################################################################

ViewZeroOut('sudoku_log', 'admin_RAZ');
ViewZeroOut('sudoku_comb', 'admin_RAZ');
V_Compteur_Log=1;
V_Compteur_Log_txt = NumberToString ( V_Compteur_Log );


#ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Sudoku_v2 by aboul ' |
#TIMST(NOW, '(\Y/\m/\D à \H:\i:\s)'));
#ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Sudoku_v2  by aboul');
V_Compteur_Log=1;
V_Compteur_Log_txt = NumberToString ( V_Compteur_Log );
CellPutS ('TM1SudokuSolver_v3  by aboul', 'sudoku_log', V_Compteur_Log_txt, 'log');

#ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Initialisation à '| TIMST(NOW, ' \H:\i:\s'));
V_Compteur_Log=V_Compteur_Log+1;
V_Compteur_Log_txt = NumberToString ( V_Compteur_Log );
CellPutS ( 'Initialization @ '| TIMST(NOW, ' \H:\i:\s') , 'sudoku_log', V_Compteur_Log_txt, 'log');

V_Nbe_Nbe=9;

V_Niveau=1;
V_Init='Oui';
V_Init_Hyp='Oui';

V_Compteur_Soluc_Ref=0;
V_Compteur_Soluc_New=1;

V_Compteur_Comb=0;
V_Compteur_Comb_txt = NumberToString (V_Compteur_Comb);

################################################################
#                                                                                                                                                 #
#                 Résolution                                                                                                               #
#                                                                                                                                                 #
################################################################

#ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début résolution à '| TIMST(NOW, ' \H:\i:\s'));


#1
WHILE (V_Compteur_Soluc_Ref<V_Compteur_Soluc_New & V_Compteur_Soluc_New <> (V_Nbe_Nbe*V_Nbe_Nbe));

   IF ( V_Init @='Oui');

       ### On efface

       ViewZeroOut('sudoku', 'admin_RAZ');

       ### Initialisation
       V_Compteur_Boucle_x=1;
       V_Compteur_Boucle_y=1;
       V_Compteur_Boucle_z=1;
       ### On remplie les z (combinaisons possible)
       #2
       WHILE (V_Compteur_Boucle_z <= V_Nbe_Nbe);

          V_Compteur_Boucle_z_txt = NumberToString (V_Compteur_Boucle_z);
          V_Compteur_Boucle_y = 1;
          #3
          WHILE (V_Compteur_Boucle_y <= V_Nbe_Nbe);

                 V_Compteur_Boucle_y_txt=NumberToString (V_Compteur_Boucle_y);
                 V_Compteur_Boucle_x=1;
                 #4
                 WHILE (V_Compteur_Boucle_x<=V_Nbe_Nbe);

                       V_Compteur_Boucle_x_txt=NumberToString(V_Compteur_Boucle_x);
                       CellPutN (V_Compteur_Boucle_z, 'sudoku', V_Compteur_Boucle_x_txt, V_Compteur_Boucle_y_txt, V_Compteur_Boucle_z_txt);
                       V_Compteur_Boucle_x=V_Compteur_Boucle_x+1;
                 #4
                 END;
                 V_Compteur_Boucle_y=V_Compteur_Boucle_y+1;
           #3
           END;
         V_Compteur_Boucle_z=V_Compteur_Boucle_z+1;
      #2
      END;


      ### Remplissage du départ (base sur resultat)
      ### Initialisation
      #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Analyse solutions de départ à '| TIMST(NOW, ' \H:\i:\s'));
      V_Compteur_Boucle_x=1;
      V_Compteur_Boucle_y=1;
      V_Compteur_Soluc = 0;

      #2
      WHILE (V_Compteur_Boucle_y <= V_Nbe_Nbe);

         V_Compteur_Boucle_y_txt = NumberToString (V_Compteur_Boucle_y);
         V_Compteur_Boucle_x=1;
         #3
         WHILE (V_Compteur_Boucle_x <= V_Nbe_Nbe);

              V_Compteur_Boucle_x_txt=NumberToString(V_Compteur_Boucle_x);
              V_Value=CellGetN ('sudoku', V_Compteur_Boucle_x_txt, V_Compteur_Boucle_y_txt, 'base');
              IF (V_Value <> 0);
                 CellPutN (V_Value,'sudoku', V_Compteur_Boucle_x_txt, V_Compteur_Boucle_y_txt, 'resultat');
                 V_Compteur_Soluc = V_Compteur_Soluc + 1;
                 #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: '| V_Compteur_Boucle_x_txt | '  y: '|
                 #V_Compteur_Boucle_y_txt | '   Resultat  à ' | NumberToString (V_Value));
              ENDIF;
              V_Compteur_Boucle_x=V_Compteur_Boucle_x+1;
         #3
         END;
         V_Compteur_Boucle_y=V_Compteur_Boucle_y+1;
      #2
      END;
      #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', ' *** ' |
      #NumberToString(V_Compteur_Soluc) | ' solutions de base ***' );
      V_Compteur_Log=V_Compteur_Log+1;
      V_Compteur_Log_txt = NumberToString ( V_Compteur_Log );
      CellPutS ( ' *** ' | NumberToString(V_Compteur_Soluc) | ' base solutions ***' , 'sudoku_log', V_Compteur_Log_txt, 'log');
      V_Init = 'Non';
   ENDIF;

    ######################################################
    ### Test de vidage ligne colonne et carré à partir de ce qui est trouvé

    ### Initialisation
    V_Compteur_Boucle_x_Ref=1;
    V_Compteur_Boucle_y_Ref=1;

     #2
     #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début traitement ligne/colonne/profondeur/carré à '|
     #TIMST(NOW, ' \H:\i:\s'));
     WHILE (V_Compteur_Boucle_y_Ref <= V_Nbe_Nbe);

        V_Compteur_Boucle_y_txt_Ref = NumberToString(V_Compteur_Boucle_y_Ref);
        V_Compteur_Boucle_x_Ref = 1;
        #3
        WHILE (V_Compteur_Boucle_x_Ref <= V_Nbe_Nbe);

              V_Compteur_Boucle_x_txt_Ref = NumberToString(V_Compteur_Boucle_x_Ref);

              ######################################################
              #                                                                                                                         #
              #                 Le ménage dans les combinaisons possibles                                   #
              #                                                                                                                         #
              ######################################################

              V_Flag=CellGetN ('sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'flag');
              V_Value=CellGetN ('sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'resultat');
              IF (V_Value <> 0);
                 V_Value_txt=NumberToString (V_Value);
                 V_Car=CellGetN ('sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'p_car');

                 ### Traitement ligne
                 #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début traitement ligne à '| TIMST(NOW, ' \H:\i:\s'));
                 #V_Compteur_Log=V_Compteur_Log+1;
                 #V_Compteur_Log_txt = NumberToString ( V_Compteur_Log );
                 #CellPutS ( 'Début traitement ligne à '| TIMST(NOW, ' \H:\i:\s') , 'sudoku_log', V_Compteur_Log_txt, 'log');

                 V_Compteur_Boucle_x=1;
                 #4
                 WHILE (V_Compteur_Boucle_x <= V_Nbe_Nbe);

                     V_Compteur_Boucle_x_txt = NumberToString ( V_Compteur_Boucle_x );
                     IF (V_Compteur_Boucle_x <> V_Compteur_Boucle_x_Ref);
                          CellPutN (0, 'sudoku', V_Compteur_Boucle_x_txt, V_Compteur_Boucle_y_txt_Ref, V_Value_txt);
                          #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: '| V_Compteur_Boucle_x_txt | '  y: '
                          #| V_Compteur_Boucle_y_txt_Ref | '  z: '| V_Value_txt | '  à 0');
                          #V_Compteur_Log=V_Compteur_Log+1;
                          #V_Compteur_Log_txt = NumberToString ( V_Compteur_Log );
                          #CellPutS (  'x: '| V_Compteur_Boucle_x_txt | '  y: ' | V_Compteur_Boucle_y_txt_Ref | '  z: '|
                          #V_Value_txt | '  à 0' , 'sudoku_log', V_Compteur_Log_txt, 'log');
                     ENDIF;
                     V_Compteur_Boucle_x = V_Compteur_Boucle_x+1;
                 #4
                 END;

                ### Traitement colonne
                # ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début traitement colonne à '| TIMST(NOW, ' \H:\i:\s'));
                 V_Compteur_Boucle_y=1;
                 #4
                 WHILE (V_Compteur_Boucle_y <= V_Nbe_Nbe);

                   V_Compteur_Boucle_y_txt=NumberToString(V_Compteur_Boucle_y);
                   IF (V_Compteur_Boucle_y <> V_Compteur_Boucle_y_Ref);
                      CellPutN (0, 'sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt, V_Value_txt);
                      #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: '| V_Compteur_Boucle_x_txt_Ref | '  y: '
                      #| V_Compteur_Boucle_y_txt | '  z: '| V_Value_txt | '  à 0');
                   ENDIF;
                 V_Compteur_Boucle_y = V_Compteur_Boucle_y+1;
                 #4
                 END;

                 ### Traitement 'en profondeur'
                 #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début traitement profondeur à '| TIMST(NOW, ' \H:\i:\s'));
                 V_Compteur_Boucle_z=1;
                 #4
                 WHILE (V_Compteur_Boucle_z <= V_Nbe_Nbe);

                    V_Compteur_Boucle_z_txt=NumberToString(V_Compteur_Boucle_z);
                       IF ( V_Value_txt @<> V_Compteur_Boucle_z_txt );
                          CellPutN (0, 'sudoku', V_Compteur_Boucle_x_txt_Ref,  V_Compteur_Boucle_y_txt_Ref, V_Compteur_Boucle_z_txt);
                          #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: '| V_Compteur_Boucle_x_txt_Ref | '  y: '
                          #| V_Compteur_Boucle_y_txt_Ref | '  z: '| V_Compteur_Boucle_z_txt | '  à 0');
                       ENDIF;
                 V_Compteur_Boucle_z = V_Compteur_Boucle_z+1;
                 #4
                 END;

                 ### Traitement carré
                 ### Initialisation
                 #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début traitement carré à '| TIMST(NOW, ' \H:\i:\s'));
                 V_Compteur_Boucle_x =1;
                 V_Compteur_Boucle_y =1;
                 #4
                 WHILE (V_Compteur_Boucle_y  <= V_Nbe_Nbe);

                   V_Compteur_Boucle_y_txt  = NumberToString (V_Compteur_Boucle_y );
                   V_Compteur_Boucle_x =1;
                   #5
                   WHILE (V_Compteur_Boucle_x <= V_Nbe_Nbe);

                        V_Compteur_Boucle_x_txt = NumberToString (V_Compteur_Boucle_x );


                        ### Initialisation

                        V_Car2 = CellGetN ('sudoku', V_Compteur_Boucle_x_txt , V_Compteur_Boucle_y_txt, 'p_car');

                        ################################################
                        #                                                                                                            #
                        #                 Le ménage dans les combinaisons 'carré' possibles           #
                        #                                                                                                            #
                        ################################################


                        IF (V_Car2 = V_Car);
                           IF (V_Compteur_Boucle_x<>V_Compteur_Boucle_x_Ref % V_Compteur_Boucle_y<> V_Compteur_Boucle_y_Ref);
                               CellPutN (0, 'sudoku', V_Compteur_Boucle_x_txt, V_Compteur_Boucle_y_txt, V_value_txt);
                               #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: '| V_Compteur_Boucle_x_txt | '  y: '
                               # | V_Compteur_Boucle_y_txt | '  z: '| V_value_txt | '  à 0');
                           ENDIF;
                       ENDIF;

                       V_Compteur_Boucle_x = V_Compteur_Boucle_x+1;
                   #5
                   END;
                   V_Compteur_Boucle_y = V_Compteur_Boucle_y+1;
                #4
                END;
              ENDIF;
              V_Compteur_Boucle_x_Ref = V_Compteur_Boucle_x_Ref+1;

              #3
              END;

           V_Compteur_Boucle_y_Ref = V_Compteur_Boucle_y_Ref+1;

      #2
      END;



            ######################################################
            ### Test de vidage ligne colonne avec déduction

        ########################################################
        #                                                                                                                              #
        #                 Test si solution obligatoire suivant ligne colonne (tripplette)                  #
        #                                                                                                                              #
        ########################################################

         ### On test sur chaque ligne
         #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début résolution ligne à '| TIMST(NOW, ' \H:\i:\s'));
         #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début résolution ligne');
        V_Compteur_Boucle_z=1;
        #2
        WHILE (V_Compteur_Boucle_z <= V_Nbe_Nbe);

               V_Compteur_Boucle_z_txt = NumberToString(V_Compteur_Boucle_z);
               V_Compteur_Boucle_y = 1;
               #3
               WHILE (V_Compteur_Boucle_y <= V_Nbe_Nbe);

                      V_Compteur_Boucle_y_txt = NumberToString(V_Compteur_Boucle_y);
                      V_Compteur_Boucle_x = 1;
                      V_Compteur_Soluc=0;
                      #4
                      WHILE (V_Compteur_Boucle_x <= V_Nbe_Nbe);

                          V_Compteur_Boucle_x_txt=NumberToString(V_Compteur_Boucle_x);

                          V_Value2 = CellGetN ('sudoku', V_Compteur_Boucle_x_txt,  V_Compteur_Boucle_y_txt, V_Compteur_Boucle_z_txt);
                          IF (V_Value2 <>0);
                             V_Compteur_Soluc=V_Compteur_Soluc+1;
                             V_Col_txt=V_Compteur_Boucle_x_txt;
                          ENDIF;

                          V_Compteur_Boucle_x=V_Compteur_Boucle_x+1;
                      #4
                      END;

                      IF (V_Compteur_Soluc=1 & V_Compteur_Boucle_z <> CellGetN ('sudoku', V_Col_txt, V_Compteur_Boucle_y_txt, 'resultat') );
                           CellPutN (V_Compteur_Boucle_z, 'sudoku', V_Col_txt, V_Compteur_Boucle_y_txt, 'resultat');
                           #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: ' | V_Col_txt | '  y: ' |
                           #V_Compteur_Boucle_y_txt | '   resultat à   ' | NumberToString(V_Compteur_Boucle_z) );
                      ENDIF;
                      V_Compteur_Boucle_y=V_Compteur_Boucle_y+1;
              #3
              END;
              V_Compteur_Boucle_z=V_Compteur_Boucle_z+1;
        #2
        END;


         ### On test sur chaque colonne
         #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début résolution colonne à '| TIMST(NOW, ' \H:\i:\s'));
         #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début résolution colonne');
        V_Compteur_Boucle_z=1;
        #2
        WHILE (V_Compteur_Boucle_z <= V_Nbe_Nbe);

               V_Compteur_Boucle_z_txt = NumberToString (V_Compteur_Boucle_z);
               V_Compteur_Boucle_x = 1;
               #3
               WHILE (V_Compteur_Boucle_x <= V_Nbe_Nbe);

                      V_Compteur_Boucle_x_txt = NumberToString (V_Compteur_Boucle_x);
                      V_Compteur_Boucle_y=1;
                      V_Compteur_Soluc= 0;
                      #4
                      WHILE (V_Compteur_Boucle_y <= V_Nbe_Nbe);

                          V_Compteur_Boucle_y_txt = NumberToString (V_Compteur_Boucle_y);

                          V_Value2 = CellGetN ('sudoku', V_Compteur_Boucle_x_txt,  V_Compteur_Boucle_y_txt, V_Compteur_Boucle_z_txt);
                          IF ( V_Value2 <>0);
                             V_Compteur_Soluc=V_Compteur_Soluc+1;
                             V_Lig_txt = V_Compteur_Boucle_y_txt;
                          ENDIF;

                          V_Compteur_Boucle_y = V_Compteur_Boucle_y+1;
                      #4
                      END;

                      IF (V_Compteur_Soluc=1 & V_Compteur_Boucle_z <> CellGetN ('sudoku', V_Compteur_Boucle_x_txt, V_Lig_txt, 'resultat'));
                          CellPutN (V_Compteur_Boucle_z, 'sudoku', V_Compteur_Boucle_x_txt, V_Lig_txt, 'resultat');
                          #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: ' | V_Compteur_Boucle_x_txt | '  y: ' |
                          #V_Lig_txt | '   resultat à   ' | NumberToString(V_Compteur_Boucle_z));
                      ENDIF;

                      V_Compteur_Boucle_x = V_Compteur_Boucle_x+1;
              #3
              END;
              V_Compteur_Boucle_z = V_Compteur_Boucle_z+1;
        #2
        END;



           ######################################################
           ### on teste en profondeur
           #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début résolution profondeur à '| TIMST(NOW, ' \H:\i:\s'));
           #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début résolution profondeur');

            ### Initialisation
            V_Compteur_Boucle_x_Ref=1;
            V_Compteur_Boucle_y_Ref=1;
            #2
            WHILE (V_Compteur_Boucle_y_Ref <= V_Nbe_Nbe);

                V_Compteur_Boucle_y_txt_Ref = NumberToString (V_Compteur_Boucle_y_Ref);
                V_Compteur_Boucle_x_Ref = 1;
                #3
                WHILE (V_Compteur_Boucle_x_Ref <= V_Nbe_Nbe);

                     V_Compteur_Boucle_x_txt_Ref = NumberToString(V_Compteur_Boucle_x_Ref);


                      ### Initialisation

                      V_Flag=CellGetN ('sudoku', V_Compteur_Boucle_x_txt_Ref , V_Compteur_Boucle_y_txt_Ref , 'flag');
                      V_Car2=CellGetN ('sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'p_car');

                   #######################################################
                   #                                                                                                                            #
                   #                 Test si solution  à partir des éliminations précédentes                         #
                   #                                                                                                                            #
                   #######################################################


                   IF (V_Flag=0);

                      V_Compteur_Soluc=0;
                      V_Compteur_Boucle_z=1;
                      V_Soluc=0;
                      #4
                      WHILE (V_Compteur_Boucle_z <= V_Nbe_Nbe);

                          V_Compteur_Boucle_z_txt=NumberToString(V_Compteur_Boucle_z);

                          IF (CellGetN ('sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, V_Compteur_Boucle_z_txt)<>0);
                             V_Compteur_Soluc = V_Compteur_Soluc + 1;
                             V_Soluc=V_Compteur_Boucle_z;
                          ENDIF;

                          V_Compteur_Boucle_z = V_Compteur_Boucle_z+1;
                      #4
                      END;
                       IF (V_Compteur_Soluc=1);
                             CellPutN (V_Soluc, 'sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'resultat');
                             #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: ' | V_Compteur_Boucle_x_txt_Ref | '  y: ' |
                             #V_Compteur_Boucle_y_txt_Ref | '   resultat à   ' | NumberToString(V_Soluc));

                             CellPutN (1, 'sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'flag');
                             #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: ' | V_Compteur_Boucle_x_txt_Ref | '  y: ' |
                             #V_Compteur_Boucle_y_txt_Ref | '   flag à  1');

                             CellPutN (0, 'sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'nb_poss');
                             #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: ' | V_Compteur_Boucle_x_txt_Ref | '  y: ' |
                             #V_Compteur_Boucle_y_txt_Ref | '   nb_poss à  0');
                       ELSE;
                             CellPutN (V_Compteur_Soluc, 'sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'nb_poss');
                             #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'x: ' | V_Compteur_Boucle_x_txt_Ref | '  y: ' |
                             #V_Compteur_Boucle_y_txt_Ref | '   nb_poss à   ' | NumberToString(V_Compteur_Soluc));
                       ENDIF;

                   ENDIF;


                   V_Compteur_Boucle_x_Ref = V_Compteur_Boucle_x_Ref +1;
                   #3
                   END;
                V_Compteur_Boucle_y_Ref = V_Compteur_Boucle_y_Ref +1;
                #2
                END;



    ######################################################
    ### Comptage solution
     V_Compteur_Soluc_Int1= V_Compteur_Soluc_New;
     V_Compteur_Soluc_Int2= 0;

     V_Compteur_Boucle_y = 1;
     #2
     WHILE (V_Compteur_Boucle_y <= V_Nbe_Nbe);

              V_Compteur_Boucle_y_txt = NumberToString (V_Compteur_Boucle_y);
              V_Compteur_Boucle_x =1;
              #3
              WHILE (V_Compteur_Boucle_x <= V_Nbe_Nbe);

                    V_Compteur_Boucle_x_txt = NumberToString(V_Compteur_Boucle_x);

                    IF ( CellGetN ('sudoku', V_Compteur_Boucle_x_txt, V_Compteur_Boucle_y_txt, 'flag')<>0 );
                         V_Compteur_Soluc_Int2 =V_Compteur_Soluc_Int2+1;
                    ENDIF;

                    V_Compteur_Boucle_x= V_Compteur_Boucle_x+1;
               #3
               END;
               V_Compteur_Boucle_y= V_Compteur_Boucle_y+1;

    #2
    END;
    #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', '*** ' |
    #NumberToString(V_Compteur_Soluc_Int2) | ' solutions  ***  à ' | TIMST(NOW, ' \H:\i:\s') | ' Niveau: ' | NumberToString (V_Niveau));
    V_Compteur_Log=V_Compteur_Log+1;
    V_Compteur_Log_txt = NumberToString ( V_Compteur_Log );
    CellPutS ( '*** ' | NumberToString(V_Compteur_Soluc_Int2) | ' solutions  ***  @ ' | TIMST(NOW, ' \H:\i:\s') | ' Level: ' |
    NumberToString (V_Niveau) , 'sudoku_log', V_Compteur_Log_txt, 'log');

    V_Compteur_Soluc_New=V_Compteur_Soluc_Int2;
    V_Compteur_Soluc_Ref=V_Compteur_Soluc_Int1;
    IF (V_Niveau = 1 & V_Compteur_Soluc_New = V_Compteur_Soluc_Ref );
       V_Niveau = V_Niveau + 1;
    ENDIF;

    ######################################################
    ### Prise hypothèses
    IF (V_Niveau = 2 & V_Init_Hyp @='Oui');

       #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début prise hypothèses à ' | TIMST(NOW, ' \H:\i:\s') );
       #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début prise hypothèses');

       ### Initialisation
       V_Compteur_Boucle_x_Ref=1;
       V_Compteur_Boucle_y_Ref=1;
       ViewZeroOut('sudoku_comb', 'admin_RAZ');
       V_Cptr_Poss=0;
            #2
            WHILE (V_Compteur_Boucle_y_Ref <= V_Nbe_Nbe);

                V_Compteur_Boucle_y_txt_Ref = NumberToString (V_Compteur_Boucle_y_Ref);
                V_Compteur_Boucle_x_Ref = 1;
                #3
                WHILE (V_Compteur_Boucle_x_Ref <= V_Nbe_Nbe);
                    V_Compteur_Boucle_x_txt_Ref = NumberToString (V_Compteur_Boucle_x_Ref);
                    V_Value = CellGetN ('sudoku', V_Compteur_Boucle_x_txt_Ref,  V_Compteur_Boucle_y_txt_Ref, 'nb_poss');

                    IF (V_Value <> 0);

                       V_Compteur_Boucle_z=1;
                       #4
                        WHILE (V_Compteur_Boucle_z <= V_Nbe_Nbe);

                           V_Compteur_Boucle_z_txt = NumberToString (V_Compteur_Boucle_z) ;
                           V_Value2 = CellGetN ('sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, V_Compteur_Boucle_z_txt);

                           IF (V_Value2<>0);
                               V_Cptr_Poss=V_Cptr_Poss+1;
                               V_Cptr_Poss_txt = NumberToString (V_Cptr_Poss);
                               CellPutN (V_Compteur_Boucle_x_Ref, 'sudoku_comb', V_Cptr_Poss_txt, 'x');
                               CellPutN (V_Compteur_Boucle_y_Ref, 'sudoku_comb', V_Cptr_Poss_txt, 'y');
                               CellPutN (V_Compteur_Boucle_z, 'sudoku_comb', V_Cptr_Poss_txt, 'z');
                          ENDIF;

                          V_Compteur_Boucle_z = V_Compteur_Boucle_z+1;
                      #4
                      END;
                      V_Cptr_Poss=V_Cptr_Poss+1;
                      V_Cptr_Poss_txt = NumberToString (V_Cptr_Poss);
                      CellPutN (V_Compteur_Boucle_x_Ref, 'sudoku_comb', V_Cptr_Poss_txt, 'x');
                      CellPutN (V_Compteur_Boucle_y_Ref, 'sudoku_comb', V_Cptr_Poss_txt, 'y');
                      CellPutN (0 , 'sudoku_comb', V_Cptr_Poss_txt, 'z');
                   ENDIF;

                   V_Compteur_Boucle_x_Ref = V_Compteur_Boucle_x_Ref +1;
                   #3
                   END;
                V_Compteur_Boucle_y_Ref = V_Compteur_Boucle_y_Ref +1;
             #2
             END;
    V_Init_Hyp ='Non';
    ENDIF;

    ######################################################
    ### Test hypothèses
    IF (V_Niveau = 2 & V_Compteur_Soluc_Ref = V_Compteur_Soluc_New);

       #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début test hypothèses à ' | TIMST(NOW, ' \H:\i:\s') );
       #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Début test hypothèses');

       IF (V_Compteur_Comb <> 0);
          CellPutN (V_Compteur_Soluc_New, 'sudoku_comb', V_Compteur_Comb_txt, 'soluc');
       ENDIF;

       V_Compteur_Comb = V_Compteur_Comb +1;
       V_Compteur_Comb_txt = NumberToString (V_Compteur_Comb);

       V_Compteur_Boucle_x_Ref =  CellGetN ( 'sudoku_comb', V_Compteur_Comb_txt, 'x');
       V_Compteur_Boucle_x_txt_Ref = NumberToString (V_Compteur_Boucle_x_Ref);

       V_Compteur_Boucle_y_Ref =  CellGetN ( 'sudoku_comb', V_Compteur_Comb_txt, 'y');
       V_Compteur_Boucle_y_txt_Ref = NumberToString (V_Compteur_Boucle_y_Ref);

       V_Compteur_Boucle_z_Ref =  CellGetN ( 'sudoku_comb', V_Compteur_Comb_txt, 'z');
       V_Compteur_Boucle_z_txt_Ref = NumberToString (V_Compteur_Boucle_z_Ref);

       IF (V_Compteur_Boucle_x_Ref <>0);
          CellPutN (V_Compteur_Boucle_z_Ref, 'sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'base');
          #ASCIIOutput('C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt', 'Hypothèse ' | V_Compteur_Boucle_z_txt_Ref | ' en x: ' |
          #V_Compteur_Boucle_x_txt_Ref | '  y: ' | V_Compteur_Boucle_y_txt_Ref);

          V_Compteur_Log=V_Compteur_Log+1;
          V_Compteur_Log_txt = NumberToString ( V_Compteur_Log );
          CellPutS ( 'Assumption ' | V_Compteur_Boucle_z_txt_Ref | '  x: ' | V_Compteur_Boucle_x_txt_Ref | '  y: ' |
          V_Compteur_Boucle_y_txt_Ref, 'sudoku_log', V_Compteur_Log_txt, 'log');

          V_Compteur_Soluc_Ref=0;
          V_Compteur_Soluc_New=1;

          V_Init ='Oui';
       ENDIF;
    ENDIF;

#*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*
#*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*
#*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*

#*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*
#*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*
#*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*!*

#1
END;

IF (V_Niveau = 2 & V_Compteur_Soluc_New = (V_Nbe_Nbe*V_Nbe_Nbe));
       V_Compteur_Boucle_x_Ref =  CellGetN ( 'sudoku_comb', V_Compteur_Comb_txt, 'x');
       V_Compteur_Boucle_x_txt_Ref = NumberToString (V_Compteur_Boucle_x_Ref);

       V_Compteur_Boucle_y_Ref =  CellGetN ( 'sudoku_comb', V_Compteur_Comb_txt, 'y');
       V_Compteur_Boucle_y_txt_Ref = NumberToString (V_Compteur_Boucle_y_Ref);

       CellPutN (0, 'sudoku', V_Compteur_Boucle_x_txt_Ref, V_Compteur_Boucle_y_txt_Ref, 'base');
ENDIF;

#ExecuteCommand ('notepad.exe C:\Documents and Settings\All Users\Bureau\sudoku_v2.txt',0);
################################################################
################################################################
573,3

#****Begin: Generated Statements***
#****End: Generated Statements****
574,3

#****Begin: Generated Statements***
#****End: Generated Statements****
575,3

#****Begin: Generated Statements***
#****End: Generated Statements****
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
