#!/bin/bash
function codegen() {
    echo "Generating c++ project:" $1
    mkdir $1
    cd $1
    mkdir build
    echo '#include <iostream>
    int main (){
        std::cout<< "hello world" << std::endl;
    }' > $1.m.cpp
    
    echo "cmake_minimum_required (VERSION 3.10)

    # C++version config
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_REQUIRED True)

    project (template)


    add_executable($1.tsk $1.m.cpp)" > CMakeLists.txt 

    echo "Completed"
    cd build
    cmake .. 
    make 
    cd ../..
    }
