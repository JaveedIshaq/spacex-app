# SpaceX App

<img src="https://raw.githubusercontent.com/JaveedIshaq/spacx-app/4850822068cca37c53fe4a672e4d24ef3a0bd5bc/app-screenshots/1-home.png" width="400"> <img src="https://raw.githubusercontent.com/JaveedIshaq/spacx-app/4850822068cca37c53fe4a672e4d24ef3a0bd5bc/app-screenshots/2-rockets.png" width="400"> <img src="https://raw.githubusercontent.com/JaveedIshaq/spacx-app/4850822068cca37c53fe4a672e4d24ef3a0bd5bc/app-screenshots/3-rocket-detail.png" width="400"> <img src="https://raw.githubusercontent.com/JaveedIshaq/spacx-app/4850822068cca37c53fe4a672e4d24ef3a0bd5bc/app-screenshots/4-crew-members.png" width="400"> <img src="https://raw.githubusercontent.com/JaveedIshaq/spacx-app/4850822068cca37c53fe4a672e4d24ef3a0bd5bc/app-screenshots/5-crew-member-detail-view.png" width="400"> 

<img src="https://raw.githubusercontent.com/JaveedIshaq/spacx-app/4850822068cca37c53fe4a672e4d24ef3a0bd5bc/app-screenshots/code-coverage.png"> 


## Running Tests

To run all unit and widget tests use the following command:

```
$ flutter test --coverage --test-randomize-ordering-seed random

```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report in mac
$ open coverage/index.html

# Open Coverage Report in Ubuntu
$ google-chrome coverage/index.html

```
