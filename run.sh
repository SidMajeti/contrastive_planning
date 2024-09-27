for seed in {9..12}; do
    echo "Running scripts with seed: $seed"

    python run_train.py --env maze2d-large-v1 --seed $seed --train_steps 500000
    if [ $? -ne 0 ]; then
        echo "Error running script1.py with seed $seed"
        exit 1
    fi

    python run_eval.py --env maze2d-large-v1 --n_wypt 20 --rollout --seed $seed --jobs 1
    python run_plot.py --env maze2d-large-v1 --rollout --seed $seed --jobs 1

    echo "Completed running all scripts with seed: $seed"
done