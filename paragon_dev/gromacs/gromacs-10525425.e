 
/gpfs/paragon/local/apps/Modules/modulefiles/production:/gpfs/paragon/local/apps/Modules/modulefiles/packages:/gpfs/paragon/local/apps/Modules/modulefiles/other:/gpfs/paragon/local/apps/Modules/modulefiles/visualisation:/gpfs/panther/local/apps/Modules/modulefiles/production:/gpfs/panther/local/apps/Modules/modulefiles/packages:/gpfs/panther/local/apps/Modules/modulefiles/other:/gpfs/panther/local/apps/Modules/modulefiles/visualisation:/gpfs/fairthorpe/local/apps/lmod/lmod/modulefiles/Core:/gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps:/gpfs/panther/local/HCP004/pxs01/software/rhel7/modulefiles/apps:/gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps

Currently Loaded Modules:
  1) utilities-gcc   4) xalt/1.1.2    7) openmpi/3.0.1  10) boost/1.65.1
  2) gcc6/6.4.0      5) use.paragon   8) fftw/3.3.8     11) gromacs/2018.4
  3) StdEnv          6) cuda/9.2      9) python3/3.6.0

 


----------- /gpfs/paragon/local/apps/Modules/modulefiles/production ------------
   camfort/0.901          papi-gcc/5.5.1
   clang/3.8.1            papi/5.4.1
   cmake/3.4.1            perl5/5.20.3-thread-multi
   cmake/3.6.2            perl5/5.20.3              (D)
   cmake/3.7.1            pgi/pgi/18.10
   cmake/3.10.2    (D)    pgi/17.4
   cuda/8.0        (D)    pgi/18.10                 (D)
   cuda/9.0               python2/anaconda
   cuda/9.2        (L)    python2/2.7.8             (D)
   gcc/5.4.0              python3/anaconda
   gcc6/6.4.0      (L)    python3/3.6.0             (L,D)
   gcc7/7.1.0             spectrum_mpi/10.1.0
   ibm/13.1.3             swig/3.0.10
   ibm/13.1.5      (D)    utilities
   ibmmpi/xl.debug        utilities-fen
   ibmmpi/xl.perf  (D)    utilities-gcc             (L)
   ibmmpi/xl.trace        xalt/1.1.2                (L)
   java/8.0               xlc/16.1.1.0-180913
   lmod/6.5               xlc/16.1.1.0-181102       (D)
   mysql/5.7.17           xlf/16.1.1.0-180913
   nano/2.5.3             xlf/16.1.1.0-181102       (D)
   ofc/27Oct16

------------ /gpfs/paragon/local/apps/Modules/modulefiles/packages -------------
   amgx-gcc/unstable                  lammps/22Aug18      (D)
   biobuilds/2016.11                  namd/2.12
   caffe/bvlc                         namd/2018_10_10     (D)
   caffe/ibm                   (D)    nltk/3.2.5
   castep/16.11                       openai_gym/0.10.8
   code_saturne-gcc/gpu-beta          opencv-gcc/2.4.0
   code_saturne-gcc/nogpu-beta        openfoam-gcc7/v1806
   code_saturne-gcc/5.0.4      (D)    openfoam-gcc7/5.0   (D)
   dlpoly/4.08                        ranger/1.8.1
   go/1.9.2                           spark/2.1.0.1
   gromacs-gcc/5.1.4                  spark/2.1.1         (D)
   gromacs-gcc/2016.1          (D)    tensorflow/ibm      (D)
   gromacs/2016.1                     tensorflow/1.0.1
   hdf5-parallel-gcc/1.10.2           tensorflow/1.2.1
   keras/1.2.2                        tensorflow/1.4.0
   keras/2.0.3                 (D)    theano/0.9.0
   lammps/17Nov16

-------------- /gpfs/paragon/local/apps/Modules/modulefiles/other --------------
   boost-gcc/1.53.0    ibmpessl/5.2             openmpi-gcc/3.0.0  (g)
   fftw2/2.1.5         mvapich2-gcc/2.2         openmpi-gcc/3.1.2  (g,D)
   fftw3-gcc/3.3.4     mvapich2/2.2             openmpi-pgi/1.10.2 (D)
   fftw3/3.3.5         netcdf/4.3.3             openmpi-pgi/2.1.2
   git/2.9.5           netcdf/4.4.1      (D)    openmpi/2.0.2
   hdf5/1.10.1         node.js/10.10.0
   ibmessl/5.4         openmpi-gcc/2.0.2

---------- /gpfs/paragon/local/apps/Modules/modulefiles/visualisation ----------
   gnuplot/5.2.2         paraview-egl/5.5.2        viz
   paraview-egl/5.5.0    paraview-egl/5.6.0 (D)

------- /gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps -------
   boost/1.65.1 (L)    gromacs/2018.4 (L)    pixman/0.34.0
   fftw/3.3.8   (L)    openmpi/3.0.1  (L)    tcl/8.6.8

  Where:
   D:  Default Module
   L:  Module is loaded
   g:  built for GPU

Use "module spider" to find all possible modules.
Use "module keyword key1 key2 ..." to search for all possible modules matching
any of the "keys".


	general utilities loaded

	GCC-6.4.0 environment now loaded

	CUDA-9.2 loaded

	CUDA-9.2 loaded

        Python 3.6.0 modules are now loaded in your environment.

            Notes:
              - scipy compiled with 3.7.0 lapack
              - For mpi4py use openmpi-gcc
              - For h5py load also hdf5-gcc

Lmod has detected the following error: The following module(s) are unknown:
"use.paragon" "StdEnv"

