# ship-backend

## How to run

With an foreign IP and Port 3001

	rails s -b 0.0.0.0 -p 3001

Normal mode and port 3000

	rails s


### Drop and setup DB
	rake db:drop
	rake db:create
	rake db:migrate