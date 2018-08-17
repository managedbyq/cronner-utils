# cronner-utils

Do you want to actually get alerted when your crons fail? Then you have come to the right place, my friend.

## Cronner

This repo has some small scripts to help you use [Cronner](https://github.com/theckman/cronner). Cronner is an ex-PagerDuty project that makes it easy to send metrics to DataDog based on the results of running a command.

## Installation

You should install Cronner and the utils in your Dockerfile. See below for instructions for whichever distro your container is using:

For Debian/Ubuntu: 

```
RUN apt-get update && apt-get install -y curl && \
    curl -L -f https://raw.githubusercontent.com/managedbyq/cronner-utils/master/install-cronner-apt.sh | sh
```

## Usage

The main way to use Cronner is through `cronner-wrap`, which gets installed as part of the process above. The first arg to `cronner-wrap` specifies the names and tags of the DataDog metrics we'll create. Everything after the first arg is your command to run.

```
cronner-wrap invoicing.crons:collect_metrics newrelic-admin run-python -m manage publish_metrics
```

See the comments at the top of `cronner-wrap` (in this repo) for more information.

## Metrics and Monitors

The [Invoicing dashboard](https://app.datadoghq.com/dash/376060/invoicing?live=true&page=0&is_auto=false&from_ts=1534529032493&to_ts=1534532632493&tile_size=l) has examples of some graphs you may want to add to track the timing and completion status of your crons.

And [this Invoicing monitor](https://app.datadoghq.com/monitors/6013871) shows how to alert yourself when a cron fails with a non-zero exit code.
