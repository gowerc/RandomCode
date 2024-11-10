import os
import time

# Create two pipes  
parent_conn_read, child_conn_write = os.pipe()
child_conn_read, parent_conn_write = os.pipe()

# Create child process via Linux Fork / Exec
# Child process gets child_pid = 0 
# Parent process gets child_pid = >1
child_pid = os.fork()

print(f"child_pid = {child_pid}")

if child_pid:
    print("I am parent")
    os.close(child_conn_write)
    os.close(child_conn_read)
    print("Sending to child...")
    os.write(parent_conn_write, b"Hello from parent 1!") # <-- (A)
    time.sleep(3)
    os.write(parent_conn_write, b"Hello from parent 2!")
    print("Parent received:", os.read(parent_conn_read, 1024).decode())
else:
    time.sleep(2)
    print("I am child")
    os.close(parent_conn_write)
    os.close(parent_conn_read)
    print("Sending to parent...")
    os.write(child_conn_write, b"Hello from child!")  
    print("Child received:", os.read(child_conn_read, 1024).decode())