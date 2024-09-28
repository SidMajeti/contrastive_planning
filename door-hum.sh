for seed in {0..0}; do
    # python run_train.py --env door-human-v0 --seed $seed
    # if [ $? -ne 0 ]; then
    #     echo "Error running script1.py with seed $seed"
    #     exit 1
    # fi
    for wypt in $(seq 10 10 30); do
        echo "Running scripts with seed: $seed"

        python run_eval.py --env relocate-human-v1 --mse --n_wypt $wypt --seed $seed --jobs 1
        python run_plot.py --env relocate-human-v1 --waypoint_mse --n_wypt $wypt --jobs 1 --seed $seed 
        python run_plot.py --env relocate-human-v1 --barplot --n_wypt $wypt --jobs 1 --seed $seed 

        echo "Completed running all scripts with seed: $seed"
    done
done