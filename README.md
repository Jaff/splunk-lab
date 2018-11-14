
<img src="img/splunk-logo.jpg" width="300" align="right" />

# Splunk Lab

This project lets you stand up a Splunk instance in Docker on a quick and dirty basis.


## Usage

Before running for the first time, make sure you invoke this command:
```
docker network create splunk
```
(Remaining lines from source repository https://github.com/dmuth1/splunk-lab/README.md removed)

## When run for the first time, do this:
```
make shell
```
(after login, do this:)
```
cd splunk_apps
export PATH=/opt/splunk/bin:$PATH
./install.sh
```
Then you will need to logout and do:
```
docker restart splunk-lab
```