Please check the spelling or version number. Also try "module spider ..."
It is also possible your cache file is out-of-date; it may help to try:
  $ module --ignore-cache load "use.paragon" "StdEnv"

Also make sure that all modulefiles written in TCL start with the string
#%Module

Executing this command requires loading "StdEnv" which failed while processing
the following module(s):

    Module fullname  Module Filename
    ---------------  ---------------
    gromacs/2018.4   /gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps/gromacs/2018.4Executing this command requires loading "use.paragon" which failed while
processing the following module(s):

    Module fullname  Module Filename
    ---------------  ---------------
    gromacs/2018.4   /gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps/gromacs/2018.4



Currently Loaded Modules:
  1) utilities-gcc   4) xalt/1.1.2    7) openmpi/3.0.1  10) boost/1.65.1
  2) gcc6/6.4.0      5) use.paragon   8) fftw/3.3.8     11) gromacs/2018.4
  3) StdEnv          6) cuda/9.2      9) python3/3.6.0

 

/gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01
 
SCRATCH is /gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/run_gromacs/10525425
 
total 0
drwxr-xr-x 2 rrb67-pxs01 pxs01  4096 Jan  4 13:05 .
drwxr-xr-x 9 rrb67-pxs01 pxs01  4096 Jan  4 13:05 ..
-rw-r--r-- 1 rrb67-pxs01 pxs01 27017 Jan  4 13:05 1aki.pdb.gz
--------------------------------------------------------------------------
WARNING: There are more than one active ports on host 'pge306', but the
default subnet GID prefix was detected on more than one of these
ports.  If these ports are connected to different physical IB
networks, this configuration will fail in Open MPI.  This version of
Open MPI requires that every physically separate IB subnet that is
used between connected MPI processes must have different subnet ID
values.

Please see this FAQ entry for more details:

  http://www.open-mpi.org/faq/?category=openfabrics#ofa-default-subnet-gid

NOTE: You can turn off this warning by setting the MCA parameter
      btl_openib_warn_default_gid_prefix to 0.
