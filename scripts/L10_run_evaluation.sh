# setup environment variables
export SHELL_PATH=$(dirname $(readlink -f $0))
export WORKSPACE=${SHELL_PATH}/..
export CARLA_ROOT=${WORKSPACE}/CARLA_Leaderboard_10
export LEADERBOARD_ROOT=${WORKSPACE}/leaderboard_10/leaderboard
export SCENARIO_RUNNER_ROOT=${WORKSPACE}/leaderboard_10/scenario_runner

export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla
export PYTHONPATH=$PYTHONPATH:${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.10-py3.7-linux-x86_64.egg
export PYTHONPATH=$PYTHONPATH:${LEADERBOARD_ROOT}
export PYTHONPATH=$PYTHONPATH:${SCENARIO_RUNNER_ROOT}
export PYTHONPATH=$PYTHONPATH:${WORKSPACE}

# general parameters
export PORT=2000
export TM_PORT=2500
export DEBUG_CHALLENGE=0

export SCENARIOS=${LEADERBOARD_ROOT}/data/all_towns_traffic_scenarios_public.json
export ROUTES=${LEADERBOARD_ROOT}/data/routes_testing.xml
export ROUTES_SUBSET=0
export REPETITIONS=1

export CHALLENGE_TRACK_CODENAME=SENSORS
export TEAM_AGENT=${WORKSPACE}/team_code/tcp_agent.py
export TEAM_CONFIG=${WORKSPACE}/ckpt/epoch=59-last.ckpt
export CHECKPOINT_ENDPOINT=${WORKSPACE}/logs/log_route_${ROUTES_SUBSET}.json

export RESUME=0

python3 ${LEADERBOARD_ROOT}/leaderboard/leaderboard_evaluator.py \
    --port=${PORT} \
    --trafficManagerPort=${TM_PORT} \
    --scenarios=${SCENARIOS}  \
    --routes=${ROUTES} \
    --routes-subset=${ROUTES_SUBSET} \
    --repetitions=${REPETITIONS} \
    --track=${CHALLENGE_TRACK_CODENAME} \
    --checkpoint=${CHECKPOINT_ENDPOINT} \
    --agent=${TEAM_AGENT} \
    --agent-config=${TEAM_CONFIG} \
    --debug=${DEBUG_CHALLENGE} \
    --resume=${RESUME}
