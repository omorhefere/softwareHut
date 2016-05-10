# team6 Research Project Management System

### Description
This is a web based research project management system.

### Initial set up
The database must be seeded in order for it to have an initial admin account, as well as the default categories and subcategories.

The seed file is located in project/db/ and is named ‘seeds.rb.’
To run the seed file:
Open up command line or terminal
Run the command

'bundle exec rake db:seed'

Your database should now contain required default values.

## First login
Default account details are:
Username: admin@sheffield.ac.uk
Password: 12341234

### Special Development Pre-requisites
None.

### Deployment
*QA -> Demo -> Production* using the `epi-deploy` gem.

### Customer Contact
Some Customer <some.customer@epigenesys.co.uk>
