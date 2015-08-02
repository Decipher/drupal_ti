#!/bin/bash
# Simple script to install drupal for travis-ci running.

set -e $DRUPAL_TI_DEBUG

# Ensure the right Drupal version is installed.
drupal_ti_ensure_drupal

# Enable simpletest module.
cd "$DRUPAL_TI_DRUPAL_DIR"
drush --yes en simpletest

# Ensure the project is linked into the code base and enabled.
drupal_ti_ensure_project

# Clear caches and run a web server.
drupal_ti_clear_caches
drupal_ti_run_server