--------------------------------------------------------------------------
             :-) GROMACS - gmx_mpi_d, 2018.4 (double precision) (-:

                            GROMACS is written by:
     Emile Apol      Rossen Apostolov      Paul Bauer     Herman J.C. Berendsen
    Par Bjelkmar    Aldert van Buuren   Rudi van Drunen     Anton Feenstra  
  Gerrit Groenhof    Aleksei Iupinov   Christoph Junghans   Anca Hamuraru   
 Vincent Hindriksen Dimitrios Karkoulis    Peter Kasson        Jiri Kraus    
  Carsten Kutzner      Per Larsson      Justin A. Lemkul    Viveca Lindahl  
  Magnus Lundborg   Pieter Meulenhoff    Erik Marklund      Teemu Murtola   
    Szilard Pall       Sander Pronk      Roland Schulz     Alexey Shvetsov  
   Michael Shirts     Alfons Sijbers     Peter Tieleman    Teemu Virolainen 
 Christian Wennberg    Maarten Wolf   
                           and the project leaders:
        Mark Abraham, Berk Hess, Erik Lindahl, and David van der Spoel

Copyright (c) 1991-2000, University of Groningen, The Netherlands.
Copyright (c) 2001-2017, The GROMACS development team at
Uppsala University, Stockholm University and
the Royal Institute of Technology, Sweden.
check out http://www.gromacs.org for more information.

GROMACS is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either version 2.1
of the License, or (at your option) any later version.

GROMACS:      gmx_mpi_d, version 2018.4 (double precision)
Executable:   /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/bin/gmx_mpi_d
Data prefix:  /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4
Working dir:  /gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/run_gromacs/10525425
Command line:
  gmx_mpi_d -h


GROMACS reminds you: "It's So Fast It's Slow" (F. Black)

--------------------------------------------------------------------------
WARNING: There are more than one active ports on host 'pge306', but the
default subnet GID prefix was detected on more than one of these
ports.  If these ports are connected to different physical IB
networks, this configuration will fail in Open MPI.  This version of
Open MPI requires that every physically separate IB subnet that is
used between connected MPI processes must have different subnet ID
values.

Please see this FAQ entry for more details:

  http://www.open-mpi.org/faq/?category=openfabrics#ofa-default-subnet-gid

NOTE: You can turn off this warning by setting the MCA parameter
      btl_openib_warn_default_gid_prefix to 0.
--------------------------------------------------------------------------
            :-) GROMACS - gmx pdb2gmx, 2018.4 (double precision) (-:

                            GROMACS is written by:
     Emile Apol      Rossen Apostolov      Paul Bauer     Herman J.C. Berendsen
    Par Bjelkmar    Aldert van Buuren   Rudi van Drunen     Anton Feenstra  
  Gerrit Groenhof    Aleksei Iupinov   Christoph Junghans   Anca Hamuraru   
 Vincent Hindriksen Dimitrios Karkoulis    Peter Kasson        Jiri Kraus    
  Carsten Kutzner      Per Larsson      Justin A. Lemkul    Viveca Lindahl  
  Magnus Lundborg   Pieter Meulenhoff    Erik Marklund      Teemu Murtola   
    Szilard Pall       Sander Pronk      Roland Schulz     Alexey Shvetsov  
   Michael Shirts     Alfons Sijbers     Peter Tieleman    Teemu Virolainen 
 Christian Wennberg    Maarten Wolf   
                           and the project leaders:
        Mark Abraham, Berk Hess, Erik Lindahl, and David van der Spoel

Copyright (c) 1991-2000, University of Groningen, The Netherlands.
Copyright (c) 2001-2017, The GROMACS development team at
Uppsala University, Stockholm University and
the Royal Institute of Technology, Sweden.
check out http://www.gromacs.org for more information.

GROMACS is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either version 2.1
of the License, or (at your option) any later version.

GROMACS:      gmx pdb2gmx, version 2018.4 (double precision)
Executable:   /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/bin/gmx_mpi_d
Data prefix:  /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4
Working dir:  /gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/run_gromacs/10525425
Command line:
  gmx_mpi_d pdb2gmx -f 1AKI_clean.pdb -o 1AKI_processed.gro -water spce

Opening force field file /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/share/gromacs/top/oplsaa.ff/aminoacids.r2b
WARNING: all CONECT records are ignored
All occupancies are one
Opening force field file /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/share/gromacs/top/oplsaa.ff/atomtypes.atp
Atomtype 1Atomtype 2Atomtype 3Atomtype 4Atomtype 5Atomtype 6Atomtype 7Atomtype 8Atomtype 9Atomtype 10Atomtype 11Atomtype 12Atomtype 13Atomtype 14Atomtype 15Atomtype 16Atomtype 17Atomtype 18Atomtype 19Atomtype 20Atomtype 21Atomtype 22Atomtype 23Atomtype 24Atomtype 25Atomtype 26Atomtype 27Atomtype 28Atomtype 29Atomtype 30Atomtype 31Atomtype 32Atomtype 33Atomtype 34Atomtype 35Atomtype 36Atomtype 37Atomtype 38Atomtype 39Atomtype 40Atomtype 41Atomtype 42Atomtype 43Atomtype 44Atomtype 45Atomtype 46Atomtype 47Atomtype 48Atomtype 49Atomtype 50Atomtype 51Atomtype 52Atomtype 53Atomtype 54Atomtype 55Atomtype 56Atomtype 57Atomtype 58Atomtype 59Atomtype 60Atomtype 61Atomtype 62Atomtype 63Atomtype 64Atomtype 65Atomtype 66Atomtype 67Atomtype 68Atomtype 69Atomtype 70Atomtype 71Atomtype 72Atomtype 73Atomtype 74Atomtype 75Atomtype 76Atomtype 77Atomtype 78Atomtype 79Atomtype 80Atomtype 81Atomtype 82Atomtype 83Atomtype 84Atomtype 85Atomtype 86Atomtype 87Atomtype 88Atomtype 89Atomtype 90Atomtype 91Atomtype 92Atomtype 93Atomtype 94Atomtype 95Atomtype 96Atomtype 97Atomtype 98Atomtype 99Atomtype 100Atomtype 101Atomtype 102Atomtype 103Atomtype 104Atomtype 105Atomtype 106Atomtype 107Atomtype 108Atomtype 109Atomtype 110Atomtype 111Atomtype 112Atomtype 113Atomtype 114Atomtype 115Atomtype 116Atomtype 117Atomtype 118Atomtype 119Atomtype 120Atomtype 121Atomtype 122Atomtype 123Atomtype 124Atomtype 125Atomtype 126Atomtype 127Atomtype 128Atomtype 129Atomtype 130Atomtype 131Atomtype 132Atomtype 133Atomtype 134Atomtype 135Atomtype 136Atomtype 137Atomtype 138Atomtype 139Atomtype 140Atomtype 141Atomtype 142Atomtype 143Atomtype 144Atomtype 145Atomtype 146Atomtype 147Atomtype 148Atomtype 149Atomtype 150Atomtype 151Atomtype 152Atomtype 153Atomtype 154Atomtype 155Atomtype 156Atomtype 157Atomtype 158Atomtype 159Atomtype 160Atomtype 161Atomtype 162Atomtype 163Atomtype 164Atomtype 165Atomtype 166Atomtype 167Atomtype 168Atomtype 169Atomtype 170Atomtype 171Atomtype 172Atomtype 173Atomtype 174Atomtype 175Atomtype 176Atomtype 177Atomtype 178Atomtype 179Atomtype 180Atomtype 181Atomtype 182Atomtype 183Atomtype 184Atomtype 185Atomtype 186Atomtype 187Atomtype 188Atomtype 189Atomtype 190Atomtype 191Atomtype 192Atomtype 193Atomtype 194Atomtype 195Atomtype 196Atomtype 197Atomtype 198Atomtype 199Atomtype 200Atomtype 201Atomtype 202Atomtype 203Atomtype 204Atomtype 205Atomtype 206Atomtype 207Atomtype 208Atomtype 209Atomtype 210Atomtype 211Atomtype 212Atomtype 213Atomtype 214Atomtype 215Atomtype 216Atomtype 217Atomtype 218Atomtype 219Atomtype 220Atomtype 221Atomtype 222Atomtype 223Atomtype 224Atomtype 225Atomtype 226Atomtype 227Atomtype 228Atomtype 229Atomtype 230Atomtype 231Atomtype 232Atomtype 233Atomtype 234Atomtype 235Atomtype 236Atomtype 237Atomtype 238Atomtype 239Atomtype 240Atomtype 241Atomtype 242Atomtype 243Atomtype 244Atomtype 245Atomtype 246Atomtype 247Atomtype 248Atomtype 249Atomtype 250Atomtype 251Atomtype 252Atomtype 253Atomtype 254Atomtype 255Atomtype 256Atomtype 257Atomtype 258Atomtype 259Atomtype 260Atomtype 261Atomtype 262Atomtype 263Atomtype 264Atomtype 265Atomtype 266Atomtype 267Atomtype 268Atomtype 269Atomtype 270Atomtype 271Atomtype 272Atomtype 273Atomtype 274Atomtype 275Atomtype 276Atomtype 277Atomtype 278Atomtype 279Atomtype 280Atomtype 281Atomtype 282Atomtype 283Atomtype 284Atomtype 285Atomtype 286Atomtype 287Atomtype 288Atomtype 289Atomtype 290Atomtype 291Atomtype 292Atomtype 293Atomtype 294Atomtype 295Atomtype 296Atomtype 297Atomtype 298Atomtype 299Atomtype 300Atomtype 301Atomtype 302Atomtype 303Atomtype 304Atomtype 305Atomtype 306Atomtype 307Atomtype 308Atomtype 309Atomtype 310Atomtype 311Atomtype 312Atomtype 313Atomtype 314Atomtype 315Atomtype 316Atomtype 317Atomtype 318Atomtype 319Atomtype 320Atomtype 321Atomtype 322Atomtype 323Atomtype 324Atomtype 325Atomtype 326Atomtype 327Atomtype 328Atomtype 329Atomtype 330Atomtype 331Atomtype 332Atomtype 333Atomtype 334Atomtype 335Atomtype 336Atomtype 337Atomtype 338Atomtype 339Atomtype 340Atomtype 341Atomtype 342Atomtype 343Atomtype 344Atomtype 345Atomtype 346Atomtype 347Atomtype 348Atomtype 349Atomtype 350Atomtype 351Atomtype 352Atomtype 353Atomtype 354Atomtype 355Atomtype 356Atomtype 357Atomtype 358Atomtype 359Atomtype 360Atomtype 361Atomtype 362Atomtype 363Atomtype 364Atomtype 365Atomtype 366Atomtype 367Atomtype 368Atomtype 369Atomtype 370Atomtype 371Atomtype 372Atomtype 373Atomtype 374Atomtype 375Atomtype 376Atomtype 377Atomtype 378Atomtype 379Atomtype 380Atomtype 381Atomtype 382Atomtype 383Atomtype 384Atomtype 385Atomtype 386Atomtype 387Atomtype 388Atomtype 389Atomtype 390Atomtype 391Atomtype 392Atomtype 393Atomtype 394Atomtype 395Atomtype 396Atomtype 397Atomtype 398Atomtype 399Atomtype 400Atomtype 401Atomtype 402Atomtype 403Atomtype 404Atomtype 405Atomtype 406Atomtype 407Atomtype 408Atomtype 409Atomtype 410Atomtype 411Atomtype 412Atomtype 413Atomtype 414Atomtype 415Atomtype 416Atomtype 417Atomtype 418Atomtype 419Atomtype 420Atomtype 421Atomtype 422Atomtype 423Atomtype 424Atomtype 425Atomtype 426Atomtype 427Atomtype 428Atomtype 429Atomtype 430Atomtype 431Atomtype 432Atomtype 433Atomtype 434Atomtype 435Atomtype 436Atomtype 437Atomtype 438Atomtype 439Atomtype 440Atomtype 441Atomtype 442Atomtype 443Atomtype 444Atomtype 445Atomtype 446Atomtype 447Atomtype 448Atomtype 449Atomtype 450Atomtype 451Atomtype 452Atomtype 453Atomtype 454Atomtype 455Atomtype 456Atomtype 457Atomtype 458Atomtype 459Atomtype 460Atomtype 461Atomtype 462Atomtype 463Atomtype 464Atomtype 465Atomtype 466Atomtype 467Atomtype 468Atomtype 469Atomtype 470Atomtype 471Atomtype 472Atomtype 473Atomtype 474Atomtype 475Atomtype 476Atomtype 477Atomtype 478Atomtype 479Atomtype 480Atomtype 481Atomtype 482Atomtype 483Atomtype 484Atomtype 485Atomtype 486Atomtype 487Atomtype 488Atomtype 489Atomtype 490Atomtype 491Atomtype 492Atomtype 493Atomtype 494Atomtype 495Atomtype 496Atomtype 497Atomtype 498Atomtype 499Atomtype 500Atomtype 501Atomtype 502Atomtype 503Atomtype 504Atomtype 505Atomtype 506Atomtype 507Atomtype 508Atomtype 509Atomtype 510Atomtype 511Atomtype 512Atomtype 513Atomtype 514Atomtype 515Atomtype 516Atomtype 517Atomtype 518Atomtype 519Atomtype 520Atomtype 521Atomtype 522Atomtype 523Atomtype 524Atomtype 525Atomtype 526Atomtype 527Atomtype 528Atomtype 529Atomtype 530Atomtype 531Atomtype 532Atomtype 533Atomtype 534Atomtype 535Atomtype 536Atomtype 537Atomtype 538Atomtype 539Atomtype 540Atomtype 541Atomtype 542Atomtype 543Atomtype 544Atomtype 545Atomtype 546Atomtype 547Atomtype 548Atomtype 549Atomtype 550Atomtype 551Atomtype 552Atomtype 553Atomtype 554Atomtype 555Atomtype 556Atomtype 557Atomtype 558Atomtype 559Atomtype 560Atomtype 561Atomtype 562Atomtype 563Atomtype 564Atomtype 565Atomtype 566Atomtype 567Atomtype 568Atomtype 569Atomtype 570Atomtype 571Atomtype 572Atomtype 573Atomtype 574Atomtype 575Atomtype 576Atomtype 577Atomtype 578Atomtype 579Atomtype 580Atomtype 581Atomtype 582Atomtype 583Atomtype 584Atomtype 585Atomtype 586Atomtype 587Atomtype 588Atomtype 589Atomtype 590Atomtype 591Atomtype 592Atomtype 593Atomtype 594Atomtype 595Atomtype 596Atomtype 597Atomtype 598Atomtype 599Atomtype 600Atomtype 601Atomtype 602Atomtype 603Atomtype 604Atomtype 605Atomtype 606Atomtype 607Atomtype 608Atomtype 609Atomtype 610Atomtype 611Atomtype 612Atomtype 613Atomtype 614Atomtype 615Atomtype 616Atomtype 617Atomtype 618Atomtype 619Atomtype 620Atomtype 621Atomtype 622Atomtype 623Atomtype 624Atomtype 625Atomtype 626Atomtype 627Atomtype 628Atomtype 629Atomtype 630Atomtype 631Atomtype 632Atomtype 633Atomtype 634Atomtype 635Atomtype 636Atomtype 637Atomtype 638Atomtype 639Atomtype 640Atomtype 641Atomtype 642Atomtype 643Atomtype 644Atomtype 645Atomtype 646Atomtype 647Atomtype 648Atomtype 649Atomtype 650Atomtype 651Atomtype 652Atomtype 653Atomtype 654Atomtype 655Atomtype 656Atomtype 657Atomtype 658Atomtype 659Atomtype 660Atomtype 661Atomtype 662Atomtype 663Atomtype 664Atomtype 665Atomtype 666Atomtype 667Atomtype 668Atomtype 669Atomtype 670Atomtype 671Atomtype 672Atomtype 673Atomtype 674Atomtype 675Atomtype 676Atomtype 677Atomtype 678Atomtype 679Atomtype 680Atomtype 681Atomtype 682Atomtype 683Atomtype 684Atomtype 685Atomtype 686Atomtype 687Atomtype 688Atomtype 689Atomtype 690Atomtype 691Atomtype 692Atomtype 693Atomtype 694Atomtype 695Atomtype 696Atomtype 697Atomtype 698Atomtype 699Atomtype 700Atomtype 701Atomtype 702Atomtype 703Atomtype 704Atomtype 705Atomtype 706Atomtype 707Atomtype 708Atomtype 709Atomtype 710Atomtype 711Atomtype 712Atomtype 713Atomtype 714Atomtype 715Atomtype 716Atomtype 717Atomtype 718Atomtype 719Atomtype 720Atomtype 721Atomtype 722Atomtype 723Atomtype 724Atomtype 725Atomtype 726Atomtype 727Atomtype 728Atomtype 729Atomtype 730Atomtype 731Atomtype 732Atomtype 733Atomtype 734Atomtype 735Atomtype 736Atomtype 737Atomtype 738Atomtype 739Atomtype 740Atomtype 741Atomtype 742Atomtype 743Atomtype 744Atomtype 745Atomtype 746Atomtype 747Atomtype 748Atomtype 749Atomtype 750Atomtype 751Atomtype 752Atomtype 753Atomtype 754Atomtype 755Atomtype 756Atomtype 757Atomtype 758Atomtype 759Atomtype 760Atomtype 761Atomtype 762Atomtype 763Atomtype 764Atomtype 765Atomtype 766Atomtype 767Atomtype 768Atomtype 769Atomtype 770Atomtype 771Atomtype 772Atomtype 773Atomtype 774Atomtype 775Atomtype 776Atomtype 777Atomtype 778Atomtype 779Atomtype 780Atomtype 781Atomtype 782Atomtype 783Atomtype 784Atomtype 785Atomtype 786Atomtype 787Atomtype 788Atomtype 789Atomtype 790Atomtype 791Atomtype 792Atomtype 793Atomtype 794Atomtype 795Atomtype 796Atomtype 797Atomtype 798Atomtype 799Atomtype 800Atomtype 801Atomtype 802Atomtype 803Atomtype 804Atomtype 805Atomtype 806Atomtype 807Atomtype 808Atomtype 809Atomtype 810Atomtype 811Atomtype 812Atomtype 813Atomtype 814
Opening force field file /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/share/gromacs/top/oplsaa.ff/aminoacids.rtp
Residue 1Residue 2Residue 3Residue 4Residue 5Residue 6Residue 7Residue 8Residue 9Residue 10Residue 11Residue 12Residue 13Residue 14Residue 15Residue 16Residue 17Residue 18Residue 19Residue 20Residue 21Residue 22Residue 23Residue 24Residue 25Residue 26Residue 27Residue 28Residue 29Residue 30Residue 31Residue 32Residue 33Residue 34Residue 35Residue 36Residue 37Residue 38Residue 39Residue 40Residue 41Residue 42Residue 43Residue 44Residue 45Residue 46Residue 47Residue 48Residue 49Residue 50Residue 51
Sorting it all out...
Opening force field file /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/share/gromacs/top/oplsaa.ff/aminoacids.hdb
Opening force field file /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/share/gromacs/top/oplsaa.ff/aminoacids.n.tdb
Opening force field file /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/share/gromacs/top/oplsaa.ff/aminoacids.c.tdb
Analysing hydrogen-bonding network for automated assignment of histidine
 protonation. 213 donors and 184 acceptors were found.
There are 255 hydrogen bonds
Will use HISE for residue 15
8 out of 8 lines of specbond.dat converted successfully
Special Atom Distance matrix:
                    CYS6   MET12   HIS15   CYS30   CYS64   CYS76   CYS80
                    SG48    SD87  NE2118   SG238   SG513   SG601   SG630
   MET12    SD87   1.166
   HIS15  NE2118   1.776   1.019
   CYS30   SG238   1.406   1.054   2.069
   CYS64   SG513   2.835   1.794   1.789   2.241
   CYS76   SG601   2.704   1.551   1.468   2.116   0.765
   CYS80   SG630   2.959   1.951   1.916   2.391   0.199   0.944
   CYS94   SG724   2.550   1.407   1.382   1.975   0.665   0.202   0.855
  MET105   SD799   1.827   0.911   1.683   0.888   1.849   1.461   2.036
  CYS115   SG889   1.576   1.084   2.078   0.200   2.111   1.989   2.262
  CYS127   SG981   0.197   1.072   1.721   1.313   2.799   2.622   2.934
                   CYS94  MET105  CYS115
                   SG724   SD799   SG889
  MET105   SD799   1.381
  CYS115   SG889   1.853   0.790
  CYS127   SG981   2.475   1.686   1.483
Linking CYS-6 SG-48 and CYS-127 SG-981...
Linking CYS-30 SG-238 and CYS-115 SG-889...
Linking CYS-64 SG-513 and CYS-80 SG-630...
Linking CYS-76 SG-601 and CYS-94 SG-724...
Making bonds...
Number of bonds was 1984, now 1984
Generating angles, dihedrals and pairs...
Before cleaning: 5142 pairs
Before cleaning: 5187 dihedrals
Keeping all generated dihedrals
Making cmap torsions...
There are 5187 dihedrals,  426 impropers, 3547 angles
          5106 pairs,     1984 bonds and     0 virtual sites
Total mass 14313.193 a.m.u.
Total charge 8.000 e
Writing topology

Writing coordinate file...

GROMACS reminds you: "The future always gets twisted and turned" (Lisa o Piu)


Select the Force Field:
From '/gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/share/gromacs/top':
 1: AMBER03 protein, nucleic AMBER94 (Duan et al., J. Comp. Chem. 24, 1999-2012, 2003)
 2: AMBER94 force field (Cornell et al., JACS 117, 5179-5197, 1995)
 3: AMBER96 protein, nucleic AMBER94 (Kollman et al., Acc. Chem. Res. 29, 461-469, 1996)
 4: AMBER99 protein, nucleic AMBER94 (Wang et al., J. Comp. Chem. 21, 1049-1074, 2000)
 5: AMBER99SB protein, nucleic AMBER94 (Hornak et al., Proteins 65, 712-725, 2006)
 6: AMBER99SB-ILDN protein, nucleic AMBER94 (Lindorff-Larsen et al., Proteins 78, 1950-58, 2010)
 7: AMBERGS force field (Garcia & Sanbonmatsu, PNAS 99, 2782-2787, 2002)
 8: CHARMM27 all-atom force field (CHARM22 plus CMAP for proteins)
 9: GROMOS96 43a1 force field
10: GROMOS96 43a2 force field (improved alkane dihedrals)
11: GROMOS96 45a3 force field (Schuler JCC 2001 22 1205)
12: GROMOS96 53a5 force field (JCC 2004 vol 25 pag 1656)
13: GROMOS96 53a6 force field (JCC 2004 vol 25 pag 1656)
14: GROMOS96 54a7 force field (Eur. Biophys. J. (2011), 40,, 843-856, DOI: 10.1007/s00249-011-0700-9)
15: OPLS-AA/L all-atom force field (2001 aminoacid dihedrals)

Using the Oplsaa force field in directory oplsaa.ff

Reading 1AKI_clean.pdb...
Read 'LYSOZYME', 1001 atoms
Analyzing pdb file
Splitting chemical chains based on TER records or chain id changing.
There are 1 chains and 0 blocks of water and 129 residues with 1001 atoms

  chain  #res #atoms
  1 'A'   129   1001  

Reading residue database... (oplsaa)
Processing chain 1 'A' (1001 atoms, 129 residues)
Identified residue LYS1 as a starting terminus.
Identified residue LEU129 as a ending terminus.
Start terminus LYS-1: NH3+
End terminus LEU-129: COO-
Checking for duplicate atoms....
Generating any missing hydrogen atoms and/or adding termini.
Now there are 129 residues with 1960 atoms
		--------- PLEASE NOTE ------------
You have successfully generated a topology from: 1AKI_clean.pdb.
The Oplsaa force field and the spce water model are used.
		--------- ETON ESAELP ------------
--------------------------------------------------------------------------
WARNING: There are more than one active ports on host 'pge306', but the
default subnet GID prefix was detected on more than one of these
ports.  If these ports are connected to different physical IB
networks, this configuration will fail in Open MPI.  This version of
Open MPI requires that every physically separate IB subnet that is
used between connected MPI processes must have different subnet ID
values.

Please see this FAQ entry for more details:

  http://www.open-mpi.org/faq/?category=openfabrics#ofa-default-subnet-gid

NOTE: You can turn off this warning by setting the MCA parameter
      btl_openib_warn_default_gid_prefix to 0.
--------------------------------------------------------------------------
           :-) GROMACS - gmx editconf, 2018.4 (double precision) (-:

                            GROMACS is written by:
     Emile Apol      Rossen Apostolov      Paul Bauer     Herman J.C. Berendsen
    Par Bjelkmar    Aldert van Buuren   Rudi van Drunen     Anton Feenstra  
  Gerrit Groenhof    Aleksei Iupinov   Christoph Junghans   Anca Hamuraru   
 Vincent Hindriksen Dimitrios Karkoulis    Peter Kasson        Jiri Kraus    
  Carsten Kutzner      Per Larsson      Justin A. Lemkul    Viveca Lindahl  
  Magnus Lundborg   Pieter Meulenhoff    Erik Marklund      Teemu Murtola   
    Szilard Pall       Sander Pronk      Roland Schulz     Alexey Shvetsov  
   Michael Shirts     Alfons Sijbers     Peter Tieleman    Teemu Virolainen 
 Christian Wennberg    Maarten Wolf   
                           and the project leaders:
        Mark Abraham, Berk Hess, Erik Lindahl, and David van der Spoel

Copyright (c) 1991-2000, University of Groningen, The Netherlands.
Copyright (c) 2001-2017, The GROMACS development team at
Uppsala University, Stockholm University and
the Royal Institute of Technology, Sweden.
check out http://www.gromacs.org for more information.

GROMACS is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either version 2.1
of the License, or (at your option) any later version.

GROMACS:      gmx editconf, version 2018.4 (double precision)
Executable:   /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/bin/gmx_mpi_d
Data prefix:  /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4
Working dir:  /gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/run_gromacs/10525425
Command line:
  gmx_mpi_d editconf -f 1AKI_processed.gro -o 1AKI_newbox.gro -c -d 1.0 -bt cubic


GROMACS reminds you: "AH ....Satisfaction" (IRIX imapd)

--------------------------------------------------------------------------
WARNING: There are more than one active ports on host 'pge306', but the
default subnet GID prefix was detected on more than one of these
ports.  If these ports are connected to different physical IB
networks, this configuration will fail in Open MPI.  This version of
Open MPI requires that every physically separate IB subnet that is
used between connected MPI processes must have different subnet ID
values.

Please see this FAQ entry for more details:

  http://www.open-mpi.org/faq/?category=openfabrics#ofa-default-subnet-gid

NOTE: You can turn off this warning by setting the MCA parameter
      btl_openib_warn_default_gid_prefix to 0.
--------------------------------------------------------------------------
            :-) GROMACS - gmx solvate, 2018.4 (double precision) (-:

                            GROMACS is written by:
     Emile Apol      Rossen Apostolov      Paul Bauer     Herman J.C. Berendsen
    Par Bjelkmar    Aldert van Buuren   Rudi van Drunen     Anton Feenstra  
  Gerrit Groenhof    Aleksei Iupinov   Christoph Junghans   Anca Hamuraru   
 Vincent Hindriksen Dimitrios Karkoulis    Peter Kasson        Jiri Kraus    
  Carsten Kutzner      Per Larsson      Justin A. Lemkul    Viveca Lindahl  
  Magnus Lundborg   Pieter Meulenhoff    Erik Marklund      Teemu Murtola   
    Szilard Pall       Sander Pronk      Roland Schulz     Alexey Shvetsov  
   Michael Shirts     Alfons Sijbers     Peter Tieleman    Teemu Virolainen 
 Christian Wennberg    Maarten Wolf   
                           and the project leaders:
        Mark Abraham, Berk Hess, Erik Lindahl, and David van der Spoel

Copyright (c) 1991-2000, University of Groningen, The Netherlands.
Copyright (c) 2001-2017, The GROMACS development team at
Uppsala University, Stockholm University and
the Royal Institute of Technology, Sweden.
check out http://www.gromacs.org for more information.

GROMACS is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either version 2.1
of the License, or (at your option) any later version.

GROMACS:      gmx solvate, version 2018.4 (double precision)
Executable:   /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/bin/gmx_mpi_d
Data prefix:  /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4
Working dir:  /gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/run_gromacs/10525425
Command line:
  gmx_mpi_d solvate -cp 1AKI_newbox.gro -cs scp216 -o 1AKI_solv.gro -p topol.top

Reading solute configuration
LYSOZYME
Containing 1960 atoms in 129 residues

-------------------------------------------------------
Program:     gmx solvate, version 2018.4
Source file: src/gromacs/utility/datafilefinder.cpp (line 224)
Function:    std::__cxx11::string gmx::DataFileFinder::findFile(const gmx::DataFileOptions&) const

System I/O error:
Library file 'scp216.gro' not found in current dir nor in your GMXLIB path nor
in the default directories.
The following paths were searched:
  /gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/run_gromacs/10525425 (current
dir)

/gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/share/gromacs/top
(default)

For more information and tips for troubleshooting, please check the GROMACS
website at http://www.gromacs.org/Documentation/Errors
-------------------------------------------------------
--------------------------------------------------------------------------
MPI_ABORT was invoked on rank 0 in communicator MPI_COMM_WORLD
with errorcode 1.

NOTE: invoking MPI_ABORT causes Open MPI to kill all MPI processes.
You may or may not see output from other processes, depending on
exactly when Open MPI kills them.
--------------------------------------------------------------------------
--------------------------------------------------------------------------
WARNING: There are more than one active ports on host 'pge306', but the
default subnet GID prefix was detected on more than one of these
ports.  If these ports are connected to different physical IB
networks, this configuration will fail in Open MPI.  This version of
Open MPI requires that every physically separate IB subnet that is
used between connected MPI processes must have different subnet ID
values.

Please see this FAQ entry for more details:

  http://www.open-mpi.org/faq/?category=openfabrics#ofa-default-subnet-gid

NOTE: You can turn off this warning by setting the MCA parameter
      btl_openib_warn_default_gid_prefix to 0.
--------------------------------------------------------------------------
            :-) GROMACS - gmx grompp, 2018.4 (double precision) (-:

                            GROMACS is written by:
     Emile Apol      Rossen Apostolov      Paul Bauer     Herman J.C. Berendsen
    Par Bjelkmar    Aldert van Buuren   Rudi van Drunen     Anton Feenstra  
  Gerrit Groenhof    Aleksei Iupinov   Christoph Junghans   Anca Hamuraru   
 Vincent Hindriksen Dimitrios Karkoulis    Peter Kasson        Jiri Kraus    
  Carsten Kutzner      Per Larsson      Justin A. Lemkul    Viveca Lindahl  
  Magnus Lundborg   Pieter Meulenhoff    Erik Marklund      Teemu Murtola   
    Szilard Pall       Sander Pronk      Roland Schulz     Alexey Shvetsov  
   Michael Shirts     Alfons Sijbers     Peter Tieleman    Teemu Virolainen 
 Christian Wennberg    Maarten Wolf   
                           and the project leaders:
        Mark Abraham, Berk Hess, Erik Lindahl, and David van der Spoel

Copyright (c) 1991-2000, University of Groningen, The Netherlands.
Copyright (c) 2001-2017, The GROMACS development team at
Uppsala University, Stockholm University and
the Royal Institute of Technology, Sweden.
check out http://www.gromacs.org for more information.

GROMACS is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either version 2.1
of the License, or (at your option) any later version.

GROMACS:      gmx grompp, version 2018.4 (double precision)
Executable:   /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4/bin/gmx_mpi_d
Data prefix:  /gpfs/paragon/local/HCP004/pxs01/software/rhel7/apps/gcc6/6.4.0/gromacs/2018.4
Working dir:  /gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/run_gromacs/10525425
Command line:
  gmx_mpi_d grompp -f ions.mdp -c 1AKI_solv.gro -p topol.top -o ions.tpr


-------------------------------------------------------
Program:     gmx grompp, version 2018.4
Source file: src/gromacs/commandline/cmdlineparser.cpp (line 276)
Function:    void gmx::CommandLineParser::parse(int*, char**)

Error in user input:
Invalid command-line options
  In command-line option -f
    File 'ions.mdp' does not exist or is not accessible.
    The file could not be opened.
      Reason: No such file or directory
      (call to fopen() returned error code 2)
  In command-line option -c
    File '1AKI_solv.gro' does not exist or is not accessible.
    The file could not be opened.
      Reason: No such file or directory
      (call to fopen() returned error code 2)

For more information and tips for troubleshooting, please check the GROMACS
website at http://www.gromacs.org/Documentation/Errors
-------------------------------------------------------
--------------------------------------------------------------------------
MPI_ABORT was invoked on rank 0 in communicator MPI_COMM_WORLD
with errorcode 1.

NOTE: invoking MPI_ABORT causes Open MPI to kill all MPI processes.
You may or may not see output from other processes, depending on
exactly when Open MPI kills them.
--------------------------------------------------------------------------
gromacs_ex1 job finished at Fri Jan 4 13:05:09 GMT 2019

------------------------------------------------------------
Sender: LSF System <lsfadmin@pge306>
Subject: Job 10525425: <GE-gromacs_ex1> in cluster <paragon> Done

Job <GE-gromacs_ex1> was submitted from host <hcplogin1> by user <rrb67-pxs01> in cluster <fairthorpe> at Fri Jan  4 13:04:54 2019.
Job was executed on host(s) <pge306>, in queue <fairthorpe>, as user <rrb67-pxs01> in cluster <paragon> at Fri Jan  4 13:04:57 2019.
</gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01> was used as the home directory.
</gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/scripts/getexample/paragon_dev/gromacs> was used as the working directory.
Started at Fri Jan  4 13:04:57 2019.
Terminated at Fri Jan  4 13:05:10 2019.
Results reported at Fri Jan  4 13:05:10 2019.

Your job looked like:

------------------------------------------------------------
# LSBATCH: User input
#!/bin/bash --login 
#BSUB -J GE-gromacs_ex1
#BSUB -o gromacs-%J.e
#BSUB -e gromacs-%J.e
#BSUB -q paragon
#BSUB -n 1
##BSUB -x 
#BSUB -W 00:10
## this is full path to the data file xhelloworld_gnu
#BSUB -data /gpfs/cds/local/HCP004/pxs01/rrb67-pxs01/scripts/getexample/panther_examples/helloC_gnu/helloworld_gnu
#######

echo " "
echo $MODULEPATH

#if [ -d /gpfs/paragon/local/apps/Modules/modulefiles ]; then
#    ls -al /gpfs/paragon/local/apps/Modules/modulefiles 
#else
#    echo $MODULEPATH
#    echo no modules on paragon
#    exit
#fi

data_in=1aki.pdb
# Default loaded compiler module is gcc module.
# To compile with the GNU compiler, load the gcc module in case.
module list 
module avail 
#module swap use.panther use.paragon 
module load gcc6/6.4.0 openmpi/3.0.1 gromacs/2018.4 

# leave in, it lists the environment loaded by the modules
module list

#  Note: LSF_JOBID is a unique number for every job.
#  These are generic variables
echo $PG
EXECUTABLE=gmx_mpi_d
WORKDIR=${PG}/run_gromacs
SCRATCH=$WORKDIR/$LSB_REMOTEJID

###############################################
# Creates a unique directory in the SCRATCH directory for this job to run in.
if [ ! -d $SCRATCH ]; then 
    mkdir -p $SCRATCH 
fi 
echo " "
echo SCRATCH is $SCRATCH
echo " " 
###############################################

(... more ...)
------------------------------------------------------------

Successfully completed.

Resource usage summary:

    CPU time :                                   8.00 sec.
    Max Memory :                                 136 MB
    Average Memory :                             4.00 MB
    Total Requested Memory :                     -
    Delta Memory :                               -
    Max Swap :                                   -
    Max Processes :                              8
    Max Threads :                                12
    Run time :                                   12 sec.
    Turnaround time :                            16 sec.

The output (if any) is above this job summary.

