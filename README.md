# spim-multiprogramming
Adding a multiprogramming feature to spim mips32 simulator.


Development of a kernel that will support multi- programming, interrupt handling and just a
bit of memory management. 

We developed a part of the kernel that will perform interrupt handling, multiprogramming and context switching. our new kernel will be loaded as an assembly file.

Added features to our new os:

1) New POSIX system calls: **fork**, **waitpid**, **execve**, any other POSIX call that we need. These system
calls are in **syscall.cpp**.
2) Loading multiple programs into memory: Kernel is be able to load multiple programs into memory. This
operation will be a system call.
3) Handling multi-programming: developed a Process Table that will hold the necessary information
about the processes in the memory. 
4) Handling Interrupts: Our simulator generates interrupts, and our kernel handles and responds by modifying
5) Perform Round Robin scheduling: Every time a timer interrupt occurs, there is a chance to make a process switch.
6) Whenever a context scheduling occurs, we print all the information about the processes in process table including but not limited to the entries in the listbelow.

    1. ProcessID
    2. ProcessName,
    3. ProgramCounter
    4. StackPointerAddress


## Life-Cycle
We implement 3 different flavors of MicroKernel(**SPIMOS_GTU_1.s, SPIMOS_GTU_2.s, and
SPIMOS_GTU_3.s**). 90 percent of the code is same between the Micro Kernels. We further explain the details below.
When our kernel is loaded your OS will start a process named init with process id 0. In different Micro Kernels Init process will load programs into memory differently:


1) In the first strategy init process will initialize Process Table, load 3 different programs (listed below) to the
memory start them and will enter an infinite loop until all the processes terminate.
2) Second strategy is randomly choosing one of the programs and loads it into memory 10 times (Same 
II
program 10 different processes), start them and will enter an infinite loop until all the processes terminate.
3) Final Strategy is choosing 2 out 3 programs randomly and loading each program 3 times start them and will
enter an infinite loop until all the processes terminate.

When SPIM starts, it immediately loads the MicroKernel file given by commandline
parameters example:

``` ./spim –efexceptions.s -file SPIMOS_GTU_1.s ```

For every timer interrupt, OS handles the interrupt and perform round robin scheduling.
Our programs finish execution, acknowledge its termination by calling POSIX **PROCESS_EXIT**.
Emulator will shut down only after all the programs in memory terminate.

