
gcc -o bin/forking forking.c
./bin/forking




gcc -o bin/signals signals.c
./bin/signals &
process_id=$!  # Get the process id of last background process
kill -USR1 $process_id
kill $process_id


gcc -o bin/envvars envvars.c
./bin/envvars





gcc -o bin/floatingpoint floatingpoint.c -g
bin/floatingpoint

