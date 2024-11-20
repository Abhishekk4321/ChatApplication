project(ChatApplication)


set(AUTORCC ON)
set(AUTOUIC ON)
set(AUTOMOC ON)

find_package(Qt6 COMPONENTS Quick Qml Core)

if(NOT Qt6_FOUND)
    find_package(Qt5 COMPONENTS Quick Qml Core REQUIRED)
    set(QT_VERSION 5)
else()
    set(QT_VERSION 6)
endif()

qt_add_resources(RESOURCES ${CMAKE_SOURCE_DIR}/ChatApplicationApp/UI/qml.qrc)
set(SOURCES
    ${CMAKE_SOURCE_DIR}/ChatApplicationApp/main.cpp
    ${RESOURCES}
)
add_executable(ChatApplication ${SOURCES})

target_link_libraries(ChatApplication
    Qt${QT_VERSION}::Core
    Qt${QT_VERSION}::Quick
    Qt${QT_VERSION}::Qml
    )

set(QML_PATH "${CMAKE_SOURCE_DIR}/ChatApplicationApp/UI")
target_compile_definitions(ChatApplication PRIVATE QML_PATH="${QML_PATH}")
