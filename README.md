# CRUDAppInstallation
### Installation Script

This script will download some soft, install it and run. Don't have time to put it into Docker, so sorry about that.
It's a frame - too many work undone here. No data validation, no tests, etc. Look, use (as is), ask if you have questions.

### Software
- Maven 3.5
- Git
- Node v8
- Angular CLI
- MySql 5.7 - you need to create a DB: `iversoft` and user: `iversoft` with password: `password`

### Ports
- 4200 - Angular UI (localhost:4200)
- 8080 - micro service RouterService Central API Endpoint (Dynamic balancing and routing)
- 9000 - micro service UserManagementService
- 8600 - Consul DNS
- 8500 - Consul UI (localhost:8500)
- 8301 - Serf LAN
- 8302 - Serf WAN
- 8300 - Consul Leader Server
- 3309 - Mysql

### Install and Run
```
cd ~
git clone git@github.com:testIversoft/CRUDAppInstallation.git 
~/iversoft~/iversoft/install.sh
~/iversoft/utilites/applications.start.sh
```
