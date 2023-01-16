#!/bin/bash

flutter format `find lib -name "*.g.dart" | xargs | tr '\n' ' '`