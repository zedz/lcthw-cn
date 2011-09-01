$ CFLAGS="-g" make 1.10-1
cc -g    1.10-1.c   -o 1.10-1
$ valgrind ./1.10-1
==5692== Memcheck, a memory error detector
==5692== Copyright (C) 2002-2010, and GNU GPL'd, by Julian Seward et al.
==5692== Using Valgrind-3.6.0.SVN-Debian and LibVEX; rerun with -h for copyright info
==5692== Command: ./1.10-1
==5692== 
==5692== Invalid read of size 1
==5692==    at 0x400526: copy (1.10-1.c:17)
==5692==    by 0x40058F: main (1.10-1.c:34)
==5692==  Address 0x51b104a is 0 bytes after a block of size 10 alloc'd
==5692==    at 0x4C2815C: malloc (vg_replace_malloc.c:236)
==5692==    by 0x40054C: main (1.10-1.c:25)
==5692== 
==5692== Invalid write of size 1
==5692==    at 0x400529: copy (1.10-1.c:17)
==5692==    by 0x40058F: main (1.10-1.c:34)
==5692==  Address 0x51b109a is 0 bytes after a block of size 10 alloc'd
==5692==    at 0x4C2815C: malloc (vg_replace_malloc.c:236)
==5692==    by 0x40055D: main (1.10-1.c:26)
==5692== 
==5692== Invalid read of size 1
==5692==    at 0x40052B: copy (1.10-1.c:17)
==5692==    by 0x40058F: main (1.10-1.c:34)
==5692==  Address 0x51b109a is 0 bytes after a block of size 10 alloc'd
==5692==    at 0x4C2815C: malloc (vg_replace_malloc.c:236)
==5692==    by 0x40055D: main (1.10-1.c:26)
==5692== 
==5692== 
==5692== HEAP SUMMARY:
==5692==     in use at exit: 20 bytes in 2 blocks
==5692==   total heap usage: 2 allocs, 0 frees, 20 bytes allocated
==5692== 
==5692== LEAK SUMMARY:
==5692==    definitely lost: 0 bytes in 0 blocks
==5692==    indirectly lost: 0 bytes in 0 blocks
==5692==      possibly lost: 0 bytes in 0 blocks
==5692==    still reachable: 20 bytes in 2 blocks
==5692==         suppressed: 0 bytes in 0 blocks
==5692== Rerun with --leak-check=full to see details of leaked memory
==5692== 
==5692== For counts of detected and suppressed errors, rerun with: -v
==5692== ERROR SUMMARY: 3 errors from 3 contexts (suppressed: 4 from 4)
