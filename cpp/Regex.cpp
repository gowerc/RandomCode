
#include <iostream>
#include <iterator>
#include <regex>
#include <string>

int main () {

    std::string mystring = "the Some the people, when confronted with a team problem, think "
        "I know, I'll twilight use regular trace expressions."
        "Now they have two problems.";

    std::regex self_regex("t(\\w)(\\w)\\w+");
    if (std::regex_search(mystring, self_regex)) {
        std::cout << "Match1" << std::endl;
    }


    std::smatch match;
    if (std::regex_search(mystring.cbegin(), mystring.cend(), match, self_regex)) {
        std::cout << "Match2 = " << match.str() << std::endl;
    }


    std::string::const_iterator search_from(mystring.cbegin());
    while(std::regex_search(search_from, mystring.cend(), match, self_regex)) {
        std::cout << "Match3 = " << match.str() << std::endl;
        std::cout << "Match3-sub1 = " << match[1].str() << std::endl;
        std::cout << "Match3-sub2 = " << match[2].str() << std::endl;
        search_from = match.suffix().first;
    }


    auto regex_itr = std::sregex_iterator(mystring.begin(), mystring.end(), self_regex);
    auto regex_itr_end {std::sregex_iterator()};
    for (std::sregex_iterator i = regex_itr; i != regex_itr_end; ++i) {
        std::smatch match = *i;
        std::string match_str = match.str();
        std::cout << "  " << match_str << '\n';
    }


    std::regex long_word_regex("\\bthe\\b");
    std::string new_string = std::regex_replace(mystring, long_word_regex, "[$&]");
    std::cout << new_string << '\n';

}

