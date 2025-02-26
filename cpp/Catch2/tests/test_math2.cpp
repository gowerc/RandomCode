
#include <catch2/catch_test_macros.hpp>
#include "math2.hpp"

TEST_CASE("Test case for add") {
    REQUIRE(add2(1, 2) == 3);
    REQUIRE(add2(2, 2) == 4);
}


TEST_CASE("Test case for sub") {
    REQUIRE(sub2(1, 2) == -1);
    REQUIRE(sub2(1, 1) == 0);
}
