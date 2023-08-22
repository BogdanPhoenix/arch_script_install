#!/bin/bash

sudo chown -R "$USER" ./*
sudo chgrp -R "$USER" ./*

chmod -R 744 ./*.sh
chmod -R 744 ./GUI/*.sh
chmod -R 744 ./Setting_System/*.sh
