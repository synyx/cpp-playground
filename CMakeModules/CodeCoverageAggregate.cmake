// Kudos: https://github.com/bilke/cmake-modules/issues/8#issuecomment-252254260

FIND_PROGRAM( GENHTML_PATH genhtml )

set(COVERAGE_DIR ${CMAKE_BINARY_DIR}/coverage)

add_custom_target(${PROJECT_NAME}_coverage_dir
    COMMAND ${CMAKE_COMMAND} -E make_directory ${COVERAGE_DIR}
)

add_custom_target(${PROJECT_NAME}_coverage_prep
    COMMAND ${LCOV_PATH} --directory ${CMAKE_BINARY_DIR} --zerocounters

    WORKING_DIRECTORY ${COVERAGE_DIR}
    DEPENDS ${PROJECT_NAME}_coverage_dir
)

add_custom_target(${PROJECT_NAME}_coverage_exec)

add_custom_target(${PROJECT_NAME}_coverage
    COMMAND ${LCOV_PATH} --directory ${CMAKE_BINARY_DIR} --base-directory ${PROJECT_SOURCE_DIR} --capture --output-file ${PROJECT_NAME}.info
    COMMAND ${LCOV_PATH} --extract ${PROJECT_NAME}.info '${PROJECT_SOURCE_DIR}/*' --output-file ${PROJECT_NAME}.info.cleaned
    COMMAND ${GENHTML_PATH} -o ${COVERAGE_DIR} ${PROJECT_NAME}.info.cleaned
    COMMAND ${CMAKE_COMMAND} -E remove ${PROJECT_NAME}.info ${PROJECT_NAME}.info.cleaned

    WORKING_DIRECTORY ${COVERAGE_DIR}
    DEPENDS ${PROJECT_NAME}_coverage_exec
)

ADD_CUSTOM_COMMAND(TARGET ${PROJECT_NAME}_coverage POST_BUILD
    COMMAND ;
    COMMENT "Open ${COVERAGE_DIR}/index.html in your browser to view the coverage report."
)

# Function for adding executables to the coverage analysis

function(coverage_add_exec exec)
    add_custom_target(${PROJECT_NAME}_coverage_exec_${exec}
        COMMAND ${exec}
        WORKING_DIRECTORY ${COVERAGE_DIR}
        DEPENDS ${PROJECT_NAME}_coverage_prep ${exec}
    )
    add_dependencies(${PROJECT_NAME}_coverage_exec ${PROJECT_NAME}_coverage_exec_${exec})
endfunction()