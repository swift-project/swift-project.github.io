---
title: 'Compilers'' C++ feature support'
---

| C++14 feature                      | VS 2019 16.6; cl.exe 19.26.28806 | Ubuntu 16.04 GCC 5.4 | Ubuntu 18.04 GCC 7.4 | Ubuntu 20.04 GCC 9.3 | Xcode 11.5; Apple clang 11.0.3 (LLVM 9.0.0) |
|------------------------------------|----------------------------------|----------------------|----------------------|----------------------|---------------------------------------------|
| Return type deduction              | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| Generic lambdas                    | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| Generalized lambda capture         | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| Variable templates                 | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| Member initializers for aggregates | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| Generalized `constexpr`            | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| `constexpr` for std lib types      | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| `std::integer_sequence`            | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| Minor std lib improvements         | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| More std lib improvements          | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| Shorthand alias traits             | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| Binary literals                    | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |
| Single quote as digit separator    | ✔                                | ✔                    | ✔                    | ✔                    | ✔                                           |


------

| C++17  feature                      | VS 2019 16.6; cl.exe 19.26.28806 | Ubuntu 16.04 GCC 5.4 | Ubuntu 18.04 GCC 7.4 | Ubuntu 20.04 GCC 9.3 | Xcode 11.5; Apple clang 11.0.3 (LLVM 9.0.0) |
|-------------------------------------|----------------------------------|----------------------|----------------------|----------------------|---------------------------------------------|
| Nested namespace definition         | ✔                                |                      | ✔                    | ✔                    | ✔                                           |
| Fold expressions                    | ✔                                |                      | ✔                    | ✔                    | ✔                                           |
| Lambda capture `*this`              | ✔                                |                      |                      | ✔                    | ✔                                           |
| `constexpr` lambdas                 | ✔                                | ½                    | ½                    | ✔                    | ✔                                           |
| Range `for` heterogeneous iterators | ✔                                |                      | ✔                    | ✔                    | ✔                                           |
| `[[fallthrough]]` attribute         | ✔                                |                      |                      | ✔                    | ✔                                           |
| `if constexpr`                      | ✔                                |                      |                      | ✔                    | ✔                                           |
| `if`-init and `switch`-init         | ✔                                |                      |                      | ✔                    | ✔                                           |
| Structured bindings                 | ✔                                |                      |                      | ✔                    | ✔                                           |
| Inline variables                    | ✔                                |                      |                      | ✔                    | ✔                                           |
| `auto` non-type template parameters | ✔                                |                      |                      | ✔                    | ✔                                           |

See also http://en.cppreference.com/w/cpp/compiler_support