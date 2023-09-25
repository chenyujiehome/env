# Install the newest triton version with
# pip install "git+https://github.com/openai/triton.git#egg=triton&subdirectory=python"
import pickle
import math
import torch
import torch.nn as nn
import torch.nn.functional as F
import flash_attn_2_cuda as flash_attn_cuda
from einops import rearrange, repeat

from flash_attn.utils.benchmark import benchmark_all, benchmark_forward, benchmark_backward
from flash_attn.utils.benchmark import benchmark_fwd_bwd, benchmark_combined

from flash_attn import flash_attn_qkvpacked_func

try:
    from triton.ops.flash_attention import attention as attention_triton
except ImportError:
    attention_triton = None

try:
    import xformers.ops as xops
except ImportError:
    xops = None

repeats = 30
device = 'cuda'
dtype = torch.float16

bs_seqlen_vals = [(32, 512), (16, 1024), (8, 2048), (4, 4096), (2, 8192), (1, 16384)]
causal_vals = [False, True]
headdim_vals = [64, 128]
dim = 2048
dropout_p = 0.0
batch_size,seqlen=bs_seqlen_vals[0]
causal=causal_vals[0]
headdim=headdim_vals[1]
nheads=dim//headdim
# q = torch.randn(batch_size, seqlen, nheads, headdim, device=device, dtype=dtype,
#                             requires_grad=True)
# k = torch.randn(batch_size, seqlen, nheads, headdim, device=device, dtype=dtype,
#                             requires_grad=True)
# v = torch.randn(batch_size, seqlen, nheads, headdim, device=device, dtype=dtype,
#                             requires_grad=True)
qkv = torch.randn(batch_size, seqlen, 3,nheads, headdim, device=device, dtype=dtype,
                            requires_grad=True)
# softmax_scale=q.shape[-1]**-0.5
# return_softmax=False
# out, q, k, v, out_padded, softmax_lse, S_dmask, rng_state = flash_attn_cuda.fwd(
#         q, k, v, None, dropout_p, softmax_scale, causal, return_softmax, None
#     )
FA_out=flash_attn_qkvpacked_func(qkv,dropout_p,causal=causal)
print("****end****")