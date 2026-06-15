# sauce_demo_robot_framework
Automated E2E test for SauceDemo covering the full purchase flow from login to order completion.

## Install:
- pip install robotframework
- pip install robotframework-seleniumlibrary
- pip install pyyaml

## How to Run:
- robot tests/E2E.robot

## After run, robotframework will generate:
- report.html — test summary
- log.html — detailed step-by-step log

## Assumptions:
- Test is run on local machine only
- Browser: Google Chrome — ChromeDriver must match the installed Chrome version
- Test account: standard_user / secret_sauce
