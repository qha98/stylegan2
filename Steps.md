# Image manipulation

```
gm mogrify -format jpeg -quality 100 *.png
```

# Preparing datasets

```
docker-compose run --rm stylegan2 \
    python dataset_tool.py create_from_images datasets/fauvism images/fauvism


docker-compose run --rm stylegan2 \
    python dataset_tool.py create_from_images_raw datasets/fauvism images/fauvism


```

# Running the training from skratch

```
docker-compose run --rm stylegan2 \
    python run_training.py \
    --num-gpus=8 \
    --data-dir=./datasets \
    --dataset=fauvism \
    --config=config-f \
    --mirror-augment=true

docker-compose run --rm stylegan2 \
    python run_training.py \
    --num-gpus=8 \
    --data-dir=./datasets \
    --dataset=fauvism \
    --config=config-f \
    --mirror-augment=true \
    --metric=none \
    --total-kimg=1000 \
    --min-h=4 \
    --min-w=4 \
    --res-log2=8 \
    --result-dir=./results    
```

# Running the training from existing model

```
docker-compose run --rm stylegan2 \
    python run_training.py \
    --num-gpus=8 \
    --data-dir=./datasets \
    --dataset=fauvism \
    --config=config-f \
    --mirror-augment=true \
    --resume-pkl=./networks/network-snapshot-006746.pkl \
    --resume-kimg=6746
```
