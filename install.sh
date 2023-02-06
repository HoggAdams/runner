#!/bin/bash

chmod +x runner*.sh
sudo cp runner.sh /bin/runner
mkdir $HOME/.config/runner/
mv runner*.sh $HOME/.config/runner/
