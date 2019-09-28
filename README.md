# DataRaceBench FORTRAN kernels

These are DataRaceBench 1.2 kernels re-written in FORTRAN in order to work on LLVM-IR based OpenMP data race detection tools.

## Current Status of DataRaceBench FORTRAN kernels
| id  | DataRaceBench v1.2 kernel  | Have race?  | DataRaceBench FORTRAN  | Flang Support  |
|:-:|:-:|:-:|:-:|:-:|
| DRB001-antidep1-orig-yes.c | TRUE | [DRBF001_yes.f95](micro-benchmarks/DRBF001_yes.f95) |  | | 1 | DRB001-antidep1-orig-yes.c | TRUE | DRBF001_yes.f95 |  |  |
| DRB002-antidep1-var-yes.c | TRUE | [DRBF002_yes.f95](micro-benchmarks/DRBF002_yes.f95) |  | | 2 | DRB002-antidep1-var-yes.c | TRUE | DRBF002_yes.f95 |  |  |
| DRB003-antidep2-orig-yes.c | TRUE | [DRBF003_yes.f95](micro-benchmarks/DRBF003_yes.f95) |  | | 3 | DRB003-antidep2-orig-yes.c | TRUE | DRBF003_yes.f95 |  |  |
| DRB004-antidep2-var-yes.c | TRUE | [DRBF004_yes.f95](micro-benchmarks/DRBF004_yes.f95) |  | | 4 | DRB004-antidep2-var-yes.c | TRUE | DRBF004_yes.f95 |  |  |
| DRB005-indirectaccess1-orig-yes.c | TRUE | [](micro-benchmarks/) | Indirect Access | | 5 | DRB005-indirectaccess1-orig-yes.c | TRUE |  |  |  |
| DRB006-indirectaccess2-orig-yes.c | TRUE | [](micro-benchmarks/) | Indirect Access | | 6 | DRB006-indirectaccess2-orig-yes.c | TRUE |  |  |  |
| DRB007-indirectaccess3-orig-yes.c | TRUE | [](micro-benchmarks/) | Indirect Access | | 7 | DRB007-indirectaccess3-orig-yes.c | TRUE |  |  |  |
| DRB008-indirectaccess4-orig-yes.c | TRUE | [](micro-benchmarks/) | Indirect Access | | 8 | DRB008-indirectaccess4-orig-yes.c | TRUE |  |  |  |
| DRB009-lastprivatemissing-orig-yes.c | TRUE | [DRBF009_yes.f95](micro-benchmarks/DRBF009_yes.f95) |  | | 9 | DRB009-lastprivatemissing-orig-yes.c | TRUE | DRBF009_yes.f95 |  |  |
| DRB010-lastprivatemissing-var-yes.c | TRUE | [DRBF010_yes.f95](micro-benchmarks/DRBF010_yes.f95) |  | | 10 | DRB010-lastprivatemissing-var-yes.c | TRUE | DRBF010_yes.f95 |  |  |
| DRB011-minusminus-orig-yes.c | TRUE | [DRBF011_yes.f95](micro-benchmarks/DRBF011_yes.f95) |  | | 11 | DRB011-minusminus-orig-yes.c | TRUE | DRBF011_yes.f95 |  |  |
| DRB012-minusminus-var-yes.c | TRUE | [DRBF012_yes.f95](micro-benchmarks/DRBF012_yes.f95) |  | | 12 | DRB012-minusminus-var-yes.c | TRUE | DRBF012_yes.f95 |  |  |
| DRB013-nowait-orig-yes.c | TRUE | [DRBF013_yes.f95](micro-benchmarks/DRBF013_yes.f95) |  | | 13 | DRB013-nowait-orig-yes.c | TRUE | DRBF013_yes.f95 |  |  |
| DRB014-outofbounds-orig-yes.c | TRUE | [DRBF014_yes.f95](micro-benchmarks/DRBF014_yes.f95) |  | | 14 | DRB014-outofbounds-orig-yes.c | TRUE | DRBF014_yes.f95 |  |  |
| DRB015-outofbounds-var-yes.c | TRUE | [DRBF015_yes.f95](micro-benchmarks/DRBF015_yes.f95) |  | | 15 | DRB015-outofbounds-var-yes.c | TRUE | DRBF015_yes.f95 |  |  |
| DRB016-outputdep-orig-yes.c | TRUE | [DRBF016_yes.f95](micro-benchmarks/DRBF016_yes.f95) |  | | 16 | DRB016-outputdep-orig-yes.c | TRUE | DRBF016_yes.f95 |  |  |
| DRB017-outputdep-var-yes.c | TRUE | [DRBF017_yes.f95](micro-benchmarks/DRBF017_yes.f95) |  | | 17 | DRB017-outputdep-var-yes.c | TRUE | DRBF017_yes.f95 |  |  |
| DRB018-plusplus-orig-yes.c | TRUE | [DRBF018_yes.f95](micro-benchmarks/DRBF018_yes.f95) |  | | 18 | DRB018-plusplus-orig-yes.c | TRUE | DRBF018_yes.f95 |  |  |
| DRB019-plusplus-var-yes.c | TRUE | [DRBF019_yes.f95](micro-benchmarks/DRBF019_yes.f95) |  | | 19 | DRB019-plusplus-var-yes.c | TRUE | DRBF019_yes.f95 |  |  |
| DRB020-privatemissing-var-yes.c | TRUE | [DRBF020_yes.f95](micro-benchmarks/DRBF020_yes.f95) |  | | 20 | DRB020-privatemissing-var-yes.c | TRUE | DRBF020_yes.f95 |  |  |
| DRB021-reductionmissing-orig-yes.c | TRUE | [DRBF021_yes.f95](micro-benchmarks/DRBF021_yes.f95) |  | | 21 | DRB021-reductionmissing-orig-yes.c | TRUE | DRBF021_yes.f95 |  |  |
| DRB022-reductionmissing-var-yes.c | TRUE | [DRBF022_yes.f95](micro-benchmarks/DRBF022_yes.f95) |  | | 22 | DRB022-reductionmissing-var-yes.c | TRUE | DRBF022_yes.f95 |  |  |
| DRB023-sections1-orig-yes.c | TRUE | [DRBF023_yes.f95](micro-benchmarks/DRBF023_yes.f95) |  | | 23 | DRB023-sections1-orig-yes.c | TRUE | DRBF023_yes.f95 |  |  |
| DRB024-simdtruedep-orig-yes.c | TRUE | [DRBF024_yes.f95](micro-benchmarks/DRBF024_yes.f95) |  | | 24 | DRB024-simdtruedep-orig-yes.c | TRUE | DRBF024_yes.f95 |  |  |
| DRB025-simdtruedep-var-yes.c | TRUE | [DRBF025_yes.f95](micro-benchmarks/DRBF025_yes.f95) |  | | 25 | DRB025-simdtruedep-var-yes.c | TRUE | DRBF025_yes.f95 |  |  |
| DRB026-targetparallelfor-orig-yes.c | TRUE | [DRBF026_yes.f95](micro-benchmarks/DRBF026_yes.f95) |  | | 26 | DRB026-targetparallelfor-orig-yes.c | TRUE | DRBF026_yes.f95 |  |  |
| DRB027-taskdependmissing-orig-yes.c | TRUE | [DRBF027_yes.f95](micro-benchmarks/DRBF027_yes.f95) |  | | 27 | DRB027-taskdependmissing-orig-yes.c | TRUE | DRBF027_yes.f95 |  |  |
| DRB028-privatemissing-orig-yes.c | TRUE | [DRBF028_yes.f95](micro-benchmarks/DRBF028_yes.f95) |  | | 28 | DRB028-privatemissing-orig-yes.c | TRUE | DRBF028_yes.f95 |  |  |
| DRB029-truedep1-orig-yes.c | TRUE | [DRBF029_yes.f95](micro-benchmarks/DRBF029_yes.f95) |  | | 29 | DRB029-truedep1-orig-yes.c | TRUE | DRBF029_yes.f95 |  |  |
| DRB030-truedep1-var-yes.c | TRUE | [DRBF030_yes.f95](micro-benchmarks/DRBF030_yes.f95) |  | | 30 | DRB030-truedep1-var-yes.c | TRUE | DRBF030_yes.f95 |  |  |
| DRB031-truedepfirstdimension-orig-yes.c | TRUE | [DRBF031_yes.f95](micro-benchmarks/DRBF031_yes.f95) |  | | 31 | DRB031-truedepfirstdimension-orig-yes.c | TRUE | DRBF031_yes.f95 |  |  |
| DRB032-truedepfirstdimension-var-yes.c | TRUE | [DRBF032_yes.f95](micro-benchmarks/DRBF032_yes.f95) |  | | 32 | DRB032-truedepfirstdimension-var-yes.c | TRUE | DRBF032_yes.f95 |  |  |
| DRB033-truedeplinear-orig-yes.c | TRUE | [DRBF033_yes.f95](micro-benchmarks/DRBF033_yes.f95) |  | | 33 | DRB033-truedeplinear-orig-yes.c | TRUE | DRBF033_yes.f95 |  |  |
| DRB034-truedeplinear-var-yes.c | TRUE | [DRBF034_yes.f95](micro-benchmarks/DRBF034_yes.f95) |  | | 34 | DRB034-truedeplinear-var-yes.c | TRUE | DRBF034_yes.f95 |  |  |
| DRB035-truedepscalar-orig-yes.c | TRUE | [DRBF035_yes.f95](micro-benchmarks/DRBF035_yes.f95) |  | | 35 | DRB035-truedepscalar-orig-yes.c | TRUE | DRBF035_yes.f95 |  |  |
| DRB036-truedepscalar-var-yes.c | TRUE | [DRBF036_yes.f95](micro-benchmarks/DRBF036_yes.f95) |  | | 36 | DRB036-truedepscalar-var-yes.c | TRUE | DRBF036_yes.f95 |  |  |
| DRB037-truedepseconddimension-orig-yes.c | TRUE | [DRBF037_yes.f95](micro-benchmarks/DRBF037_yes.f95) |  | | 37 | DRB037-truedepseconddimension-orig-yes.c | TRUE | DRBF037_yes.f95 |  |  |
| DRB038-truedepseconddimension-var-yes.c | TRUE | [DRBF038_yes.f95](micro-benchmarks/DRBF038_yes.f95) |  | | 38 | DRB038-truedepseconddimension-var-yes.c | TRUE | DRBF038_yes.f95 |  |  |
| DRB039-truedepsingleelement-orig-yes.c | TRUE | [DRBF039_yes.f95](micro-benchmarks/DRBF039_yes.f95) |  | | 39 | DRB039-truedepsingleelement-orig-yes.c | TRUE | DRBF039_yes.f95 |  |  |
| DRB040-truedepsingleelement-var-yes.c | TRUE | [DRBF040_yes.f95](micro-benchmarks/DRBF040_yes.f95) |  | | 40 | DRB040-truedepsingleelement-var-yes.c | TRUE | DRBF040_yes.f95 |  |  |
| DRB041-3mm-parallel-no.c | FALSE | [](micro-benchmarks/) | Parallel 3mm | | 41 | DRB041-3mm-parallel-no.c | FALSE |  |  |  |
| DRB042-3mm-tile-no.c | FALSE | [](micro-benchmarks/) | Tiled 3mm | | 42 | DRB042-3mm-tile-no.c | FALSE |  |  |  |
| DRB043-adi-parallel-no.c | FALSE | [](micro-benchmarks/) | Parallel adi | | 43 | DRB043-adi-parallel-no.c | FALSE |  |  |  |
| DRB044-adi-tile-no.c | FALSE | [](micro-benchmarks/) | Tiled adi | | 44 | DRB044-adi-tile-no.c | FALSE |  |  |  |
| DRB045-doall1-orig-no.c | FALSE | [DRBF045_no.f95](micro-benchmarks/DRBF045_no.f95) |  | | 45 | DRB045-doall1-orig-no.c | FALSE | DRBF045_no.f95 |  |  |
| DRB046-doall2-orig-no.c | FALSE | [DRBF046_no.f95](micro-benchmarks/DRBF046_no.f95) |  | | 46 | DRB046-doall2-orig-no.c | FALSE | DRBF046_no.f95 |  |  |
| DRB047-doallchar-orig-no.c | FALSE | [DRBF047_no.f95](micro-benchmarks/DRBF047_no.f95) |  | | 47 | DRB047-doallchar-orig-no.c | FALSE | DRBF047_no.f95 |  |  |
| DRB048-firstprivate-orig-no.c | FALSE | [DRBF048_no.f95](micro-benchmarks/DRBF048_no.f95) |  | | 48 | DRB048-firstprivate-orig-no.c | FALSE | DRBF048_no.f95 |  |  |
| DRB049-fprintf-orig-no.c | FALSE | [](micro-benchmarks/) | fprintf functionality in Fortran? | | 49 | DRB049-fprintf-orig-no.c | FALSE |  |  |  |
| DRB050-functionparameter-orig-no.c | FALSE | [DRBF050_no.f95](micro-benchmarks/DRBF050_no.f95) |  | | 50 | DRB050-functionparameter-orig-no.c | FALSE | DRBF050_no.f95 |  |  |
| DRB051-getthreadnum-orig-no.c | FALSE | [DRBF051_no.f95](micro-benchmarks/DRBF051_no.f95) |  | | 51 | DRB051-getthreadnum-orig-no.c | FALSE | DRBF051_no.f95 |  |  |
| DRB052-indirectaccesssharebase-orig-no.c | FALSE | [](micro-benchmarks/) | Indirect Access | | 52 | DRB052-indirectaccesssharebase-orig-no.c | FALSE |  |  |  |
| DRB053-inneronly1-orig-no.c | FALSE | [DRBF053_no.f95](micro-benchmarks/DRBF053_no.f95) |  | | 53 | DRB053-inneronly1-orig-no.c | FALSE | DRBF053_no.f95 |  |  |
| DRB054-inneronly2-orig-no.c | FALSE | [DRBF054_no.f95](micro-benchmarks/DRBF054_no.f95) |  | | 54 | DRB054-inneronly2-orig-no.c | FALSE | DRBF054_no.f95 |  |  |
| DRB055-jacobi2d-parallel-no.c | FALSE | [](micro-benchmarks/) | Parallel Jacobi | | 55 | DRB055-jacobi2d-parallel-no.c | FALSE |  |  |  |
| DRB056-jacobi2d-tile-no.c | FALSE | [](micro-benchmarks/) | Tiled Jacobi | | 56 | DRB056-jacobi2d-tile-no.c | FALSE |  |  |  |
| DRB057-jacobiinitialize-orig-no.c | FALSE | [DRBF057_no.f95](micro-benchmarks/DRBF057_no.f95) |  | | 57 | DRB057-jacobiinitialize-orig-no.c | FALSE | DRBF057_no.f95 |  |  |
| DRB058-jacobikernel-orig-no.c | FALSE | [](micro-benchmarks/) | Need to implement | | 58 | DRB058-jacobikernel-orig-no.c | FALSE |  |  |  |
| DRB059-lastprivate-orig-no.c | FALSE | [DRBF059_no.f95](micro-benchmarks/DRBF059_no.f95) |  | | 59 | DRB059-lastprivate-orig-no.c | FALSE | DRBF059_no.f95 |  |  |
| DRB060-matrixmultiply-orig-no.c | FALSE | [DRBF060_no.f95](micro-benchmarks/DRBF060_no.f95) |  | | 60 | DRB060-matrixmultiply-orig-no.c | FALSE | DRBF060_no.f95 |  |  |
| DRB061-matrixvector1-orig-no.c | FALSE | [DRBF061_no.f95](micro-benchmarks/DRBF061_no.f95) |  | | 61 | DRB061-matrixvector1-orig-no.c | FALSE | DRBF061_no.f95 |  |  |
| DRB062-matrixvector2-orig-no.c | FALSE | [DRBF062_no.f95](micro-benchmarks/DRBF062_no.f95) |  | | 62 | DRB062-matrixvector2-orig-no.c | FALSE | DRBF062_no.f95 |  |  |
| DRB063-outeronly1-orig-no.c | FALSE | [DRBF063_no.f95](micro-benchmarks/DRBF063_no.f95) |  | | 63 | DRB063-outeronly1-orig-no.c | FALSE | DRBF063_no.f95 |  |  |
| DRB064-outeronly2-orig-no.c | FALSE | [DRBF064_no.f95](micro-benchmarks/DRBF064_no.f95) |  | | 64 | DRB064-outeronly2-orig-no.c | FALSE | DRBF064_no.f95 |  |  |
| DRB065-pireduction-orig-no.c | FALSE | [DRBF065_no.f95](micro-benchmarks/DRBF065_no.f95) |  | | 65 | DRB065-pireduction-orig-no.c | FALSE | DRBF065_no.f95 |  |  |
| DRB066-pointernoaliasing-orig-no.c | FALSE | [DRBF066_no.f95](micro-benchmarks/DRBF066_no.f95) |  | | 66 | DRB066-pointernoaliasing-orig-no.c | FALSE | DRBF066_no.f95 |  |  |
| DRB067-restrictpointer1-orig-no.c | FALSE | [](micro-benchmarks/) | Indirect Access | | 67 | DRB067-restrictpointer1-orig-no.c | FALSE |  |  |  |
| DRB068-restrictpointer2-orig-no.c | FALSE | [](micro-benchmarks/) | Indirect Access | | 68 | DRB068-restrictpointer2-orig-no.c | FALSE |  |  |  |
| DRB069-sectionslock1-orig-no.c | FALSE | [DRBF069_no.f95](micro-benchmarks/DRBF069_no.f95) |  | | 69 | DRB069-sectionslock1-orig-no.c | FALSE | DRBF069_no.f95 |  |  |
| DRB070-simd1-orig-no.c | FALSE | [DRBF070_no.f95](micro-benchmarks/DRBF070_no.f95) |  | | 70 | DRB070-simd1-orig-no.c | FALSE | DRBF070_no.f95 |  |  |
| DRB071-targetparallelfor-orig-no.c | FALSE | [DRBF071_no.f95](micro-benchmarks/DRBF071_no.f95) |  | | 71 | DRB071-targetparallelfor-orig-no.c | FALSE | DRBF071_no.f95 |  |  |
| DRB072-taskdep1-orig-no.c | FALSE | [](micro-benchmarks/) | Flang does not support | | 72 | DRB072-taskdep1-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, DEPEND, not yet implemented in this version of the compiler. |  |
| DRB073-doall2-orig-yes.c | TRUE | [DRBF073_yes.f95](micro-benchmarks/DRBF073_yes.f95) |  | | 73 | DRB073-doall2-orig-yes.c | TRUE | DRBF073_yes.f95 |  |  |
| DRB074-flush-orig-yes.c | TRUE | [DRBF074_yes.f95](micro-benchmarks/DRBF074_yes.f95) |  | | 74 | DRB074-flush-orig-yes.c | TRUE | DRBF074_yes.f95 |  |  |
| DRB075-getthreadnum-orig-yes.c | TRUE | [DRBF075_yes.f95](micro-benchmarks/DRBF075_yes.f95) |  | | 75 | DRB075-getthreadnum-orig-yes.c | TRUE | DRBF075_yes.f95 |  |  |
| DRB076-flush-orig-no.c | FALSE | [DRBF076_no.f95](micro-benchmarks/DRBF076_no.f95) |  | | 76 | DRB076-flush-orig-no.c | FALSE | DRBF076_no.f95 |  |  |
| DRB077-single-orig-no.c | FALSE | [DRBF077_no.f95](micro-benchmarks/DRBF077_no.f95) |  | | 77 | DRB077-single-orig-no.c | FALSE | DRBF077_no.f95 |  |  |
| DRB078-taskdep2-orig-no.c | FALSE | [](micro-benchmarks/) | Flang does not support | | 78 | DRB078-taskdep2-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, DEPEND, not yet implemented in this version of the compiler. |  |
| DRB079-taskdep3-orig-no.c | FALSE | [](micro-benchmarks/) | Flang does not support | | 79 | DRB079-taskdep3-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, DEPEND, not yet implemented in this version of the compiler. |  |
| DRB080-func-arg-orig-yes.c | TRUE | [DRBF080_yes.f95](micro-benchmarks/DRBF080_yes.f95) |  | | 80 | DRB080-func-arg-orig-yes.c | TRUE | DRBF080_yes.f95 |  |  |
| DRB081-func-arg-orig-no.c | FALSE | [DRBF081_no.f95](micro-benchmarks/DRBF081_no.f95) |  | | 81 | DRB081-func-arg-orig-no.c | FALSE | DRBF081_no.f95 |  |  |
| DRB082-declared-in-func-orig-yes.c | TRUE | [DRBF082_yes.f95](micro-benchmarks/DRBF082_yes.f95) |  | | 82 | DRB082-declared-in-func-orig-yes.c | TRUE | DRBF082_yes.f95 |  |  |
| DRB083-declared-in-func-orig-no.c | FALSE | [DRBF083_no.f95](micro-benchmarks/DRBF083_no.f95) |  | | 83 | DRB083-declared-in-func-orig-no.c | FALSE | DRBF083_no.f95 |  |  |
| DRB084-threadprivatemissing-orig-yes.c | TRUE | [](micro-benchmarks/) | Flang does not support | | 84 | DRB084-threadprivatemissing-orig-yes.c | TRUE |  | error: unable to execute command: Segmentation fault (core dumped) |  |
| DRB085-threadprivate-orig-no.c | FALSE | [](micro-benchmarks/) | Flang does not support | | 85 | DRB085-threadprivate-orig-no.c | FALSE |  | error: unable to execute command: Segmentation fault (core dumped) |  |
| DRB086-static-data-member-orig-yes.cpp | TRUE | [](micro-benchmarks/) | Can we have static members in Fortran? | | 86 | DRB086-static-data-member-orig-yes.cpp | TRUE |  |  |  |
| DRB087-static-data-member2-orig-yes.cpp | TRUE | [](micro-benchmarks/) | Can we have static members in Fortran? | | 87 | DRB087-static-data-member2-orig-yes.cpp | TRUE |  |  |  |
| DRB088-dynamic-storage-orig-yes.c | TRUE | [DRBF088_yes.f95](micro-benchmarks/DRBF088_yes.f95) |  | | 88 | DRB088-dynamic-storage-orig-yes.c | TRUE | DRBF088_yes.f95 |  |  |
| DRB089-dynamic-storage2-orig-yes.c | TRUE | [DRBF089_yes.f95](micro-benchmarks/DRBF089_yes.f95) |  | | 89 | DRB089-dynamic-storage2-orig-yes.c | TRUE | DRBF089_yes.f95 |  |  |
| DRB090-static-local-orig-yes.c | TRUE | [DRBF090_yes.f95](micro-benchmarks/DRBF090_yes.f95) |  | | 90 | DRB090-static-local-orig-yes.c | TRUE | DRBF090_yes.f95 |  |  |
| DRB091-threadprivate2-orig-no.c | FALSE | [DRBF091_no.f95](micro-benchmarks/DRBF091_no.f95) |  | | 91 | DRB091-threadprivate2-orig-no.c | FALSE | DRBF091_no.f95 |  |  |
| DRB092-threadprivatemissing2-orig-yes.c | TRUE | [DRBF092_yes.f95](micro-benchmarks/DRBF092_yes.f95) |  | | 92 | DRB092-threadprivatemissing2-orig-yes.c | TRUE | DRBF092_yes.f95 |  |  |
| DRB093-doall2-collapse-orig-no.c | FALSE | [DRBF093_no.f95](micro-benchmarks/DRBF093_no.f95) |  | | 93 | DRB093-doall2-collapse-orig-no.c | FALSE | DRBF093_no.f95 |  |  |
| DRB094-doall2-ordered-orig-no.c | FALSE | [](micro-benchmarks/) | Flang does not support | | 94 | DRB094-doall2-ordered-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, ORDERED(n), not yet implemented in this version of the compiler. |  |
| DRB095-doall2-taskloop-orig-yes.c | TRUE | [DRBF095_yes.f95](micro-benchmarks/DRBF095_yes.f95) |  | | 95 | DRB095-doall2-taskloop-orig-yes.c | TRUE | DRBF095_yes.f95 |  |  |
| DRB096-doall2-taskloop-collapse-orig-no.c | FALSE | [DRBF096_no.f95](micro-benchmarks/DRBF096_no.f95) |  | | 96 | DRB096-doall2-taskloop-collapse-orig-no.c | FALSE | DRBF096_no.f95 |  |  |
| DRB097-target-teams-distribute-orig-no.c | FALSE | [DRBF097_no.f95](micro-benchmarks/DRBF097_no.f95) |  | | 97 | DRB097-target-teams-distribute-orig-no.c | FALSE | DRBF097_no.f95 |  |  |
| DRB098-simd2-orig-no.c | FALSE | [DRBF098_no.f95](micro-benchmarks/DRBF098_no.f95) |  | | 98 | DRB098-simd2-orig-no.c | FALSE | DRBF098_no.f95 |  |  |
| DRB099-targetparallelfor2-orig-no.c | FALSE | [DRBF099_no.f95](micro-benchmarks/DRBF099_no.f95) |  | | 99 | DRB099-targetparallelfor2-orig-no.c | FALSE | DRBF099_no.f95 |  |  |
| DRB100-task-reference-orig-no.cpp | FALSE | [DRBF100_no.f95](micro-benchmarks/DRBF100_no.f95) |  | | 100 | DRB100-task-reference-orig-no.cpp | FALSE | DRBF100_no.f95 |  |  |
| DRB101-task-value-orig-no.cpp | FALSE | [DRBF101_no.f95](micro-benchmarks/DRBF101_no.f95) |  | | 101 | DRB101-task-value-orig-no.cpp | FALSE | DRBF101_no.f95 |  |  |
| DRB102-copyprivate-orig-no.c | FALSE | [DRBF102_no.f95](micro-benchmarks/DRBF102_no.f95) |  | | 102 | DRB102-copyprivate-orig-no.c | FALSE | DRBF102_no.f95 |  |  |
| DRB103-master-orig-no.c | FALSE | [DRBF103_no.f95](micro-benchmarks/DRBF103_no.f95) |  | | 103 | DRB103-master-orig-no.c | FALSE | DRBF103_no.f95 |  |  |
| DRB104-nowait-barrier-orig-no.c | FALSE | [DRBF104_no.f95](micro-benchmarks/DRBF104_no.f95) |  | | 104 | DRB104-nowait-barrier-orig-no.c | FALSE | DRBF104_no.f95 |  |  |
| DRB105-taskwait-orig-no.c | FALSE | [DRBF105_no.f95](micro-benchmarks/DRBF105_no.f95) |  | | 105 | DRB105-taskwait-orig-no.c | FALSE | DRBF105_no.f95 |  |  |
| DRB106-taskwaitmissing-orig-yes.c | TRUE | [DRBF106_yes.f95](micro-benchmarks/DRBF106_yes.f95) |  | | 106 | DRB106-taskwaitmissing-orig-yes.c | TRUE | DRBF106_yes.f95 |  |  |
| DRB107-taskgroup-orig-no.c | FALSE | [DRBF107_no.f95](micro-benchmarks/DRBF107_no.f95) |  | | 107 | DRB107-taskgroup-orig-no.c | FALSE | DRBF107_no.f95 |  |  |
| DRB108-atomic-orig-no.c | FALSE | [DRBF108_no.f95](micro-benchmarks/DRBF108_no.f95) |  | | 108 | DRB108-atomic-orig-no.c | FALSE | DRBF108_no.f95 |  |  |
| DRB109-orderedmissing-orig-yes.c | TRUE | [DRBF109_yes.f95](micro-benchmarks/DRBF109_yes.f95) |  | | 109 | DRB109-orderedmissing-orig-yes.c | TRUE | DRBF109_yes.f95 |  |  |
| DRB110-ordered-orig-no.c | FALSE | [DRBF110_no.f95](micro-benchmarks/DRBF110_no.f95) |  | | 110 | DRB110-ordered-orig-no.c | FALSE | DRBF110_no.f95 |  |  |
| DRB111-linearmissing-orig-yes.c | TRUE | [DRBF111_yes.f95](micro-benchmarks/DRBF111_yes.f95) |  | | 111 | DRB111-linearmissing-orig-yes.c | TRUE | DRBF111_yes.f95 |  |  |
| DRB112-linear-orig-no.c | FALSE | [](micro-benchmarks/) | Flang does not support | | 112 | DRB112-linear-orig-no.c | FALSE |  | F90-W-0547-OpenMP feature, LINEAR, not yet implemented in this version of the compiler. |  |
| DRB113-default-orig-no.c | FALSE | [DRBF113_no.f95](micro-benchmarks/DRBF113_no.f95) |  | | 113 | DRB113-default-orig-no.c | FALSE | DRBF113_no.f95 |  |  |
| DRB114-if-orig-yes.c | TRUE | [DRBF114_yes.f95](micro-benchmarks/DRBF114_yes.f95) |  | | 114 | DRB114-if-orig-yes.c | TRUE | DRBF114_yes.f95 |  |  |
| DRB115-forsimd-orig-yes.c | TRUE | [DRBF115_yes.f95](micro-benchmarks/DRBF115_yes.f95) |  | | 115 | DRB115-forsimd-orig-yes.c | TRUE | DRBF115_yes.f95 |  |  |
| DRB116-target-teams-orig-yes.c | TRUE | [DRBF116_yes.f95](micro-benchmarks/DRBF116_yes.f95) |  | | 116 | DRB116-target-teams-orig-yes.c | TRUE | DRBF116_yes.f95 |  |  |
