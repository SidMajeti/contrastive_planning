for seed in {0..5}; do
    python run_train.py --env hammer-expert-v1 --seed $seed --lambd 0.1
    if [ $? -ne 0 ]; then
        echo "Error running script1.py with seed $seed"
        exit 1
    fi
    for wypt in $(seq 5 10 30); do
        echo "Running scripts with seed: $seed"

        python run_eval.py --env hammer-expert-v1 --mse --n_wypt $wypt --seed $seed --jobs 1
        python run_plot.py --env hammer-expert-v1 --waypoint_mse --n_wypt $wypt --jobs 1 --seed $seed 
        python run_plot.py --env hammer-expert-v1 --barplot --n_wypt $wypt --jobs 1 --seed $seed 
        python run_plot.py --env hammer-expert-v1 --plot_plan --n_wypt $wypt

        echo "Completed running all scripts with seed: $seed"
    done
done