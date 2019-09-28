# DataRaceBench FORTRAN kernels

These are DataRaceBench 1.2 kernels re-written in FORTRAN in order to work on LLVM-IR based OpenMP data race detection tools.

## Current Status of DataRaceBench FORTRAN kernels
| id  | DataRaceBench v1.2 kernel  | Have race?  | DataRaceBench FORTRAN  | Flang Support  |
|:-:|:-:|:-:|:-:|:-:|
| 1 | DRB001-antidep1-orig-yes.c | TRUE | DRBF001_yes.f95 |  | 
| 2 | DRB002-antidep1-var-yes.c | TRUE | DRBF002_yes.f95 |  | 
| 3 | DRB003-antidep2-orig-yes.c | TRUE | DRBF003_yes.f95 |  | 
| 4 | DRB004-antidep2-var-yes.c | TRUE | DRBF004_yes.f95 |  | 
| 5 | DRB005-indirectaccess1-orig-yes.c | TRUE |  |  | 
| 6 | DRB006-indirectaccess2-orig-yes.c | TRUE |  |  | 
| 7 | DRB007-indirectaccess3-orig-yes.c | TRUE |  |  | 
| 8 | DRB008-indirectaccess4-orig-yes.c | TRUE |  |  | 
| 9 | DRB009-lastprivatemissing-orig-yes.c | TRUE | DRBF009_yes.f95 |  | 
| 10 | DRB010-lastprivatemissing-var-yes.c | TRUE | DRBF010_yes.f95 |  | 
| 11 | DRB011-minusminus-orig-yes.c | TRUE | DRBF011_yes.f95 |  | 
| 12 | DRB012-minusminus-var-yes.c | TRUE | DRBF012_yes.f95 |  | 
| 13 | DRB013-nowait-orig-yes.c | TRUE | DRBF013_yes.f95 |  | 
| 14 | DRB014-outofbounds-orig-yes.c | TRUE | DRBF014_yes.f95 |  | 
| 15 | DRB015-outofbounds-var-yes.c | TRUE | DRBF015_yes.f95 |  | 
| 16 | DRB016-outputdep-orig-yes.c | TRUE | DRBF016_yes.f95 |  | 
| 17 | DRB017-outputdep-var-yes.c | TRUE | DRBF017_yes.f95 |  | 
| 18 | DRB018-plusplus-orig-yes.c | TRUE | DRBF018_yes.f95 |  | 
| 19 | DRB019-plusplus-var-yes.c | TRUE | DRBF019_yes.f95 |  | 
| 20 | DRB020-privatemissing-var-yes.c | TRUE | DRBF020_yes.f95 |  | 
| 21 | DRB021-reductionmissing-orig-yes.c | TRUE | DRBF021_yes.f95 |  | 
| 22 | DRB022-reductionmissing-var-yes.c | TRUE | DRBF022_yes.f95 |  | 
| 23 | DRB023-sections1-orig-yes.c | TRUE | DRBF023_yes.f95 |  | 
| 24 | DRB024-simdtruedep-orig-yes.c | TRUE | DRBF024_yes.f95 |  | 
| 25 | DRB025-simdtruedep-var-yes.c | TRUE | DRBF025_yes.f95 |  | 
| 26 | DRB026-targetparallelfor-orig-yes.c | TRUE | DRBF026_yes.f95 |  | 
| 27 | DRB027-taskdependmissing-orig-yes.c | TRUE | DRBF027_yes.f95 |  | 
| 28 | DRB028-privatemissing-orig-yes.c | TRUE | DRBF028_yes.f95 |  | 
| 29 | DRB029-truedep1-orig-yes.c | TRUE | DRBF029_yes.f95 |  | 
| 30 | DRB030-truedep1-var-yes.c | TRUE | DRBF030_yes.f95 |  | 
| 31 | DRB031-truedepfirstdimension-orig-yes.c | TRUE | DRBF031_yes.f95 |  | 
| 32 | DRB032-truedepfirstdimension-var-yes.c | TRUE | DRBF032_yes.f95 |  | 
| 33 | DRB033-truedeplinear-orig-yes.c | TRUE | DRBF033_yes.f95 |  | 
| 34 | DRB034-truedeplinear-var-yes.c | TRUE | DRBF034_yes.f95 |  | 
| 35 | DRB035-truedepscalar-orig-yes.c | TRUE | DRBF035_yes.f95 |  | 
| 36 | DRB036-truedepscalar-var-yes.c | TRUE | DRBF036_yes.f95 |  | 
| 37 | DRB037-truedepseconddimension-orig-yes.c | TRUE | DRBF037_yes.f95 |  | 
| 38 | DRB038-truedepseconddimension-var-yes.c | TRUE | DRBF038_yes.f95 |  | 
| 39 | DRB039-truedepsingleelement-orig-yes.c | TRUE | DRBF039_yes.f95 |  | 
| 40 | DRB040-truedepsingleelement-var-yes.c | TRUE | DRBF040_yes.f95 |  | 
| 41 | DRB041-3mm-parallel-no.c | FALSE |  |  | 
| 42 | DRB042-3mm-tile-no.c | FALSE |  |  | 
| 43 | DRB043-adi-parallel-no.c | FALSE |  |  | 
| 44 | DRB044-adi-tile-no.c | FALSE |  |  | 
| 45 | DRB045-doall1-orig-no.c | FALSE | DRBF045_no.f95 |  | 
| 46 | DRB046-doall2-orig-no.c | FALSE | DRBF046_no.f95 |  | 
| 47 | DRB047-doallchar-orig-no.c | FALSE | DRBF047_no.f95 |  | 
| 48 | DRB048-firstprivate-orig-no.c | FALSE | DRBF048_no.f95 |  | 
| 49 | DRB049-fprintf-orig-no.c | FALSE |  |  | 
| 50 | DRB050-functionparameter-orig-no.c | FALSE | DRBF050_no.f95 |  | 
| 51 | DRB051-getthreadnum-orig-no.c | FALSE | DRBF051_no.f95 |  | 
| 52 | DRB052-indirectaccesssharebase-orig-no.c | FALSE |  |  | 
| 53 | DRB053-inneronly1-orig-no.c | FALSE | DRBF053_no.f95 |  | 
| 54 | DRB054-inneronly2-orig-no.c | FALSE | DRBF054_no.f95 |  | 
| 55 | DRB055-jacobi2d-parallel-no.c | FALSE |  |  | 
| 56 | DRB056-jacobi2d-tile-no.c | FALSE |  |  | 
| 57 | DRB057-jacobiinitialize-orig-no.c | FALSE | DRBF057_no.f95 |  | 
| 58 | DRB058-jacobikernel-orig-no.c | FALSE |  |  | 
| 59 | DRB059-lastprivate-orig-no.c | FALSE | DRBF059_no.f95 |  | 
| 60 | DRB060-matrixmultiply-orig-no.c | FALSE | DRBF060_no.f95 |  | 
| 61 | DRB061-matrixvector1-orig-no.c | FALSE | DRBF061_no.f95 |  | 
| 62 | DRB062-matrixvector2-orig-no.c | FALSE | DRBF062_no.f95 |  | 
| 63 | DRB063-outeronly1-orig-no.c | FALSE | DRBF063_no.f95 |  | 
| 64 | DRB064-outeronly2-orig-no.c | FALSE | DRBF064_no.f95 |  | 
| 65 | DRB065-pireduction-orig-no.c | FALSE | DRBF065_no.f95 |  | 
| 66 | DRB066-pointernoaliasing-orig-no.c | FALSE | DRBF066_no.f95 |  | 
| 67 | DRB067-restrictpointer1-orig-no.c | FALSE |  |  | 
| 68 | DRB068-restrictpointer2-orig-no.c | FALSE |  |  | 
| 69 | DRB069-sectionslock1-orig-no.c | FALSE | DRBF069_no.f95 |  | 
| 70 | DRB070-simd1-orig-no.c | FALSE | DRBF070_no.f95 |  | 
| 71 | DRB071-targetparallelfor-orig-no.c | FALSE | DRBF071_no.f95 |  | 
| 72 | DRB072-taskdep1-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, DEPEND, not yet implemented in this version of the compiler. | 
| 73 | DRB073-doall2-orig-yes.c | TRUE | DRBF073_yes.f95 |  | 
| 74 | DRB074-flush-orig-yes.c | TRUE | DRBF074_yes.f95 |  | 
| 75 | DRB075-getthreadnum-orig-yes.c | TRUE | DRBF075_yes.f95 |  | 
| 76 | DRB076-flush-orig-no.c | FALSE | DRBF076_no.f95 |  | 
| 77 | DRB077-single-orig-no.c | FALSE | DRBF077_no.f95 |  | 
| 78 | DRB078-taskdep2-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, DEPEND, not yet implemented in this version of the compiler. | 
| 79 | DRB079-taskdep3-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, DEPEND, not yet implemented in this version of the compiler. | 
| 80 | DRB080-func-arg-orig-yes.c | TRUE | DRBF080_yes.f95 |  | 
| 81 | DRB081-func-arg-orig-no.c | FALSE | DRBF081_no.f95 |  | 
| 82 | DRB082-declared-in-func-orig-yes.c | TRUE | DRBF082_yes.f95 |  | 
| 83 | DRB083-declared-in-func-orig-no.c | FALSE | DRBF083_no.f95 |  | 
| 84 | DRB084-threadprivatemissing-orig-yes.c | TRUE |  | error: unable to execute command: Segmentation fault (core dumped) | 
| 85 | DRB085-threadprivate-orig-no.c | FALSE |  | error: unable to execute command: Segmentation fault (core dumped) | 
| 86 | DRB086-static-data-member-orig-yes.cpp | TRUE |  |  | 
| 87 | DRB087-static-data-member2-orig-yes.cpp | TRUE |  |  | 
| 88 | DRB088-dynamic-storage-orig-yes.c | TRUE | DRBF088_yes.f95 |  | 
| 89 | DRB089-dynamic-storage2-orig-yes.c | TRUE | DRBF089_yes.f95 |  | 
| 90 | DRB090-static-local-orig-yes.c | TRUE | DRBF090_yes.f95 |  | 
| 91 | DRB091-threadprivate2-orig-no.c | FALSE | DRBF091_no.f95 |  | 
| 92 | DRB092-threadprivatemissing2-orig-yes.c | TRUE | DRBF092_yes.f95 |  | 
| 93 | DRB093-doall2-collapse-orig-no.c | FALSE | DRBF093_no.f95 |  | 
| 94 | DRB094-doall2-ordered-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, ORDERED(n), not yet implemented in this version of the compiler. | 
| 95 | DRB095-doall2-taskloop-orig-yes.c | TRUE | DRBF095_yes.f95 |  | 
| 96 | DRB096-doall2-taskloop-collapse-orig-no.c | FALSE | DRBF096_no.f95 |  | 
| 97 | DRB097-target-teams-distribute-orig-no.c | FALSE | DRBF097_no.f95 |  | 
| 98 | DRB098-simd2-orig-no.c | FALSE | DRBF098_no.f95 |  | 
| 99 | DRB099-targetparallelfor2-orig-no.c | FALSE | DRBF099_no.f95 |  | 
| 100 | DRB100-task-reference-orig-no.cpp | FALSE | DRBF100_no.f95 |  | 
| 101 | DRB101-task-value-orig-no.cpp | FALSE | DRBF101_no.f95 |  | 
| 102 | DRB102-copyprivate-orig-no.c | FALSE | DRBF102_no.f95 |  | 
| 103 | DRB103-master-orig-no.c | FALSE | DRBF103_no.f95 |  | 
| 104 | DRB104-nowait-barrier-orig-no.c | FALSE | DRBF104_no.f95 |  | 
| 105 | DRB105-taskwait-orig-no.c | FALSE | DRBF105_no.f95 |  | 
| 106 | DRB106-taskwaitmissing-orig-yes.c | TRUE | DRBF106_yes.f95 |  | 
| 107 | DRB107-taskgroup-orig-no.c | FALSE | DRBF107_no.f95 |  | 
| 108 | DRB108-atomic-orig-no.c | FALSE | DRBF108_no.f95 |  | 
| 109 | DRB109-orderedmissing-orig-yes.c | TRUE | DRBF109_yes.f95 |  | 
| 110 | DRB110-ordered-orig-no.c | FALSE | DRBF110_no.f95 |  | 
| 111 | DRB111-linearmissing-orig-yes.c | TRUE | DRBF111_yes.f95 |  | 
| 112 | DRB112-linear-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, LINEAR, not yet implemented in this version of the compiler. | 
| 113 | DRB113-default-orig-no.c | FALSE | DRBF113_no.f95 |  | 
| 114 | DRB114-if-orig-yes.c | TRUE | DRBF114_yes.f95 |  | 
| 115 | DRB115-forsimd-orig-yes.c | TRUE | DRBF115_yes.f95 |  | 
| 116 | DRB116-target-teams-orig-yes.c | TRUE | DRBF116_yes.f95 |  | 
