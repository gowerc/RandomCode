#include <iostream>
#include <chrono>
#include <date/date.h>
#include <date/tz.h>

void printme(long long x) {
    date::sys_seconds utc_time{std::chrono::seconds(x)};
    date::zoned_time ny_time{"America/New_York", utc_time};
    std::cout << "Local time: " << date::format("%F %T %Z", ny_time) << '\n';
}

int main() {
    date::set_install("./tzdata/tzdata2025a");
    printme(2095940701);
    printme(2127476701);
}
