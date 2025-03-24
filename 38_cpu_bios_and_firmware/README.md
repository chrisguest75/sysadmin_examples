# CPU

Information on how to understand more about the CPU.  

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/devicons/devicon@v2.15.1/devicon.min.css">

* Core Count
* Hyper-Threading support
* Base Clock Speed
* Max Turbo Speed
* Overclocking Support
* Cache Size (L1, L2, L3)
* Memory Support and Channels
* TDP Rating
* Generation and Micro-architecture
* Socket Type
* Chipset Compatibility
* Integrated Graphics

## Which

### Linux and WSL <i class="devicon-linux-plain"></i>

```sh
# linux 
lscpu
```

### Capabilities

Goto [cpufeatures.h](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/arch/x86/include/asm/cpufeatures.h) in the Linux kernel source.  

### Windows <i class="devicon-windows8-original"></i>

```sh
# in powershell
systeminfo

choco install cpu-z
choco install gpu-z
```

## Resources

* 12 Important Specifications of Processor (CPU) Explained – The Ultimate Guide [here](https://www.binarytides.com/cpu-specs-explained/)
* What do the flags in /proc/cpuinfo mean? [here](https://unix.stackexchange.com/questions/43539/what-do-the-flags-in-proc-cpuinfo-mean)  
