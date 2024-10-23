vllm serve facebook/opt-125m
vllm serve meta-llama/Llama-2-7b-hf \
    --tensor-parallel-size 2 \
    --pipeline-parallel-size 2

vllm serve meta-llama/Llama-2-70b-hf

vllm serve facebook/opt-13b \
    --tensor-parallel-size 4

vllm serve gpt2 \
    --tensor-parallel-size 4 \
    --pipeline-parallel-size 2


python examples/openai_completion_client.py


python benchmarks/benchmark_serving.py \
    --backend vllm \
    --model meta-llama/Llama-2-7b-hf \
    --dataset-name sharegpt \
    --dataset-path benchmarks/ShareGPT_V3_unfiltered_cleaned_split.json \
    --request-rate 100 \
    --num-prompts 1000
