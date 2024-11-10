

myfun() {
    echo -e "hi\nthere"
    echo -e "ERROR" >&2
    sleep 1
    echo Hi again
}

myfun2() {
    while read input; do
        echo "$input - $(date +"%H:%M:%S")"
    done
}

myfun3() {
    while read input; do
        echo "$input - :( $(date +"%H:%M:%S")"
    done
}

myfun 2> >(myfun3) | myfun2