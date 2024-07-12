add_executable(${EXECUTABLE_NAME}
        WIN32 MACOSX_BUNDLE
        src/main.cpp
        ${SUBMODULE_INCLUDE}
        ${APP_ICON}
)

if (${ENABLE_WARNINGS})
    target_set_warnings(${EXECUTABLE_NAME}
    ${ENABLE_WARNINGS}
    ${ENABLE_WARNINGS_AS_ERRORS})
endif ()
