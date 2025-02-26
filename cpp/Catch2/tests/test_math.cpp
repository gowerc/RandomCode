
#include <catch2/catch_test_macros.hpp>
#include "math.hpp"

TEST_CASE("Test case for add") {
    REQUIRE(add(1, 2) == 3);
    REQUIRE(add(2, 2) == 4);
}


TEST_CASE("Test case for sub") {
    REQUIRE(sub(1, 2) == -1);
    REQUIRE(sub(1, 1) == 0);
}
