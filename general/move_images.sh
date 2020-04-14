#!/bin/bash
find . -name "*.png" -exec mv "{}" ./images \;

orgmk -r
