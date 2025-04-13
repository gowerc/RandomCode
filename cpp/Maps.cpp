
//
// g++ --std=c++17 -o ./bin/Maps Maps.cpp && ./bin/Maps
//

#include<cstdint>   // for uint64_t
#include<iostream>
#include<vector>
#include<map>
#include<unordered_map>
#include<algorithm>


// cpp map = self balencing binary search tree  needs comparisons "<"
// cpp unorder map = hash table -> bucket
// general recommednation to use unordered_map unless ordering is neededs


struct City {
    std::string name;
    uint64_t population;

};

bool operator==(const City x, const City y) {
    return x.name == y.name;
}
bool operator<(const City x, const City y) {
    return x.population < y.population;
}


namespace std {
    template<>
    struct hash<City> {
        std::size_t operator()(const City &key) const {
            return std::hash<std::string>()(key.name);
        }
    };
}






int main () {

    std::cout << "\n\n---- Map -----\n" << std::endl;
    
    std::map<std::string, City> cities;
    cities["C"] = City{"C", 100};
    cities["A"] = City{"A", 200};
    cities["B"] = City{"B", 300};

    std::cout << cities["B"].name << std::endl;
    std::for_each(
        cities.begin(),
        cities.end(),
        [](std::pair<std::string, City> x) {
            std::cout << x.first << ", " << x.second.population << std::endl;
        }
    );

    // Example showing using City as a key operator< is required for this to work
    std::map<City, int> cities2;
    cities2[City{"A", 100}] = 999;
    cities2[City{"B", 200}] = 888;
    cities2[City{"C", 300}] = 777;
    std::for_each(
        cities2.begin(),
        cities2.end(),
        [](std::pair<City, int> x) {
            std::cout << x.first.name << ", " << x.second << std::endl;
        }
    );
    
    
    std::cout << "\n\n---- Unordered Map -----\n" << std::endl;
    
    std::unordered_map<City, int> ucities;
    // Example showing using a City as a key  std::hash<City>  template struct specalisation
    // is required for this to work
    ucities[City{"A", 100}] = 999;
    ucities[City{"B", 200}] = 888;
    ucities[City{"C", 300}] = 777;
    std::for_each(
        ucities.begin(),
        ucities.end(),
        [](std::pair<City, int> x) {
            std::cout << x.first.name << ", " << x.second << std::endl;
        }
    );

    // Accessing a map via   container["key"]   will insert a default constructed value
    // if no element exists yet at that location
    // In contrast using `.at()` will check to see if the element exists and throw
    // an exception if it doesn't
    // Can check if data exists by using `.find()`, will return map.end() if it doesn't exist
    City& XX = cities["D"];
    XX.name = "NEW CITY";
    std::cout << "XX = " << cities["D"].name << std::endl;
    // cities.at("E").name;

    
    std::cout << "\n\n---- Cpp Structured Binding -----\n" << std::endl;
    // Example of structured binding syntax made available from cpp 17
    for(auto& [city, val]: ucities) {
        std::cout << "City = " << city.name << ", val = " << val << std::endl;
    }

    std::cout << "\n\n---- Regular looping -----\n" << std::endl;
    for(auto& val: ucities) {
        std::cout << "City = " << val.first.name << ", val = " << val.second << std::endl;
    }
}




// namespace std {
//     template<typename T>
//     struct hash {
//         std::size_t operator()(const T &key) const
//     };
// }

