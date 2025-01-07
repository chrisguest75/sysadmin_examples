# GPU

Working with GPU in WSL.  

TODO:

* `nvidia-smi` is segfaulting.  Upgrade driver to latest.  

NOTES:

* `nvidia-smi` is shared in from Windows host.  

## Tooling  

```sh
nvidia-smi

/usr/lib/wsl/lib/nvidia-smi
```

```sh
docker run --gpus all nvcr.io/nvidia/k8s/cuda-sample:nbody nbody -gpu -benchmark
```

## Resources

* https://learn.microsoft.com/en-us/windows/ai/directml/gpu-cuda-in-wsl
* https://docs.nvidia.com/cuda/wsl-user-guide/index.html#
* https://github.com/microsoft/WSL/issues/11277